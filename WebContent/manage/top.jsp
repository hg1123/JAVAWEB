<%@page import="cn.util.Const"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<header class="am-topbar am-topbar-inverse admin-header">
<div class="am-topbar-brand">
	职工健康管理系统
</div>
<div class="am-icon-list tpl-header-nav-hover-ico am-fl am-margin-right">
</div>
<div class="am-collapse am-topbar-collapse" id="topbar-collapse">
	<ul
		class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list tpl-header-list">
		<li class="am-hide-sm-only" id="result" ></li>
		<li class="am-hide-sm-only">
			<a href="javascript:;" id="admin-fullscreen"
				class="tpl-header-list-link"><span class="am-icon-arrows-alt"></span>
<!-- 				<span class="admin-fullText">开启全屏</span> -->
			</a>
		</li>
		<li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle>
			<a class="am-dropdown-toggle tpl-header-list-link"
				href="javascript:;"> <span class="tpl-header-list-user-nick">${currentUser.realName}</span><span
				class="tpl-header-list-user-ico"> </span> </a>
		</li>
		<li>
			<a href="<%=Const.ROOT%>login.jsp" class="tpl-header-list-link"><span
				class="am-icon-sign-out tpl-header-list-ico-out-size"></span>
			</a>
		</li>
	</ul>
</div>
</header>
 <script src="<%=Const.ROOT%>assets/js/jquery.min.js"></script>
    <script type="text/javascript">
//在网页上输出：今天的日期、星期、现在的时间（动态时钟）
$(function(){ 
	start();
})
function start()
{
  var today=new Date();
  var year=today.getFullYear();
  var month=today.getMonth()+1;
  var day=today.getDate();
  var hours=today.getHours();
  var minutes=today.getMinutes();
  var seconds=today.getSeconds();
  //如果是单位数字，前面补0
  month=month<10? "0"+month :month;
  day=day<10? "0"+day :day;
  hours=hours<10? "0"+hours :hours;
  minutes=minutes<10? "0"+minutes :minutes;
  seconds=seconds<10? "0"+seconds :seconds;
  //时间信息连成字符串
  var str="今天是"+year+"年"+month+"月"+day+"日 "+hours+":"+minutes+":"+seconds;
  //获取id=result的内容
  var obj=document.getElementById("result");
  obj.innerHTML=str;
  //延时器
  window.setTimeout("start()",1000);
}
</script>