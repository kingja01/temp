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
	Log log = LogFactory.getLog("ad_service.jsp");
	
	String action = request.getParameter(ZentertainConfiguration.PARAM_ACTION) == null ? null
			: request.getParameter(ZentertainConfiguration.PARAM_ACTION).trim();
	
	try {
		AdController controller = new AdController();
		if (ZentertainConfiguration.ACTION_INSERT.equals(action)) {
			response.getWriter().append(controller.insert(request).toJSONString());
		} else if (ZentertainConfiguration.ACTION_UPDATE.equals(action)) {			
			response.getWriter().append(controller.update(request).toJSONString());
		} else if (ZentertainConfiguration.ACTION_DELETE.equals(action)) {
			response.getWriter().append(controller.delete(request).toJSONString());
		} else {
			response.getWriter().append("{\"status\":\"false\",\"errorList\":\"" + ZentertainConfiguration.ERROR_UNKNOWN + "\"}");
		}
	} catch(Exception e) {
		log.error(e);
		response.getWriter().append("{\"status\":\"false\",\"errorList\":\"" + ZentertainConfiguration.ERROR_UNKNOWN + "\"}");
	}
%>