<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"
%><%@page import="java.util.Map"
%><%@page import="java.util.HashMap"
%><%@page import="java.util.List"
%><%@page import="java.util.ArrayList"
%><%@page import="java.text.DateFormat"
%><%@page import="java.text.SimpleDateFormat"
%><%@page import="org.apache.commons.logging.Log"
%><%@page import="org.apache.commons.logging.LogFactory"
%><%@page import="com.fasterxml.jackson.core.JsonGenerator"
%><%@page import="com.fasterxml.jackson.core.JsonEncoding"
%><%@page import="com.fasterxml.jackson.databind.ObjectMapper"
%><%@page import="com.common.configuration.*"
%><%@page import="com.zentertain.ad.controller.*"
%><%@page import="com.zentertain.ad.persistence.*"
%><%!
	//application/json
	public static final String FORMAT_DATE = "yyyy-MM-dd HH:mm:ss";
%><%response.setHeader("Cache-Control","no-cache");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader ("Expires", 0);
	Log log = LogFactory.getLog("download_info.jsp");
	
	/* 
	pack_url : 包下载地址根路径
	product : xia.langki.photoedit.iap_tier1 / 0.99, xia.langki.photoedit.iap_tier2 / 1.99
	name：下载包名	
	file_name : 下载zip文件名称（不带.zip后缀）
	description : 下载包描述
	new_flag : 新pack标记 新pack：1，普通：0
	free_flag : 免费标记, 免费：1，收费：0
	frame_type : FrameTypeNormal:0 / FrameTypeTile:1 / FrameTypeCornerAndTile:2
	preview image name : file_name + _preview.png
	preview pack detail image name : file_name + _detail.png
	 */	
	
