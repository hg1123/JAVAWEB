<%@page import="cn.util.Const"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div class="tpl-left-nav tpl-left-nav-hover">
	<div class="tpl-left-nav-title">
		功能菜单
	</div>
	<div class="tpl-left-nav-list">
		<ul class="tpl-left-nav-menu">
			<li class="tpl-left-nav-item">
				<a href="<%=Const.ROOT %>manage/index.jsp" class="nav-link active"> <i
					class="am-icon-home"></i> <span>首页</span> </a>
			</li>
			<li class="tpl-left-nav-item">
				<a href="javascript:;"
					class="nav-link tpl-left-nav-link-list active"> <i
					class="am-icon-folder"></i> <span>用户</span> </a>
				<ul class="tpl-left-nav-sub-menu" style="display: block">
					<li>
						<s:if test="#session.role==1">
							<a href="user_list.action"> <i class="am-icon-angle-right"></i> <span>账户管理</span> </a>
						</s:if>
						<a href="user_detail.action?detail.id=${currentUser.id}"> <i class="am-icon-angle-right"></i>
							<span>我的资料</span> </a>
						<a href="user_updatepwd1.action"> <i class="am-icon-angle-right"></i>
							<span>密码修改</span> </a>
					</li>
				</ul>
			</li>
			<li class="tpl-left-nav-item">
				<a href="javascript:;"
					class="nav-link tpl-left-nav-link-list active"> <i
					class="am-icon-folder"></i> <span>体检管理</span> </a>
				<ul class="tpl-left-nav-sub-menu" style="display: block">
					<li>
						<a href="health_list.action"> <i class="am-icon-angle-right"></i>
							<span>体验记录</span> </a>
						<s:if test="#session.role==1">
							<a href="config_detail.action"> <i class="am-icon-angle-right"></i>
								<span>下次体验时间</span> </a>
						</s:if>
					</li>
				</ul>
			</li>
			<s:if test="#session.role==1">
				<li class="tpl-left-nav-item">
					<a href="javascript:;"
						class="nav-link tpl-left-nav-link-list active"> <i
						class="am-icon-folder"></i> <span>部门管理</span> </a>
					<ul class="tpl-left-nav-sub-menu" style="display: block">
						<li>
							<a href="department_list.action"> <i class="am-icon-angle-right"></i>
								<span>部门管理</span> </a>
						</li>
					</ul>
				</li>
			</s:if>
		</ul>
	</div>
</div>