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
			.user_detail_table{width:100%;font-size:14px;}
			.user_detail_table tr{height:40px;}
			.user_detail_table td{width:25%;}
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
						个人信息<a href="javascript:update(<s:property value="user.id"/>)" style="color:blue;margin-left:20px;">编辑</a>
					</li>
				</ol>
				<div class="tpl-portlet-components">
					<table class="user_detail_table">
						<tr>
							<td>ID:</td>
							<td><s:property value="user.id"/></td>
							<td>登录名称:</td>
							<td><s:property value="user.username"/></td>
						</tr>
						<tr>
							<td>真实姓名:</td>
							<td><s:property value="user.realName"/></td>
							<td>部门:</td>
							<td><s:property value="user.department.name"/></td>
						</tr>
						<tr>
							<td>性别:</td>
							<td><s:property value="user.sex"/></td>
							<td>年龄:</td>
							<td><s:property value="user.age"/></td>
						</tr>
						<tr>
							<td>工龄:</td>
							<td><s:property value="user.workAge"/></td>
							<td>健康状况:</td>
							<td>
								<s:if test="user.healthStatus==1">
									<span class="normal">正常</span>
								</s:if>
								<s:if test="user.healthStatus==0">
									<span class="exception">异常</span>
								</s:if>
							</td>
						</tr>
					</table>
					<s:if test="#session.role==3">
					<s:if test="health!=null">
						最近一次健康检查记录
						<table class="user_detail_table">
							<tr>
								<td>血脂:</td>
								<td>
									<s:if test="health.bloodFat==1">
										<span class="normal">正常</span>
									</s:if>
									<s:if test="health.bloodFat==0">
										<span class="exception">异常</span>
									</s:if>
								</td>
								<td>血压:</td>
								<td>
									<s:if test="health.bloodPressure==1">
										<span class="normal">正常</span>
									</s:if>
									<s:if test="health.bloodPressure==0">
										<span class="exception">异常</span>
									</s:if>
								</td>
							</tr>
							<tr>
								<td>肝功能:</td>
								<td>
									<s:if test="health.liver==1">
										<span class="normal">正常</span>
									</s:if>
									<s:if test="health.liver==0">
										<span class="exception">异常</span>
									</s:if>
								</td>
								<td>血常规:</td>
								<td>
									<s:if test="health.blood==1">
										<span class="normal">正常</span>
									</s:if>
									<s:if test="health.blood==0">
										<span class="exception">异常</span>
									</s:if>
								</td>
							</tr>
							<tr>
								<td>心率:</td>
								<td>
									<s:if test="health.heartRate==1">
										<span class="normal">正常</span>
									</s:if>
									<s:if test="health.heartRate==0">
										<span class="exception">异常</span>
									</s:if>
								</td>
								<td>肿瘤标志物:</td>
								<td>
									<s:if test="health.tumorMarker==1">
										<span class="normal">正常</span>
									</s:if>
									<s:if test="health.tumorMarker==0">
										<span class="exception">异常</span>
									</s:if>
								</td>
							</tr>
							<tr>
								<td>x光透视:</td>
								<td>
									<s:if test="health.xgRay==1">
										<span class="normal">正常</span>
									</s:if>
									<s:if test="health.xgRay==0">
										<span class="exception">异常</span>
									</s:if>
								</td>
								<td>眼耳鼻咽喉:</td>
								<td>
									<s:if test="health.eent==1">
										<span class="normal">正常</span>
									</s:if>
									<s:if test="health.eent==0">
										<span class="exception">异常</span>
									</s:if>
								</td>
							</tr>
							<tr>
								<td>检查时间:</td>
								<td><s:property value="health.checkDate"/></td>
								<td>下次检查时间:</td>
								<td>
									<s:if test="config==null">未安排</s:if>
									<s:if test="config!=null"><s:property value="config.nextCheckDate"/></s:if>
								</td>
							</tr>
						</table>
					</s:if>
					</s:if>
					<s:if test="health==null">
						<s:if test="#session.role==3">
							下次检查时间：<s:if test="config==null">未安排</s:if>
									<s:if test="config!=null"><s:property value="config.nextCheckDate"/></s:if>
						</s:if>
					</s:if>
				</div>
			</div>
			<!--右边内容end-->
		</div>
		<!-- 修改对话框begin -->
	<div class="am-modal am-modal-no-btn" tabindex="-1" id="update-modal">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">
				<h3>修改个人信息</h3>
				<a href="javascript: void(0)" class="am-close am-close-spin"
					data-am-modal-close>&times;</a>
			</div>
			<div class="am-modal-bd">
				<!-- 新增表单开始 -->
				<form class="am-form" action="user_update1.action" method="post" name="updateForm" onsubmit="return checkUpdate()">	
					<div class="am-g" style="margin-top: 4px;">
						<div class="am-u-sm-3 am-u-md-3  am-text-right">
							登录名
						</div>
						<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<span name="updateUser.username"></span>
							<input type="hidden" name="updateUser.id" class="am-input-sm">
						</div>
					</div>
					<div class="am-g" style="margin-top: 4px;">
						<div class="am-u-sm-3 am-u-md-3  am-text-right">
							真实姓名
						</div>
						<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<input type="text" name="updateUser.realName" class="am-input-sm">
						</div>
					</div>
					<div class="am-g" style="margin-top: 4px;">
						<div class="am-u-sm-3 am-u-md-3  am-text-right">
							部门
						</div>
						<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<select data-am-selected placeholder="请选择" name="updateUser.departmentId">
							</select>
						</div>
					</div>
					<div class="am-g" style="margin-top: 4px;">
						<div class="am-u-sm-3 am-u-md-3  am-text-right">
							性别
						</div>
						<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<input type="radio" name="updateUser.sex" value="1" checked="checked"> 男  
							<input type="radio" name="updateUser.sex" value="0"> 女  
						</div>
					</div>
					<div class="am-g" style="margin-top: 4px;">
						<div class="am-u-sm-3 am-u-md-3  am-text-right">
							年龄
						</div>
						<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<input type="text" name="updateUser.age" class="am-input-sm">
						</div>
					</div>
					<div class="am-g" style="margin-top: 4px;">
						<div class="am-u-sm-3 am-u-md-3  am-text-right">
							工龄
						</div>
						<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<input type="text" name="updateUser.workAge" class="am-input-sm">
						</div>
					</div>
					<div class="am-g" style="margin-top: 4px;">
						<div class="am-u-sm-3 am-u-md-3  am-text-right">
							健康状况
						</div>
						<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<label><input type="radio" name="updateUser.healthStatus" value="1" checked="checked">正常</label>
							<label><input type="radio" name="updateUser.healthStatus" value="0">异常 </label>
						</div>
					</div>
					<div style="margin-top:10px;">
						<button type="submit" class="am-btn am-btn-primary am-btn-xs">
							提交保存
						</button>
						<button type="reset" class="am-btn am-btn-primary am-btn-xs">
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
	<!-- 新增对话框 end-->
		<script type="text/javascript">
			function update(id){
				$("#update-modal").modal({
					width: 700,
					height: 490
				});
				$.getJSON("user_update.action",{"id":id},function(updateUser){
					$("#update-modal input[name='updateUser.id']").val(updateUser.id);
					$("#update-modal span[name='updateUser.username']").html(updateUser.username);
					$("#update-modal input[name='updateUser.realName']").val(updateUser.realName);
					$("#update-modal input[name='updateUser.age']").val(updateUser.age);
					$("#update-modal input[name='updateUser.sex']").val(updateUser.sex);
					$("#update-modal input[name='updateUser.workAge']").val(updateUser.workAge);
					$("#update-modal input[name='updateUser.healthStatus'][value='"+updateUser.healthStatus+"']").prop("checked",true);
					$.getJSON("department_drop.action",{},function(list){
						var html = "";
						$.each(list,function(index,data){
							html+='<option label="'+data.name+'" value="'+data.id+'" ';
							if(updateUser.department!=null&&updateUser.department.id==data.id){
								html+= ' selected = "selected" '
							}
							html+='>'+data.name+'</option>';
						});
						$("#update-modal select[name='updateUser.departmentId']").html(html);
					})
				})
			}
			function checkUpdate(){
			  	if($("#update-modal input[name='user.name']").val()==""){
			  		alert("请输入姓名");
			  		return false;
			  	}
			  	if($("#update-modal1 input[name='user.username']").val()==""){
			  		alert("请输入登录名");
			  		return false;
			  	}
			  	if($("#update-modal1 input[name='user.gender']").val()=="-1"){
			  		alert("请选择性别");
			  		return false;
			  	}
			  	if($("#update-modal1 input[name='user.phone']").val()==""){
			  		alert("请输入电话");
			  		return false;
			  	}
			  	if($("#update-modal1 input[name='user.password']").val()==""){
			  		alert("请输入密码");
			  		return false;
			  	}
			  	if($("#update-modal1 input[name='user.password1']").val()==""){
			  		alert("请输入确认密码");
			  		return false;
			  	}
			  	if($("#update-modal1 input[name='user.password']").val()!=$("#update-modal1 input[name='user.password1']").val()){
			  		alert("两次密码不一致");
			  		return false;
			  	}
		  		return true;
  			}
		</script>
	</body>
</html>