response.getWriter().append("{\"pack_url\":\"http://192.168.1.158:8080/zentertain/photoedit_download/pack\","
//-----------------------------------------------------  	MASK   	------------------------------------------------------------------//
							+ "\"product\":["
								+ "\"xia.langki.photoedit.iap_tier1\","
								+ "\"xia.langki.photoedit.iap_tier2\""									     					
	 							+ "],"
//-----------------------------------------------------  	MASK   	------------------------------------------------------------------//	 							
							+ "\"mask\":["
								+ "{\"product_id\":\"xia.langki.photoedit.iap_tier1\","
								+ "\"file_name\":\"dm10\","
								+ "\"name\":\"Space light\","
								+ "\"description\":\"Beautiful FX,perfect for your picture!\","
								+ "\"new_flag\":1,"
								+ "\"free_flag\":0},"
								
								+ "{\"product_id\":\"xia.langki.photoedit.iap_tier1\","
								+ "\"file_name\":\"dm20\","
								+ "\"name\":\"Bokeh colorful\","
								+ "\"description\":\"Beautiful FX,perfect for your picture!\","
								+ "\"new_flag\":1,"
								+ "\"free_flag\":0},"
								
								+ "{\"product_id\":\"xia.langki.photoedit.iap_tier1\","
								+ "\"file_name\":\"dm30\","
								+ "\"name\":\"Square\","
								+ "\"description\":\"Beautiful FX,perfect for your picture!\","
								+ "\"new_flag\":1,"
								+ "\"free_flag\":1}"
								
	 							+ "],"





//-----------------------------------------------------  	STICKER   	------------------------------------------------------------------//


    
							+ "\"sticker\":["							
								+ "{\"product_id\":\"xia.langki.photoedit.iap_tier1\","
								+ "\"file_name\":\"ds10\","
								+ "\"name\":\"Doodle\","
								+ "\"description\":\"Beautiful, perfect for your picture!\","
								+ "\"new_flag\":1,"
								+ "\"free_flag\":0},"
								
								+ "{\"product_id\":\"xia.langki.photoedit.iap_tier1\","
								+ "\"file_name\":\"ds20\","
								+ "\"name\":\"Hat\","
								+ "\"description\":\"Beautiful, perfect for your picture!\","
								+ "\"new_flag\":1,"
								+ "\"free_flag\":0},"
								
								+ "{\"product_id\":\"xia.langki.photoedit.iap_tier1\","
								+ "\"file_name\":\"ds30\","
								+ "\"name\":\"Hat\","
								+ "\"description\":\"Beautiful, perfect for your picture!\","
								+ "\"new_flag\":1,"
								+ "\"free_flag\":0},"
								
								+ "{\"product_id\":\"xia.langki.photoedit.iap_tier1\","
								+ "\"file_name\":\"ds40\","
								+ "\"name\":\"Glass\","
								+ "\"description\":\"Beautiful, perfect for your picture!\","
								+ "\"new_flag\":1,"
								+ "\"free_flag\":0},"
								
								+ "{\"product_id\":\"xia.langki.photoedit.iap_tier2\","
								+ "\"file_name\":\"ds50\","
								+ "\"name\":\"Ornament\","
								+ "\"description\":\"Beautiful, perfect for your picture!\","
								+ "\"new_flag\":1,"
								+ "\"free_flag\":0},"
																
								+ "{\"product_id\":\"xia.langki.photoedit.iap_tier2\","
								+ "\"file_name\":\"ds60\","
								+ "\"name\":\"Dialog\","
								+ "\"description\":\"Beautiful, perfect for your picture!\","
								+ "\"new_flag\":1,"
								+ "\"free_flag\":1}"															
								+ "],"
								
								
								
								
//-----------------------------------------------------  	FRAME   	------------------------------------------------------------------//
//frame_type
//FrameTypeNormal : 0
//FrameTypeTile : 1
//FrameTypeCornerAndTile : 2

							+ "\"frame\":["
								+ "{\"product_id\":\"xia.langki.photoedit.iap_tier1\","
								+ "\"file_name\":\"df10\","
								+ "\"name\":\"Olddays\","								
								+ "\"description\":\"Beautiful, perfect for your picture!\","
								+ "\"frame_type\":0,"
								+ "\"new_flag\":1,"
								+ "\"free_flag\":0},"
								
								
								+ "{\"product_id\":\"xia.langki.photoedit.iap_tier1\","
								+ "\"file_name\":\"df20\","
								+ "\"name\":\"Flower\","								
								+ "\"description\":\"Beautiful, perfect for your picture!\","
								+ "\"frame_type\":0,"
								+ "\"new_flag\":1,"
								+ "\"free_flag\":1},"
								
								+ "{\"product_id\":\"xia.langki.photoedit.iap_tier1\","
								+ "\"file_name\":\"df25\","
								+ "\"name\":\"Flower\","								
								+ "\"description\":\"Beautiful, perfect for your picture!\","
								+ "\"frame_type\":0,"
								+ "\"new_flag\":1,"
								+ "\"free_flag\":0},"
								
								+ "{\"product_id\":\"xia.langki.photoedit.iap_tier1\","
								+ "\"file_name\":\"df30\","
								+ "\"name\":\"Doodle\","								
								+ "\"description\":\"Beautiful, perfect for your picture!\","
								+ "\"frame_type\":0,"
								+ "\"new_flag\":1,"
								+ "\"free_flag\":0},"
								
								+ "{\"product_id\":\"xia.langki.photoedit.iap_tier1\","
								+ "\"file_name\":\"df40\","
								+ "\"name\":\"Wehite Les\","								
								+ "\"description\":\"Beautiful, perfect for your picture!\","
								+ "\"frame_type\":0,"
								+ "\"new_flag\":1,"
								+ "\"free_flag\":0},"
								
								+ "{\"product_id\":\"xia.langki.photoedit.iap_tier1\","
								+ "\"file_name\":\"df50\","
								+ "\"name\":\"Metal\","								
								+ "\"description\":\"Beautiful, perfect for your picture!\","
								+ "\"frame_type\":0,"
								+ "\"new_flag\":1,"
								+ "\"free_flag\":1},"
								
								+ "{\"product_id\":\"xia.langki.photoedit.iap_tier1\","
								+ "\"file_name\":\"df60\","
								+ "\"name\":\"Cartoon\","								
								+ "\"description\":\"Beautiful, perfect for your picture!\","
								+ "\"frame_type\":0,"
								+ "\"new_flag\":1,"
								+ "\"free_flag\":1},"
								
								+ "{\"product_id\":\"xia.langki.photoedit.iap_tier1\","
								+ "\"file_name\":\"df70\","
								+ "\"name\":\"Letter\","								
								+ "\"description\":\"Beautiful, perfect for your picture!\","
								+ "\"frame_type\":0,"
								+ "\"new_flag\":1,"
								+ "\"free_flag\":1},"
								
								+ "{\"product_id\":\"xia.langki.photoedit.iap_tier1\","
								+ "\"file_name\":\"df80\","
								+ "\"name\":\"Pattern Edge\","								
								+ "\"description\":\"Beautiful, perfect for your picture!\","
								+ "\"frame_type\":2,"
								+ "\"new_flag\":1,"
								+ "\"free_flag\":0},"
								
								+ "{\"product_id\":\"xia.langki.photoedit.iap_tier1\","
								+ "\"file_name\":\"df90\","
								+ "\"name\":\"Flower Edge\","								
								+ "\"description\":\"Beautiful, perfect for your picture!\","
								+ "\"frame_type\":1,"
								+ "\"new_flag\":1,"
								+ "\"free_flag\":0}"
																
								+ "]}");
