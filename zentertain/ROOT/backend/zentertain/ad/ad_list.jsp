<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" buffer="none"
%><%@page import="java.util.List"
%><%@page import="com.common.configuration.*"
%><%@page import="com.zentertain.ad.persistence.Ad"
%><%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"
%><%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@taglib prefix="zentertain" uri="http://com.zentertain/tag"
%><%
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader ("Expires", 0);

	String paramBiKeyWord = request.getParameter("paramBiKeyWord");
	String formBiKeyWord = request.getParameter("biKeyWord");
	
	if(formBiKeyWord != null) {
		request.setAttribute("biKeyWord",formBiKeyWord);
		request.setAttribute("paramBiKeyWord",java.net.URLEncoder.encode(formBiKeyWord, "utf-8"));
	} else if(paramBiKeyWord != null) {
		String biKeyWord = new String(paramBiKeyWord.getBytes("ISO-8859-1"), "utf-8");
		request.setAttribute("biKeyWord",java.net.URLDecoder.decode(biKeyWord, "utf-8"));
		request.setAttribute("paramBiKeyWord",biKeyWord);
	}		
%>
<html>
<head>　　 
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
　　 <title>广告管理</title>
	<!-- CSS -->
	<link href="./../../_common/css/transdmin.css" rel="stylesheet" type="text/css" media="screen" />
	<!--[if IE 6]><link rel="stylesheet" type="text/css" media="screen" href="./../../_common/css/ie6.css" /><![endif]-->
	<!--[if IE 7]><link rel="stylesheet" type="text/css" media="screen" href="./../../_common/css/ie7.css" /><![endif]-->
	<script type="text/javascript">var g_path = '<%=request.getContextPath()%>';</script>
	<script type="text/javascript" src="./../../_common/js/jquery-1.7.1.min.js"></script>
	<!-- JavaScripts-->
	<script type="text/javascript" src="./../../_common/js/jNice.js"></script>
	<script type="text/javascript" src="./../../_common/js/ad_list.js"></script>
