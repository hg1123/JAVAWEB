<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>职工健康管理系统</title>
		<meta name="description" content="这是一个 index 页面">
		<meta name="keywords" content="index">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<link rel="icon" type="image/png"
			href="<%=Const.ROOT%>assets/i/favicon.png">
		<link rel="apple-touch-icon-precomposed"
			href="<%=Const.ROOT%>assets/i/app-icon72x72@2x.png">
		<meta name="apple-mobile-web-app-title" content="Amaze UI" />
		<link rel="stylesheet"
			href="<%=Const.ROOT%>assets/css/amazeui.min.css" />
		<script type="text/JavaScript" src="<%=Const.ROOT%>My97DatePicker/WdatePicker.js"></script>
		<link rel="stylesheet" href="<%=Const.ROOT%>assets/css/admin.css">
		<link rel="stylesheet" href="<%=Const.ROOT%>assets/css/app.css">
		<style type="text/css">
			#update-modal input[type="text"],#add-modal input[type="text"]{width:80%;float:left;}
			.exception{color:red;}
			.normal{color:green;}
		</style>
	</head>

	<body data-type="generalComponents">

		<%@include file="top.jsp"%>

		<div class="tpl-page-container tpl-page-header-fixed">
			<!--左边start-->
			<%@include file="sidebar.jsp"%>
			<!--左边end-->
			<div class="tpl-content-wrapper">
				<!--右边内容start-->
				<ol class="am-breadcrumb">
					<li>
						<a href="#" class="am-icon-home">首页</a>
					</li>
					<li class="am-active">
						体验时间
					</li>
				</ol>
				<div class="tpl-portlet-components">
					<div class="tpl-block">
					<form action="config_update.action" method="post" id="sform">
						<div class="am-g">
							<div class="am-u-sm-12 am-u-md-3" style="width:100%;">
								<div class="am-input-group am-input-group-sm">
									下次体验时间：
									<s:if test="config!=null">
										<input style="height:35px;width:220px;" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" name="config.nextCheckDate" value="<s:property value="config.nextCheckDate"/>"/>
									</s:if>
									<s:if test="config==null">
										<input style="height:35px;width:220px;" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" name="config.nextCheckDate"/>
									</s:if>
									<span class="am-input-group-btn">
										<button
											class="am-btn  am-btn-default am-btn-success tpl-am-btn-success am-icon-set"
											type="submit">设置</button> </span>
								</div>
							</div>
						</div>
					</form>
					</div>
				</div>
			</div>
			<!--右边内容end-->
		</div>
		<script src="<%=Const.ROOT%>assets/js/jquery.min.js"></script>
		<script src="<%=Const.ROOT%>assets/js/amazeui.min.js"></script>
		<script src="<%=Const.ROOT%>assets/js/app.js"></script>
</script>
	</body>

</html>