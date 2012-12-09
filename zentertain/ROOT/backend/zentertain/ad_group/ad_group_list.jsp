<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" buffer="none"
%><%@page import="java.util.List"
%><%@page import="java.util.Iterator"
%><%@page import="com.common.configuration.*"
%><%@page import="com.zentertain.ad.controller.AdController"
%><%@page import="com.zentertain.ad.controller.AdGroupController"
%><%@page import="com.zentertain.ad.persistence.Ad"
%><%@page import="com.zentertain.ad.persistence.AdGroup"
%><%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"
%><%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@taglib prefix="zentertain" uri="http://com.zentertain/tag"
%><%
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader ("Expires", 0);
	
	String paramNameKeyWord = request.getParameter("paramNameKeyWord");
	String formNameKeyWord = request.getParameter("nameKeyWord");
	
	if(formNameKeyWord != null) {
		request.setAttribute("nameKeyWord",formNameKeyWord);
		request.setAttribute("paramNameKeyWord",java.net.URLEncoder.encode(formNameKeyWord, "utf-8"));
	} else if(paramNameKeyWord != null) {
		String nameKeyWord = new String(paramNameKeyWord.getBytes("ISO-8859-1"), "utf-8");
		request.setAttribute("nameKeyWord",java.net.URLDecoder.decode(nameKeyWord, "utf-8"));
		request.setAttribute("paramNameKeyWord",nameKeyWord);
	}
	
			
	String adGroupId = request.getParameter("adGroupId");
	AdController controller = new AdController();
	List<Ad> adListAll = controller.findAllOrderByBundleIdentifier();
			
	if(adGroupId != null && adGroupId.trim().length() != 0) {		
		List<Ad> adList = controller.findByAdGroupId(adGroupId);
		pageContext.setAttribute("adList", adList);
		AdGroupController adGroupController = new AdGroupController();
		AdGroup selectedAdGroup = adGroupController.findById(adGroupId);
		pageContext.setAttribute("selectedAdGroup", selectedAdGroup);
				
		for(Iterator<Ad> it = adListAll.iterator();it.hasNext();) {
			Ad adInAll =  it.next();
			for(Iterator<Ad> it1 = adList.iterator();it1.hasNext();) {
				Ad adInGroup = it1.next();
				if(adInGroup.getId().equals(adInAll.getId())) {
					it.remove();					
					break;
				}
			}
		}
	}
	
	pageContext.setAttribute("adListAll", adListAll);
	
%>
<html>
<head>　　 
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
　　 <title>广告组管理</title>
	<!-- CSS -->
	<link href="./../../_common/css/transdmin.css" rel="stylesheet" type="text/css" media="screen" />
	<!--[if IE 6]><link rel="stylesheet" type="text/css" media="screen" href="./../../_common/css/ie6.css" /><![endif]-->
	<!--[if IE 7]><link rel="stylesheet" type="text/css" media="screen" href="./../../_common/css/ie7.css" /><![endif]-->
	<style>
		.left{float:left;width:160px;text-align:center;}
	</style>
	<script type="text/javascript">var g_path = '<%=request.getContextPath()%>';</script>
	<script type="text/javascript" src="./../../_common/js/jquery-1.7.1.min.js"></script>	
	<!-- JavaScripts-->		
	<script type="text/javascript" src="./../../_common/js/jNice.js"></script>
	<script type="text/javascript" src="./../../_common/js/ad_group_list.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
		    //右移
		    $('#add').click(function(){
		        $('#adListAll option:selected').appendTo('#adList');
		    });
		    //左移
		    $('#remove').click(function(){
		        $('#adList option:selected').appendTo('#adListAll');
		    });
		    //全部右移
		    $('#add_all').click(function(){
		        $('#adListAll option').appendTo('#adList');
		    });
		    //全部左移
		    $('#remove_all').click(function(){
		        $('#adList option').appendTo('#adListAll');
		    });
		    //双击右移
		    $('#adListAll').dblclick(function(){
		        $('#adListAll option:selected').appendTo('#adList');
		    });
		    //双击左移
		    $('#adList').dblclick(function(){
		        $('#adList option:selected').appendTo('#adListAll');
		    });
		});
	</script>