</head>
<body>
	<div id="wrapper">
		<!--head begin-->
		<jsp:include flush="true" page="/backend/_common/page/head.jsp">
			<jsp:param name="page" value="nav3" />
		</jsp:include>
		<!--head end-->
        
        <div id="containerHolder">
			<div id="container">
        		<div id="sidebar">
                	<ul class="sideNav">                    	
                    	<li><a href="#" class="active">广告管理</a></li>                    	
                    </ul>
                    <!-- // .sideNav -->
                </div>    
                <!-- // #sidebar -->
                
                <!-- h2 stays for breadcrumbs -->
                <h2><a href="#">广告管理</a> &raquo; <a href="#" class="active">广告列表</a></h2>
                <div id="main">
                	<form id="query" action="" method="post">
							<table class="table_head" cellpadding="0" cellspacing="0">
								<tr>
									<td><h3>广告列表</h3></td>
									<td align="right">
										Search by Bundle Identifier&nbsp;<input type="text" name="biKeyWord" value="<c:out value="${biKeyWord}"/>" style="width:100px;">
		                            	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="button" value="查询" class="button" onclick='javascript:$("#query").submit();'/>
		                			</td>
								</tr>
							</table>																			  				
              		</form>
					
                   	<table id="ad_list_table" cellpadding="0" cellspacing="0">
                   		<tr>
                   			<td nowrap="nowrap">App Name</td>
                   			<td nowrap="nowrap">Apple Id</td>
                   			<td nowrap="nowrap">Device Type</td>
                   			<td nowrap="nowrap">Show Type</td>
                   			<td nowrap="nowrap" class="action" width="110">操作</td>
                   		</tr>
                   		
                   		<zentertain:AdList pageSize="10" pageLinksCount="10" biKeyWord="${biKeyWord}">
							<c:choose>
								<c:when test="${!empty zentertainAdList}">									
									<c:forEach var="zentertainAd" items="${zentertainAdList}">
										<tr id="<c:out value="${zentertainAd.id}"/>" class="odd">
											<td><c:out value="${zentertainAd.appName}"/></td>
											<td><c:out value="${zentertainAd.appleId}"/></td>
											<td>
												<c:choose>
													<c:when test="${zentertainAd.deviceType == '0'}">UIUserInterfaceIdiomPhone</c:when>
													<c:when test="${zentertainAd.deviceType == '1'}">UIUserInterfaceIdiomPad</c:when>
													<c:otherwise>Universal</c:otherwise>
												</c:choose>
											</td>
											<td>
												<c:choose>
													<c:when test="${zentertainAd.showType == 'UIAlertView'}">Show alert view first.</c:when>
													<c:when test="${zentertainAd.showType == 'UIWebView'}">Show web view directly.</c:when>
												</c:choose>
											</td>
			                                <td class="action">		                                
												<a href="#info" onclick="editEntity('<c:out value="${zentertainAd.id}"/>',
	                                               									'<c:out value="${zentertainAd.alertId}"/>',
	                                               									'<c:out value="${zentertainAd.bundleIdentifier}"/>',
	                                               									'<c:out value="${zentertainAd.appleId}"/>',
	                                               									'<c:out value="${zentertainAd.appName}"/>',
	                                               									'<c:out value="${zentertainAd.appAlertTitle}"/>',
	                                               									'<c:out value="${zentertainAd.appAlertDescription}"/>',
	                                               									'<c:out value="${zentertainAd.appAlertButtonText}"/>',
	                                               									'<c:out value="${zentertainAd.deviceType}"/>',
	                                               									'<c:out value="${zentertainAd.showType}"/>',
	                                               									'<c:out value="${zentertainAd.actionType}"/>',
	                                               									'<c:out value="${zentertainAd.actionInfo1}"/>',
	                                               									'<c:out value="${zentertainAd.messageTitle}"/>',
	                                               									'<c:out value="${zentertainAd.messageBody}"/>',
	                                               									'<c:out value="${zentertainAd.buttonYesText}"/>',
	                                               									'<c:out value="${zentertainAd.buttonNoText}"/>',
	                                               									'<c:out value="${zentertainAd.showAgain}"/>',
	                                               									'<c:out value="${zentertainAd.forcePush}"/>',
	                	                                                            '<fmt:formatDate value="${zentertainAd.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>',
	                	                                                            '<fmt:formatDate value="${zentertainAd.modifyDate}" pattern="yyyy-MM-dd HH:mm:ss"/>')"
	                     	                                                        class="edit">修改</a>
	                     	                    <a href="#" onclick="resetAlertId('<c:out value="${zentertainAd.id}"/>','ad_controller.jsp')" class="delete">重置</a>
											    <a href="#" onclick="deleteEntity('<c:out value="${zentertainAd.id}"/>','ad_controller.jsp')" class="delete">删除</a>
			                                </td>
			                            </tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr><td style='text-align: center' colspan="5">该页没有记录！</td></tr>
								</c:otherwise>
							</c:choose>
						</zentertain:AdList>
					</table>
					<!-- pagination div -->
					<div class="sabrosus">
						<script type="text/javascript">
							var currentPageNo = get_url_param('page');
							if(!currentPageNo.match(/^\d+$/)) { currentPageNo = 1; }
							var biKeyWord = '<c:out value="${paramBiKeyWord}"/>';							
							var pageCount = <c:out value="${pageCount}"/>;
							jQuery(document).ready(function(){
								jQuery("#firstPage").attr("href",window.location.pathname + "?page=1&paramBiKeyWord=" + biKeyWord);
								jQuery("#lastPage").attr("href",window.location.pathname + "?page="+ pageCount +"&paramBiKeyWord=" + biKeyWord);
								//currentPageNo
								if(currentPageNo == 1)
									jQuery("#firstPageDiv").html("&lt;").attr("class","disabled");
								if(currentPageNo == pageCount)
									jQuery("#lastPageDiv").html("&gt;").attr("class","disabled");
							});
						</script>
						<c:if test="${pageCount > 1}">
							<span id="firstPageDiv"><a id="firstPage" href="javascript:void(0);" target="_self">&lt;</a></span>
							<c:forEach var="links" items="${pageLinks}">
								<c:choose>
									<c:when test="${links.order eq param.page}">
										<span class="current"><c:out value="${links.order}"/></span>
									</c:when>
									<c:when test="${links.order == 1 && empty param.page}">
										<span class="current"><c:out value="${links.order}"/></span>
									</c:when>
									<c:otherwise>
										<a href="${links.href}&paramBiKeyWord=${paramBiKeyWord}" id="page_link_<c:out value="${links.order}" />" target="_self"><c:out value="${links.order}"/></a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<span id="lastPageDiv"><a id="lastPage" href="javascript:void(0);" target="_self">&gt;</a></span>
						</c:if>
					</div>
					<!-- pagination div -->

					<form id="myform" name="myform" action="" class="jNice" method="post">
						<h3>添加/修改广告</h3>
						<input type="hidden" id="action" name="action" value="insert">
						<input type="hidden" id="id" name="id">						
                    	<fieldset>                        	
                        	<p><span id="alertId">Alert Id:</span></p>
                        	<p><label>Bundle Identifier:</label><input id="bundleIdentifier" type="text"  name="bundleIdentifier" class="text-long"/></p>
                        	<p><label>Apple Id:</label><input id="appleId" type="text"  name="appleId" class="text-long"/></p>
                        	<p><label>App Name:</label><input id="appName" type="text"  name="appName" class="text-long"/></p>                        	
                        	<p><label>App Alert Title:</label><input id="appAlertTitle" type="text"  name="appAlertTitle" class="text-long"/></p>
                            <p><label>App Alert Description:</label><input id="appAlertDescription" type="text"  name="appAlertDescription" class="text-long"/></p>
                            <p><label>App Alert Button Text:</label><input id="appAlertButtonText" type="text"  name="appAlertButtonText" class="text-long"/></p>
                        	<p><label>Device Type:</label>
                        		<select id="deviceType" name="deviceType" style="width:265px;">
                        			<option value="">请选择</option>
                        			<option value="0">UIUserInterfaceIdiomPhone</option>
	                            	<option value="1">UIUserInterfaceIdiomPad</option>
	                            	<option value="9">Universal</option>
                            	</select>
                            </p>
                            <p><label>Show Type:</label>
                        		<select id="showType" name="showType" style="width:265px;">
                        			<option value="">请选择</option>
                        			<option value="UIAlertView">Show alert view first.</option>
	                            	<option value="UIWebView">Show web view directly.</option>	                            	
                            	</select>
                            </p>
                            <p><label>Force Push:</label>
                        		<select id="forcePush" name="forcePush" style="width:265px;">
                        			<option value="">请选择</option>
                        			<option value="1">Yes</option>
	                            	<option value="0">No</option>	                            	
                            	</select>
                            </p>
                            <p><label>Show Again:</label>
                        		<select id="showAgain" name="showAgain" style="width:265px;">
                        			<option value="">请选择</option>
                        			<option value="1">Yes</option>
	                            	<option value="0">No</option>	                            	
                            	</select>
                            </p>
                            <p><label>Action Type:</label>
                        		<select id="actionType" name="actionType" style="width:265px;">
                        			<option value="">请选择</option>
                        			<option value="open-url">open-url</option>	                            	
                            	</select>
                            </p>
                            <p><label>Action-info-1(URL):</label><input id="actionInfo1" type="text"  name="actionInfo1" class="text-long"/></p>
                            <p><label>Message Title:</label><input id="messageTitle" type="text"  name="messageTitle" class="text-long"/></p>
                            <p><label>Message Body:</label><input id="messageBody" type="text"  name="messageBody" class="text-long"/></p>
                            <p><label>Button Yes Text:</label><input id="buttonYesText" type="text"  name="buttonYesText" class="text-long"/></p>
                            <p><label>Button No Text:</label><input id="buttonNoText" type="text"  name="buttonNoText" class="text-long"/></p>

                        	<p><span id="createDate"></span></p>
                        	<p><span id="modifyDate"></span></p>
                            <input id="saveOrUpdate" type="button" value="提交" class="button" onclick="submitFunction('<%=request.getContextPath()%>/backend/zentertain/ad/ad_controller.jsp')"/>
                        </fieldset>
                    </form>
                </div>
                <!-- // #main -->
                <div class="clear"></div>
            </div>
            <!-- // #container -->
        </div>
        <!-- // #containerHolder -->
        
        <!--footer begin-->
		<jsp:include flush="false" page="/backend/_common/page/footer.jsp" />
		<!--footer end-->
    </div>
    <!-- // #wrapper -->
    <iframe id="iframe_window" name="iframe_window" src="about:blank" scrolling="no" width="1" height="1" frameborder="0" style="display:none;"></iframe>
</body>
</html>