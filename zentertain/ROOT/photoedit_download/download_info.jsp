<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"
%><%@page import="org.apache.commons.logging.Log"
%><%@page import="org.apache.commons.logging.LogFactory"
%><%!
	//application/json
	public static final String FORMAT_DATE = "yyyy-MM-dd HH:mm:ss";
%><%response.setHeader("Cache-Control","no-cache");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader ("Expires", 0);
	Log log = LogFactory.getLog("download_info.jsp");
	
	/* 
	pack_url : 包下载地址根路径
	product : iap_tier1 / 0.99, iap_tier2 / 1.99
	name：下载包名	
	file_name : 下载zip文件名称（不带.zip后缀）
	description : 下载包描述
	new_flag : 新pack标记 新pack：1，普通：0
	free_flag : 免费标记, 免费：1，收费：0
	frame_type : FrameTypeNormal:0 / FrameTypeTile:1 / FrameTypeCornerAndTile:2
	preview image name : file_name + _preview.png
	preview pack detail image name : file_name + _detail.png
	 */	
response.getWriter().append("{\"pack_url\":\"http://adserver.tuanguwen.com/photoedit_download/pack\","
//response.getWriter().append("{\"pack_url\":\"http://192.168.1.111:8080/zentertain/photoedit_download/pack\","
//-----------------------------------------------------  	MASK   	------------------------------------------------------------------//
							+ "\"product\":["
								+ "\"iap_tier1\","
								+ "\"iap_tier2\""									     					
	 							+ "],"
//-----------------------------------------------------  	MASK   	------------------------------------------------------------------//	 							
							+ "\"mask\":["
								+ "{\"product_id\":\"iap_tier1\","
								+ "\"file_name\":\"dm10\","
								+ "\"name\":\"Space light\","
								+ "\"description\":\"Beautiful FX,perfect for your picture!\","
								+ "\"new_flag\":1,"
								+ "\"free_flag\":0},"
								
								+ "{\"product_id\":\"iap_tier1\","
								+ "\"file_name\":\"dm20\","
								+ "\"name\":\"Bokeh colorful\","
								+ "\"description\":\"Beautiful FX,perfect for your picture!\","
								+ "\"new_flag\":1,"
								+ "\"free_flag\":0},"
								
								+ "{\"product_id\":\"iap_tier1\","
								+ "\"file_name\":\"dm30\","
								+ "\"name\":\"Square\","
								+ "\"description\":\"Beautiful FX,perfect for your picture!\","
								+ "\"new_flag\":1,"
								+ "\"free_flag\":1}"
								
	 							+ "],"





//-----------------------------------------------------  	STICKER   	------------------------------------------------------------------//


    
							+ "\"sticker\":["							
								+ "{\"product_id\":\"iap_tier1\","
								+ "\"file_name\":\"ds10\","
								+ "\"name\":\"Doodle\","
								+ "\"description\":\"Beautiful, perfect for your picture!\","
								+ "\"new_flag\":1,"
								+ "\"free_flag\":0},"
								
								+ "{\"product_id\":\"iap_tier1\","
								+ "\"file_name\":\"ds20\","
								+ "\"name\":\"Hat\","
								+ "\"description\":\"Beautiful, perfect for your picture!\","
								+ "\"new_flag\":1,"
								+ "\"free_flag\":0},"
								
								+ "{\"product_id\":\"iap_tier1\","
								+ "\"file_name\":\"ds30\","
								+ "\"name\":\"Hat\","
								+ "\"description\":\"Beautiful, perfect for your picture!\","
								+ "\"new_flag\":1,"
								+ "\"free_flag\":0},"
								
								+ "{\"product_id\":\"iap_tier1\","
								+ "\"file_name\":\"ds40\","
								+ "\"name\":\"Glass\","
								+ "\"description\":\"Beautiful, perfect for your picture!\","
								+ "\"new_flag\":1,"
								+ "\"free_flag\":0},"
								
								+ "{\"product_id\":\"iap_tier1\","
								+ "\"file_name\":\"ds50\","
								+ "\"name\":\"Ornament\","
								+ "\"description\":\"Beautiful, perfect for your picture!\","
								+ "\"new_flag\":1,"
								+ "\"free_flag\":0},"
																
								+ "{\"product_id\":\"iap_tier1\","
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
								+ "{\"product_id\":\"iap_tier1\","
								+ "\"file_name\":\"df10\","
								+ "\"name\":\"Olddays\","								
								+ "\"description\":\"Beautiful, perfect for your picture!\","
								+ "\"frame_type\":0,"
								+ "\"new_flag\":1,"
								+ "\"free_flag\":0},"
								
								
								+ "{\"product_id\":\"iap_tier1\","
								+ "\"file_name\":\"df20\","
								+ "\"name\":\"Flower\","								
								+ "\"description\":\"Beautiful, perfect for your picture!\","
								+ "\"frame_type\":0,"
								+ "\"new_flag\":1,"
								+ "\"free_flag\":1},"
								
								+ "{\"product_id\":\"iap_tier1\","
								+ "\"file_name\":\"df25\","
								+ "\"name\":\"Flower\","								
								+ "\"description\":\"Beautiful, perfect for your picture!\","
								+ "\"frame_type\":0,"
								+ "\"new_flag\":1,"
								+ "\"free_flag\":0},"
								
								+ "{\"product_id\":\"iap_tier1\","
								+ "\"file_name\":\"df30\","
								+ "\"name\":\"Doodle\","								
								+ "\"description\":\"Beautiful, perfect for your picture!\","
								+ "\"frame_type\":0,"
								+ "\"new_flag\":1,"
								+ "\"free_flag\":0},"
								
								+ "{\"product_id\":\"iap_tier1\","
								+ "\"file_name\":\"df40\","
								+ "\"name\":\"Wehite Les\","								
								+ "\"description\":\"Beautiful, perfect for your picture!\","
								+ "\"frame_type\":0,"
								+ "\"new_flag\":1,"
								+ "\"free_flag\":0},"
								
								+ "{\"product_id\":\"iap_tier1\","
								+ "\"file_name\":\"df50\","
								+ "\"name\":\"Metal\","								
								+ "\"description\":\"Beautiful, perfect for your picture!\","
								+ "\"frame_type\":0,"
								+ "\"new_flag\":1,"
								+ "\"free_flag\":1},"
								
								+ "{\"product_id\":\"iap_tier1\","
								+ "\"file_name\":\"df60\","
								+ "\"name\":\"Cartoon\","								
								+ "\"description\":\"Beautiful, perfect for your picture!\","
								+ "\"frame_type\":0,"
								+ "\"new_flag\":1,"
								+ "\"free_flag\":1},"
								
								+ "{\"product_id\":\"iap_tier1\","
								+ "\"file_name\":\"df70\","
								+ "\"name\":\"Letter\","								
								+ "\"description\":\"Beautiful, perfect for your picture!\","
								+ "\"frame_type\":0,"
								+ "\"new_flag\":1,"
								+ "\"free_flag\":1},"
								
								+ "{\"product_id\":\"iap_tier1\","
								+ "\"file_name\":\"df80\","
								+ "\"name\":\"Pattern Edge\","								
								+ "\"description\":\"Beautiful, perfect for your picture!\","
								+ "\"frame_type\":2,"
								+ "\"new_flag\":1,"
								+ "\"free_flag\":0},"
								
								+ "{\"product_id\":\"iap_tier1\","
								+ "\"file_name\":\"df90\","
								+ "\"name\":\"Flower Edge\","								
								+ "\"description\":\"Beautiful, perfect for your picture!\","
								+ "\"frame_type\":1,"
								+ "\"new_flag\":1,"
								+ "\"free_flag\":0}"
																
								+ "]}");								
%>