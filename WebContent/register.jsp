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
				<span> 登录</span> <i class="am-icon-skyatlas"></i>
				
			</div>
		</div>

<!--		<div class="login-font">-->
<!--			<i> <a href="javascript:add()" style="color:#FFF;">学生注册</a> | <a href="javascript:add1()" style="color:#FFF;">专家注册</a> </i>-->
<!--		</div>-->
		<div class="am-u-sm-10 login-am-center">
			<form class="am-form" action="user_login.action" method="post" id="userForm">
				<fieldset>
					<div class="am-form-group" style="margin-bottom:5px;">
						<input type="text" id="username" name="username" style="border-radius:5px;" placeholder="输入用户名" required/>
					</div>
					<div class="am-form-group" style="margin-bottom:5px;">
						<input type="password" id="password" name="password" style="border-radius:5px;" placeholder="请输入密码" required/>
					</div>
					<div class="am-form-group" style="margin-bottom:5px;">
						<select id="role" name="role" style="border-radius:5px;font-size:13px;color:#999;line-height:28px;">
							<option value="-1">--请选择角色--</option>
							<option value="1">管理员</option>
		                	<option value="2">交警中队</option>
		                	<option value="3">车主</option>
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
				<h3>学生注册</h3>
				<a href="javascript: void(0)" class="am-close am-close-spin"
					data-am-modal-close>&times;</a>
			</div>
			<div class="am-modal-bd">
				<!-- 新增表单开始 -->
				<form class="am-form" name="addForm" action="user_add.action" method="post"
					onsubmit="return checkAdd()">	
					<div class="am-g" style="margin-top: 4px;">
						<div class="am-u-sm-3 am-u-md-3  am-text-right">
							用户名
						</div>
						<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<input type="text" id="username1" name="user.username" class="am-input-sm">
						</div>
					</div>
					<div class="am-g" style="margin-top: 4px;">
						<div class="am-u-sm-3 am-u-md-3  am-text-right">
							密码
						</div>
						<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<input type="password" id="password1" name="user.password" class="am-input-sm">
						</div>
					</div>
					<div class="am-g" style="margin-top: 4px;">
						<div class="am-u-sm-3 am-u-md-3  am-text-right">
							确认密码
						</div>
						<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<input type="password" id="password2" class="am-input-sm">
						</div>
					</div>
					<div class="am-g" style="margin-top: 4px;">
						<div class="am-u-sm-3 am-u-md-3  am-text-right">
							姓名
						</div>
						<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<input type="text" id="name1" name="user.name" class="am-input-sm">
						</div>
					</div>
					<div class="am-g" style="margin-top: 4px;">
						<div class="am-u-sm-3 am-u-md-3  am-text-right">
							性别
						</div>
						<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<input type="radio" name="user.sex" value="男" checked="checked"> 男  
							<input type="radio" name="user.sex" value="女"> 女  
						</div>
					</div>
					<div class="am-g" style="margin-top: 4px;">
						<div class="am-u-sm-3 am-u-md-3  am-text-right">
							邮箱
						</div>
						<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<input type="text" id="email1" name="user.email" class="am-input-sm">
						</div>
					</div>
					<div class="am-g" style="margin-top: 4px;">
						<div class="am-u-sm-3 am-u-md-3  am-text-right">
							电话
						</div>
						<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<input type="text" id="tel1" name="user.tel" class="am-input-sm">
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


<!-- 新增对话框begin -->
	<div class="am-modal am-modal-no-btn" tabindex="-1" id="add-modal1">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">
				<h3>专家注册</h3>
				<a href="javascript: void(0)" class="am-close am-close-spin"
					data-am-modal-close>&times;</a>
			</div>
			<div class="am-modal-bd">
				<!-- 新增表单开始 -->
				<form class="am-form" name="addForm" action="zhuanjia_add.action" method="post"
					onsubmit="return checkAdd1()">	
					<div class="am-g" style="margin-top: 4px;">
						<div class="am-u-sm-3 am-u-md-3  am-text-right">
							用户名
						</div>
						<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<input type="text" id="username1" name="zhuanjia.username" class="am-input-sm">
						</div>
					</div>
					<div class="am-g" style="margin-top: 4px;">
						<div class="am-u-sm-3 am-u-md-3  am-text-right">
							密码
						</div>
						<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<input type="password" id="password1" name="zhuanjia.password" class="am-input-sm">
						</div>
					</div>
					<div class="am-g" style="margin-top: 4px;">
						<div class="am-u-sm-3 am-u-md-3  am-text-right">
							确认密码
						</div>
						<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<input type="password" id="password2" class="am-input-sm">
						</div>
					</div>
					<div class="am-g" style="margin-top: 4px;">
						<div class="am-u-sm-3 am-u-md-3  am-text-right">
							姓名
						</div>
						<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<input type="text" id="name1" name="zhuanjia.name" class="am-input-sm">
						</div>
					</div>
					<div class="am-g" style="margin-top: 4px;">
						<div class="am-u-sm-3 am-u-md-3  am-text-right">
							性别
						</div>
						<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<input type="radio" name="zhuanjia.sex" value="男" checked="checked"> 男  
							<input type="radio" name="zhuanjia.sex" value="女"> 女  
						</div>
					</div>
					<div class="am-g" style="margin-top: 4px;">
						<div class="am-u-sm-3 am-u-md-3  am-text-right">
							学历
						</div>
						<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<input type="text" id="xueli1" name="zhuanjia.xueli" class="am-input-sm">
						</div>
					</div>
					<div class="am-g" style="margin-top: 4px;">
						<div class="am-u-sm-3 am-u-md-3  am-text-right">
							电话
						</div>
						<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<input type="text" id="tel1" name="zhuanjia.tel" class="am-input-sm">
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
  	if($("#username1").val()==""){
  		alert("请输入用户名");
  		return false;
  	}
  	if($("#password1").val()==""){
  		alert("请输入密码");
  		return false;
  	}
  	if($("#password2").val()==""){
  		alert("请输入确认密码");
  		return false;
  	}
  	if($("#password1").val()!=$("#password2").val()){
  		alert("两次密码不一致");
  		return false;
  	}
  	if($("#name1").val()==""){
  		alert("请输入姓名");
  		return false;
  	}
  	if($("#email1").val()==""){
  		alert("请输入Email");
  		return false;
  	}
  	if($("#tel1").val()==""){
  		alert("请输入电话");
  		return false;
  	}
  	return true;
  }

//验证增加
  function checkAdd1(){
  	if($("#add-modal1 #username1").val()==""){
  		alert("请输入用户名");
  		return false;
  	}
  	if($("#add-modal1 #password1").val()==""){
  		alert("请输入密码");
  		return false;
  	}
  	if($("#add-modal1 #password2").val()==""){
  		alert("请输入确认密码");
  		return false;
  	}
  	if($("#add-modal1 #password1").val()!=$("#add-modal1 #password2").val()){
  		alert("两次密码不一致");
  		return false;
  	}
  	if($("#add-modal1 #name1").val()==""){
  		alert("请输入姓名");
  		return false;
  	}
  	if($("#add-modal1 #xueli1").val()==""){
  		alert("请输入学历");
  		return false;
  	}
  	if($("#add-modal1 #tel1").val()==""){
  		alert("请输入电话");
  		return false;
  	}
  	return true;
  }
  function add(){
  	$("#add-modal").modal({width:500,height:470});
  }
  function add1(){
	  	$("#add-modal1").modal({width:500,height:470});
   }
  </script>
  <s:if test="#request.msg!=null">
  	<script>
  		alert("${msg}");
  	</script>
  </s:if>
</body>

</html>