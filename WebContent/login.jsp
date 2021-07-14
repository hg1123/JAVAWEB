<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="cn.util.Const"%>
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
  <link rel="icon" type="image/png" href="<%=Const.ROOT%>assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="<%=Const.ROOT%>assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="<%=Const.ROOT%>assets/css/amazeui.min.css" />
  <link rel="stylesheet" href="<%=Const.ROOT%>assets/css/admin.css">
  <link rel="stylesheet" href="<%=Const.ROOT%>assets/css/app.css">
</head>

<body data-type="login">

  <div class="am-g myapp-login">
	<div class="myapp-login-logo-block  tpl-login-max">
		<div class="myapp-login-logo-text">
			<div class="myapp-login-logo-text">
				职工健康管理系统<span> 登录</span> <i class="am-icon-skyatlas"></i>
			</div>
		</div>

		<div class="login-font">
			<i><a href="javascript:add()" style="color:#FFF;">注册</a></i>
		</div>
		<div class="am-u-sm-10 login-am-center">
			<form class="am-form" action="user_login.action" method="post" id="userForm">
				<fieldset>
					<div class="am-form-group" style="margin-bottom:5px;">
						<input type="text" name="login.username" style="border-radius:5px;" placeholder="输入用户名" required/>
					</div>
					<div class="am-form-group" style="margin-bottom:5px;">
						<input type="password" name="login.password" style="border-radius:5px;" placeholder="请输入密码" required/>
					</div>
					<div class="am-form-group" style="margin-bottom:5px;">
						<select name="login.role" style="border-radius:5px;font-size:13px;color:#999;line-height:28px;">
							<option value="1">管理员</option>
		                	<option value="3">企业用户</option>
						</select>
					</div>
					<p><button type="button" id="loginBtn" class="am-btn am-btn-default">登录</button></p>
				</fieldset>
			</form>
		</div>
	</div>
</div>

	<!-- 新增对话框begin -->
	<div class="am-modal am-modal-no-btn" tabindex="-1" id="add-modal">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">
				<h3>企业用户注册</h3>
				<a href="javascript: void(0)" class="am-close am-close-spin"
					data-am-modal-close>&times;</a>
			</div>
			<div class="am-modal-bd">
				<!-- 新增表单开始 -->
				<form class="am-form" name="addForm" onsubmit="return checkAdd()">	
					<div class="am-g" style="margin-top: 4px;">
						<div class="am-u-sm-3 am-u-md-3  am-text-right">
							登录名
						</div>
						<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<input type="text" name="addUser.username" class="am-input-sm">
						</div>
					</div>
					<div class="am-g" style="margin-top: 4px;">
						<div class="am-u-sm-3 am-u-md-3  am-text-right">
							密码
						</div>
						<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<input type="password" name="addUser.password" class="am-input-sm">
						</div>
					</div>
					<div class="am-g" style="margin-top: 4px;">
						<div class="am-u-sm-3 am-u-md-3  am-text-right">
							确认密码
						</div>
						<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<input type="password" name="password" class="am-input-sm">
						</div>
					</div>
					<div class="am-g" style="margin-top: 4px;">
						<div class="am-u-sm-3 am-u-md-3  am-text-right">
							真实姓名
						</div>
						<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<input type="text" name="addUser.realName" class="am-input-sm">
						</div>
					</div>
					<div class="am-g" style="margin-top: 4px;">
						<div class="am-u-sm-3 am-u-md-3  am-text-right">
							部门
						</div>
						<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<select data-am-selected placeholder="请选择" name="addUser.departmentId">
							</select>
						</div>
					</div>
					<div class="am-g" style="margin-top: 4px;">
						<div class="am-u-sm-3 am-u-md-3  am-text-right">
							性别
						</div>
						<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<input type="radio" name="addUser.sex" value="1" checked="checked"> 男  
							<input type="radio" name="addUser.sex" value="0"> 女  
						</div>
					</div>
					<div class="am-g" style="margin-top: 4px;">
						<div class="am-u-sm-3 am-u-md-3  am-text-right">
							年龄
						</div>
						<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<input type="text" name="addUser.age" class="am-input-sm">
						</div>
					</div>
					<div class="am-g" style="margin-top: 4px;">
						<div class="am-u-sm-3 am-u-md-3  am-text-right">
							工龄
						</div>
						<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<input type="text" name="addUser.workAge" class="am-input-sm">
						</div>
					</div>
					<div class="am-g" style="margin-top: 4px;">
						<div class="am-u-sm-3 am-u-md-3  am-text-right">
							健康状况
						</div>
						<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<label><input type="radio" name="addUser.healthStatus" value="1" checked="checked"> 正常  </label>
							<label><input type="radio" name="addUser.healthStatus" value="0"> 异常  </label>
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
	<!-- 新增对话框 end-->


  <script src="<%=Const.ROOT%>assets/js/jquery.min.js"></script>
  <script src="<%=Const.ROOT%>assets/js/amazeui.min.js"></script>
  <script src="<%=Const.ROOT%>assets/js/app.js"></script>
  <script>
  $(function(){
	  $("#loginBtn").click(function(){
		  var username=$("#username").val();
		  var password=$("#password").val();
		  var role=$("#role").val();
		  if(username==""){
			  alert("请输入用户名");
			  return false;
		  }
		  if(password==""){
			  alert("请输入密码");
			  return false;
		  }
		  if(role=="-1"){
			  alert("请选择身份");
			  return false;
		  }
		  $("#userForm").submit();
	  }); 
  });
//验证增加
  function checkAdd(){
  	if($("#add-modal input[name='addUser.username']").val()==""){
  		alert("请输入用户名");
  		return false;
  	}
  	if($("#add-modal input[name='addUser.password']").val()==""){
  		alert("请输入密码");
  		return false;
  	}
  	if($("#add-modal input[name='addUser.password']").val()!=$("#add-modal input[name='password']").val()){
  		alert("两次密码不一致");
  		return false;
  	}
  	if($("#add-modal input[name='addUser.realName']").val()==""){
  		alert("请输入真实姓名");
  		return false;
  	}
  	if($("#add-modal input[name='addUser.age']").val()==""){
  		alert("请输入年龄");
  		return false;
  	}
  	if($("#add-modal input[name='addUser.workAge']").val()==""){
  		alert("请输入工龄");
  		return false;
  	}
  	$.ajax({
  		url:"user_register.action",
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
  function add(){
  	$("#add-modal").modal({width:500,height:470});
  	$.getJSON("department_drop.action",{},function(list){
		var html = "";
		$.each(list,function(index,data){
			html+='<option label="'+data.name+'" value="'+data.id+'">'+data.name+'</option>';
		});
		$("#add-modal select[name='addUser.departmentId']").html(html);
	})
  }
  </script>
  <s:if test="#request.msg!=null">
  	<script>
  		alert("${msg}");
  	</script>
  </s:if>
</body>

</html>