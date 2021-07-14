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
						部门列表
					</li>
				</ol>
				<div class="tpl-portlet-components">
					<div class="tpl-block">
					<form action="department_list.action" method="post" id="sform">
      				<input type="hidden" name="pageBean.pageNo" value="1" id="pageNo"/>
      				<div class="am-g">
								<div class="am-u-sm-12 am-u-md-3">
									<div class="am-btn-toolbar">
										<div class="am-btn-group am-btn-group-xs">
											<button type="button"
												class="am-btn am-btn-default am-btn-success" onclick="add()">
												<span class="am-icon-plus"></span> 新增
											</button>
										</div>
									</div>
								</div>
								<div class="am-u-sm-12 am-u-md-3">
									
								</div>
						</div>
						<div class="am-g">
								<div class="am-u-sm-12 am-u-md-3">
								
								</div>
								<div class="am-u-sm-12 am-u-md-3">
									<div class="am-input-group am-input-group-sm">
									部门名称：
										<input type="text" name="searchDepartment.name" class="am-form-field" value="<s:property value="searchDepartment.name"/>">
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
												<th class="table-title">部门ID</th>
												<th class="table-title">部门名称</th>
												<th class="table-title">排序号</th>
												<th class="table-title">创建时间</th>
												<th class="table-title">最后修改时间</th>
												<th class="table-title">操作</th>
											</tr>
										</thead>
										<tbody>
										<s:iterator value="list" status="st">
											<tr>
												<!--行start-->
												<td><s:property value="id"/></td>
												<td><s:property value="name"/></td>
												<td>
													<s:property value="sortNum"/>
												</td>
												<td>
													<s:property value="gmtCreate"/>
												</td>
												<td>
													<s:property value="gmtModified"/>
												</td>
												<td>
													<div class="am-btn-toolbar">
														<div class="am-btn-group am-btn-group-xs">
															<button type="button"
																class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" type="button" onclick="toUpdate('<s:property value="id"/>')">
																<span class="am-icon-trash-o"></span> 修改
															</button>
															<button type="button"
																class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" type="button" onclick="toDelete('<s:property value="id"/>')">
																<span class="am-icon-trash-o"></span> 删除
															</button>													
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
		<!-- 新增对话框begin -->
		<div class="am-modal am-modal-no-btn" tabindex="-1" id="add-modal">
			<div class="am-modal-dialog">
				<div class="am-modal-hd">
					新增数据
					<a href="javascript: void(0)" class="am-close am-close-spin"
						data-am-modal-close>&times;</a>
				</div>
				<div class="am-modal-bd">
					<!-- 新增表单开始 -->
					<form class="am-form" name="addForm" method="post" id="add-modal1"
						onsubmit="return checkAdd()">
						<div class="am-g" style="margin-top: 4px;">
							<div class="am-u-sm-3 am-u-md-3  am-text-right">
								名称
							</div>
							<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
								<input type="text" name="addDepartment.name" class="am-input-sm">
							</div>
						</div>
						<div class="am-g" style="margin-top: 4px;">
							<div class="am-u-sm-3 am-u-md-3  am-text-right">
								排序号
							</div>
							<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
								<input type="text" name="addDepartment.sortNum" class="am-input-sm">
							</div>
						</div>
						<div style="margin-top: 10px;">
							<button type="submit" class="am-btn am-btn-primary am-btn-xs">
								提交保存
							</button>
							<button type="reset" class="am-btn am-btn-primary am-btn-xs" data-am-modal-close>
								放弃保存
							</button>
						</div>
					</form>
					<!-- 新增表单结束 -->
				</div>
			</div>
		</div>
		
		<!-- 修改对话框begin -->
		<div class="am-modal am-modal-no-btn" tabindex="-1" id="update-modal">
			<div class="am-modal-dialog">
				<div class="am-modal-hd">
					修改数据
					<a href="javascript: void(0)" class="am-close am-close-spin"
						data-am-modal-close>&times;</a>
				</div>
				<div class="am-modal-bd">
					<form class="am-form" name="updateForm" id="update-modal1"
						onsubmit="return checkUpdate()">
						<div class="am-g" style="margin-top: 4px;">
							<div class="am-u-sm-3 am-u-md-3  am-text-right">
								名称
							</div>
							<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
								<input type="hidden" name="updateDepartment.id">
								<input type="text" name="updateDepartment.name" class="am-input-sm">
							</div>
						</div>
						<div class="am-g" style="margin-top: 4px;">
							<div class="am-u-sm-3 am-u-md-3  am-text-right">
								排序号
							</div>
							<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
								<input type="text" name="updateDepartment.sortNum" class="am-input-sm">
							</div>
						</div>
						<div style="margin-top: 10px;">
							<button type="submit" class="am-btn am-btn-primary am-btn-xs">
								提交保存
							</button>
							<button type="reset" class="am-btn am-btn-primary am-btn-xs" data-am-modal-close>
								放弃保存
							</button>
						</div>
					</form>
					<!-- 新增表单结束 -->
				</div>
			</div>
		</div>
		<script src="<%=Const.ROOT%>assets/js/jquery.min.js"></script>
		<script src="<%=Const.ROOT%>assets/js/amazeui.min.js"></script>
		<script src="<%=Const.ROOT%>assets/js/app.js"></script>
		<script src="<%=Const.ROOT%>js/ajaxfileupload.js"></script>
		
		<script>
			function add() {
				$("#add-modal").modal({
					width: 400,
					height: 200
				});
			}
			function toUpdate(id){
				$.getJSON("department_update.action",{"updateDepartment.id":id},function(updateDepartment){
					$("#update-modal input[name='updateDepartment.id']").val(updateDepartment.id);
					$("#update-modal input[name='updateDepartment.name']").val(updateDepartment.name);
					$("#update-modal input[name='updateDepartment.sortNum']").val(updateDepartment.sortNum);
					$("#update-modal").modal({width:400,height:200});
				})
			}
			function doPage(pageNo){
				$("#pageNo").val(pageNo);
				$("#sform").submit();
			}
			function toDelete(id) {
				$("#delete_modal").modal({
					relatedTarget: this,
					onConfirm: function(options) {
						location.href = "department_delete.action?deleteDepartment.id=" + id;
					},
					onCancel: function() {
					}
				});
			}
			function checkAdd(){
			  	if($("#add-modal input[name='addDepartment.name']").val()==""){
			  		alert("请输入部门名称");
			  		return false;
			  	}
			  	if($("#add-modal input[name='addDepartment.sortNum']").val()==""){
			  		alert("请输入排序号");
			  		return false;
			  	}
			  	var re = /^[0-9]+.?[0-9]*$/;
			  	var ival = parseInt($("#add-modal input[name='addDepartment.sortNum']").val());
			  	if(!re.test($("#add-modal input[name='addDepartment.sortNum']").val())){
			  		alert("排序号不合法");
			  		return false;
			  	}
			  	$.ajax({
			  		url:"department_add.action",
			  		type:"post",
			  		data:$("#add-modal form").serialize(),
			  		dataType:"json",
			  		success:function(data){
			  			if(data.status){
			  				location.reload();
			  			}else{
			  				alert(data.msg)
			  			}
			  		}
			  	})
		  		return false;
  			}
  			function checkUpdate(){
			  	if($("#update-modal input[name='updateDepartment.name']").val()==""){
			  		alert("请输入部门名称");
			  		return false;
			  	}
			  	if($("#update-modal input[name='updateDepartment.sortNum']").val()==""){
			  		alert("请输入排序号");
			  		return false;
			  	}
			  	var re = /^[0-9]+.?[0-9]*$/;
			  	var ival = parseInt($("#update-modal input[name='updateDepartment.sortNum']").val());
			  	if(!re.test($("#update-modal input[name='updateDepartment.sortNum']").val())){
			  		alert("排序号不合法");
			  		return false;
			  	}
			  	$.ajax({
			  		url:"department_update1.action",
			  		type:"post",
			  		data:$("#update-modal form").serialize(),
			  		dataType:"json",
			  		success:function(data){
			  			if(data.status){
			  				location.reload();
			  			}else{
			  				alert(data.msg)
			  			}
			  		}
			  	})
		  		return false;
  			}
</script>
	</body>

</html>