%>







<%-- <%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"
%><%@page import="java.util.Map"
%><%@page import="java.util.HashMap"
%><%@page import="java.util.List"
%><%@page import="java.util.ArrayList"
%><%@page import="java.text.DateFormat"
%><%@page import="java.text.SimpleDateFormat"
%><%@page import="org.apache.commons.logging.Log"
%><%@page import="org.apache.commons.logging.LogFactory"
%><%@page import="com.fasterxml.jackson.core.JsonGenerator"
%><%@page import="com.fasterxml.jackson.core.JsonEncoding"
%><%@page import="com.fasterxml.jackson.databind.ObjectMapper"
%><%@page import="com.common.configuration.*"
%><%@page import="com.zentertain.ad.controller.*"
%><%@page import="com.zentertain.ad.persistence.*"
%><%!
	//application/json
	public static final String FORMAT_DATE = "yyyy-MM-dd HH:mm:ss";
%><%response.setHeader("Cache-Control","no-cache");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader ("Expires", 0);
	Log log = LogFactory.getLog("photoedit_download.jsp");
	
	/* 
	iap_id : In app purchase id
	file_name : 下载zip文件名称（不带.zip后缀）
	name : 下载列表显示名称
	description : 下载列表显示copy
	new_flag : 新pack标记
	free_flag : 免费标记
	 */
	
	
	
response.getWriter().append("{\"mask\":["
								+ "{\"name\":\"dm_pattern\"},"
	 							+ "{\"name\":\"dm_square\"}"
	 							+ "],"
    
								+ "\"sticker\":["
								+ "{\"name\":\"ds_s20\"},"
								+ "{\"name\":\"ds_s30\"},"
								+ "{\"name\":\"ds_s32\"},"
								+ "{\"name\":\"ds_s35\"},"
								+ "{\"name\":\"ds_s40\"},"
								+ "{\"name\":\"ds_s45\"},"
								+ "{\"name\":\"ds_s50\"},"
								+ "{\"name\":\"ds_s55\"},"
								+ "{\"name\":\"ds_s60\"}"
								+ "],"

								+ "\"frame\":["
								+ "{\"name\":\"df_cartoon\"},"
								+ "{\"name\":\"df_fugu\"}"
								+ "]}");
%>




 --%>