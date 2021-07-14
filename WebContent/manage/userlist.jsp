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
						用户列表
					</li>
				</ol>
				<div class="tpl-portlet-components">
					<div class="tpl-block">
					<form action="user_list.action" method="post" id="sform">
      				<input type="hidden" name="pageBean.pageNo" value="1" id="pageNo"/>
						<div class="am-g">
								<div class="am-u-sm-12 am-u-md-3">
								
								</div>
								<div class="am-u-sm-12 am-u-md-3">
									<div class="am-input-group am-input-group-sm">
									用户名：
										<input type="text" name="username1" class="am-form-field" value="<s:property value="username1"/>">
										<span class="am-input-group-btn">
											<button
												class="am-btn  am-btn-default am-btn-success tpl-am-btn-success am-icon-search"
												type="submit"></button> </span>
									</div>
								</div>
						</div>
						<div class="am-g">
							<div class="am-u-sm-12">
									<table
										class="am-table am-table-striped am-table-hover table-main">
										<thead>
											<tr>
												<th class="table-title">登录名</th>
												<th class="table-title">真实名字</th>
												<th class="table-title">部门</th>
												<th class="table-title">性别</th>
												<th class="table-title">年龄</th>
												<th class="table-set">工龄</th>
												<th class="table-set">健康状况</th>
												<th class="table-set">操作</th>
											</tr>
										</thead>
										<tbody>
										<s:iterator value="list" status="st">
											<tr>
												<!--行start-->
												<td><s:property value="username"/></td>
												<td><s:property value="realName"/></td>
												<td><s:property value="department.name"/></td>
												<td><s:if test="sex==1">男</s:if><s:if test="sex==0">女</s:if></td>
												<td><s:property value="age"/></td>
												<td><s:property value="workAge"/></td>
												<td>
													<s:if test="healthStatus==1">
														<span class="normal">正常</span>
													</s:if>
													<s:if test="healthStatus==0">
														<span class="exception">异常</span>
													</s:if>
												</td>
												<td>
													<div class="am-btn-toolbar">
														<div class="am-btn-group am-btn-group-xs">
															<s:if test="role==2">											
																<button type="button"
																	class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" type="button" onclick="shenhe('<s:property value="id"/>')">
																	<span class="am-icon-trash-o"></span> 审核
																</button>													
															</s:if>
															<s:if test="role==3">											
																<button type="button"
																	class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" type="button" onclick="toDelete('<s:property value="id"/>')">
																	<span class="am-icon-trash-o"></span> 删除
																</button>													
															</s:if>
														</div>
													</div>
												</td>
											</tr>
											</s:iterator>
											<!--行end-->
										</tbody>
									</table>
									<div class="am-cf">
										<div class="am-fr">
											<ul class="am-pagination tpl-pagination">
												<li>
													<a href="javascript:doPage('${pageBean.prePage }')">上一页</a>
												</li>
												<li>
													<a href="javascript:doPage('${pageBean.nextPage }')">下一页</a>
												</li>
											</ul>
										</div>
									</div>
									<hr>
							</div>
						</div>
					</form>
					</div>
					<div class="tpl-alert"></div>
				</div>
			</div>
			<!--右边内容end-->
		</div>

		<!-- 审核对话框begin -->
		<div class="am-modal am-modal-confirm" tabindex="-1" id="shenhe_modal">
			<div class="am-modal-dialog">
				<div class="am-modal-hd">
					审核结果为：<a href="javascript: void(0)" class="am-close am-close-spin"
						data-am-modal-close>&times;</a>
				</div>
				<div class="am-modal-footer">
					<span class="am-modal-btn" data-am-modal-confirm>通过</span>
					<span class="am-modal-btn" data-am-modal-cancel>不通过</span>
				</div>
			</div>
		</div>		
		<!-- 审核对话框end -->
		<!-- 删除对话框begin -->
		<div class="am-modal am-modal-confirm" tabindex="-1" id="delete_modal">
			<div class="am-modal-dialog">
				<div class="am-modal-hd">
					确定要删除吗
				</div>
				<div class="am-modal-footer">
					<span class="am-modal-btn" data-am-modal-confirm>确定</span>
					<span class="am-modal-btn" data-am-modal-cancel>取消</span>
				</div>
			</div>
		</div>		
		<!-- 删除对话框end -->
		<script src="<%=Const.ROOT%>assets/js/jquery.min.js"></script>
		<script src="<%=Const.ROOT%>assets/js/amazeui.min.js"></script>
		<script src="<%=Const.ROOT%>assets/js/app.js"></script>
		
		<script>
			function doPage(pageNo){
				$("#pageNo").val(pageNo);
				$("#sform").submit();
			}
			function shenhe(id) {
				$("#shenhe_modal").modal({
					relatedTarget: this,
					onConfirm: function(options) {
						location.href = "user_shenhe.action?user.id=" + id+"&user.role=3";
					},
					onCancel: function() {
					location.href = "user_shenhe.action?user.id=" + id+"&user.role=-1";
					}
				});
			}
			function toDelete(id) {
				$("#delete_modal").modal({
					relatedTarget: this,
					onConfirm: function(options) {
						location.href = "user_delete.action?user.id=" + id;
					},
					onCancel: function() {
					}
				});
			}
</script>
	</body>

</html>