</head>
<body>
	<div id="wrapper">
		<!--head begin-->
		<jsp:include flush="true" page="/backend/_common/page/head.jsp">
			<jsp:param name="page" value="nav2" />
		</jsp:include>
		<!--head end-->
        
        <div id="containerHolder">
			<div id="container">
        		<div id="sidebar">
                	<ul class="sideNav">                    	
                    	<li><a href="#" class="active">广告组管理</a></li>                    	
                    </ul>
                    <!-- // .sideNav -->
                </div>    
                <!-- // #sidebar -->
                
                <!-- h2 stays for breadcrumbs -->
                <h2><a href="#">广告组管理</a> &raquo; <a href="#" class="active">广告组列表</a></h2>
                <div id="main">
                	<form id="query" action="<%=request.getContextPath()%>/backend/zentertain/ad_group/ad_group_list.jsp" method="post" >
							<table class="table_head" cellpadding="0" cellspacing="0">
								<tr>
									<td><h3>广告组列表</h3></td>
									<td align="right">
										Search by name&nbsp;<input type="text" name="nameKeyWord" value="<c:out value="${nameKeyWord}"/>" style="width:100px;">
		                            	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="button" value="查询" class="button" onclick='javascript:$("#query").submit();'/>
		                			</td>
								</tr>
							</table>																			  				
              		</form>
					
                   	<table id="ad_group_list_table" cellpadding="0" cellspacing="0">
                   		<tr>                   			
                   			<td nowrap="nowrap">广告组名称</td>
                   			<td nowrap="nowrap">创建日期</td>
                   			<td nowrap="nowrap">修改日期</td>
                   			<td nowrap="nowrap" class="action">操作</td>
                   		</tr>
						<zentertain:AdGroupList pageSize="10" pageLinksCount="10" nameKeyWord="${nameKeyWord}">
							<c:choose>
								<c:when test="${!empty zentertainAdGroupList}">									
									<c:forEach var="zentertainAdGroup" items="${zentertainAdGroupList}">
										<tr id="<c:out value="${zentertainAdGroup.id}"/>" class="odd">
											<td><c:out value="${zentertainAdGroup.name}"/></td>
											<td><fmt:formatDate value="${zentertainAdGroup.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
											<td><fmt:formatDate value="${zentertainAdGroup.modifyDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			                                <td class="action">
                                                <a href="ad_group_list.jsp?adGroupId=<c:out value="${zentertainAdGroup.id}"/>&<%=request.getQueryString()%>" class="edit">修改</a>
											     <a href="#" onclick="deleteEntity('<c:out value="${zentertainAdGroup.id}"/>','ad_group_controller.jsp')" class="delete">删除</a>
			                                </td>
			                            </tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr><td style='text-align: center' colspan="6">该页没有记录！</td></tr>
								</c:otherwise>
							</c:choose>
						</zentertain:AdGroupList>
					</table>
                    <!-- pagination div -->
					<div class="sabrosus">
						<script type="text/javascript">
							var currentPageNo = get_url_param('page');
							if(!currentPageNo.match(/^\d+$/)) { currentPageNo = 1; }
							var name = '<c:out value="${paramNameKeyWord}"/>';							
							var pageCount = <c:out value="${pageCount}"/>;
							jQuery(document).ready(function(){
								jQuery("#firstPage").attr("href",window.location.pathname + "?page=1&paramNameKeyWord=" + name);
								jQuery("#lastPage").attr("href",window.location.pathname + "?page="+ pageCount +"&paramNameKeyWord=" + name);
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
										<a href="${links.href}&paramNameKeyWord=${paramNameKeyWord}" id="page_link_<c:out value="${links.order}" />" target="_self"><c:out value="${links.order}"/></a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<span id="lastPageDiv"><a id="lastPage" href="javascript:void(0);" target="_self">&gt;</a></span>
						</c:if>
					</div>
					<!-- pagination div -->
					<form id="myform" name="myform" action="" class="jNice" method="post">						
						<h3>添加/修改广告组</h3>						
						<c:choose>
							<c:when test="${!empty selectedAdGroup}">
								<input type="hidden" id="action" name="action" value="update">
								<input type="hidden" id="id" name="id" value='<c:out value="${selectedAdGroup.id}" />'>
							</c:when>
							<c:otherwise>
								<input type="hidden" id="action" name="action" value="insert">
							</c:otherwise>
						</c:choose>
                    	<fieldset>
                    		<div>                        		
                        		<c:choose>
									<c:when test="${!empty selectedAdGroup}">									
										<p style="margin-left:14px;"><label>广告组名称:</label><input id="name" type="text"  name="name" class="text-long" value="<c:out value="${selectedAdGroup.name}" />"/></p>
									</c:when>
									<c:otherwise>
										<p style="margin-left:14px;"><label>广告组名称:</label><input id="name" type="text"  name="name" class="text-long"/></p>
									</c:otherwise>
								</c:choose>
							</div>
                        	<div class="left">
                        		<div>全部广告列表</div>
								<div class="centent">									
								    <select multiple="multiple" id="adListAll" name="adListAll" style="width:132px;height:200px;">					    
										<c:if test="${!empty adListAll}">
											<c:forEach var="adInAll" items="${adListAll}">
												<option value="<c:out value="${adInAll.id}"/>"><c:out value="${adInAll.appName}"/></option>
											</c:forEach>
										</c:if>
								    </select>
								</div>
								<input id="add" type="button" value="右移&gt;&gt;" class="button" />
								<input id="add_all" type="button" value="全部&gt;&gt;" class="button" />
							</div>
							<div class="left">
								<div>本组广告列表</div>
								<div class="centent">
								    <select multiple="multiple" id="adList" name="adList" style="width:132px;height:200px;">
								    	<c:if test="${!empty adList}">
											<c:forEach var="adInGroup" items="${adList}">
												<option value="<c:out value="${adInGroup.id}"/>"><c:out value="${adInGroup.appName}"/></option>
											</c:forEach>
										</c:if>
								    </select>
								</div>
								<input id="remove" type="button" value="&lt;&lt;左移" class="button" />
								<input id="remove_all" type="button" value="&lt;&lt;全部" class="button" />								
							</div>
							
						    <p><br /><input id="saveOrUpdate" type="button" value="提交" class="button" onclick="submitFunction('<%=request.getContextPath()%>/backend/zentertain/ad_group/ad_group_controller.jsp')"/></p>
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