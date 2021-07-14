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
						用户列表
					</li>
				</ol>
				<div class="tpl-portlet-components">
					<div class="tpl-block">
					<form action="health_list.action" method="post" id="sform">
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
								<div class="am-u-sm-12 am-u-md-3" style="width:100%;">
									<div class="am-input-group am-input-group-sm">
<!--									用户名：-->
<!--										<input type="text" name="username1" class="am-form-field" value="<s:property value="username1"/>">-->
											<table style="font-size:12px;float:left;">
												<tr>
													<td>血脂：</td>
													<td>
														<select name="searchHealth.bloodFat" style="border: #999 1px solid;height: 37px;width:200px; display:inline">
															<option value="">请选择</option>
															<option value="1" <s:if test='searchHealth.bloodFat=="1"'> selected="selected"</s:if>>正常</option>
															<option value="0" <s:if test='searchHealth.bloodFat=="0"'> selected="selected"</s:if>>异常</option>
														</select>
													</td>
													<td>血压：</td>
													<td>
														<select name="searchHealth.bloodPressure" style="border: #999 1px solid;height: 37px;width:200px; display:inline">
															<option value="">请选择</option>
															<option value="1" <s:if test='searchHealth.bloodPressure=="1"'> selected="selected"</s:if>>正常</option>
															<option value="0" <s:if test='searchHealth.bloodPressure=="0"'> selected="selected"</s:if>>异常</option>
														</select>
													</td>
													<td>肝功能：</td>
													<td>
														<select name="searchHealth.liver" style="border: #999 1px solid;height: 37px;width:200px; display:inline">
															<option value="">请选择</option>
															<option value="1" <s:if test='searchHealth.liver=="1"'> selected="selected"</s:if>>正常</option>
															<option value="0" <s:if test='searchHealth.liver=="0"'> selected="selected"</s:if>>异常</option>
														</select>
													</td>
												</tr>
												<tr>
													<td>血常规：</td>
													<td>
														<select name="searchHealth.blood" style="border: #999 1px solid;height: 37px;width:200px; display:inline">
															<option value="">请选择</option>
															<option value="1" <s:if test='searchHealth.blood=="1"'> selected="selected"</s:if>>正常</option>
															<option value="0" <s:if test='searchHealth.blood=="0"'> selected="selected"</s:if>>异常</option>
														</select>
													</td>
													<td>心率：</td>
													<td>
														<select name="searchHealth.heartRate" style="border: #999 1px solid;height: 37px;width:200px; display:inline">
															<option value="">请选择</option>
															<option value="1" <s:if test='searchHealth.heartRate=="1"'> selected="selected"</s:if>>正常</option>
															<option value="0" <s:if test='searchHealth.heartRate=="0"'> selected="selected"</s:if>>异常</option>
														</select>
													</td>
													<td>肿瘤标志物：</td>
													<td>
														<select name="searchHealth.tumorMarker" style="border: #999 1px solid;height: 37px;width:200px; display:inline">
															<option value="">请选择</option>
															<option value="1" <s:if test='searchHealth.tumorMarker=="1"'> selected="selected"</s:if>>正常</option>
															<option value="0" <s:if test='searchHealth.tumorMarker=="0"'> selected="selected"</s:if>>异常</option>
														</select>
													</td>
												</tr>
												<tr>
													<td>x光透视：</td>
													<td>
														<select name="searchHealth.xgRay" style="border: #999 1px solid;height: 37px;width:200px; display:inline">
															<option value="">请选择</option>
															<option value="1" <s:if test='searchHealth.xgRay=="1"'> selected="selected"</s:if>>正常</option>
															<option value="0" <s:if test='searchHealth.xgRay=="0"'> selected="selected"</s:if>>异常</option>
														</select>
													</td>
													<td>眼耳鼻咽喉：</td>
													<s:if test="#session.role==3">
														<td colspan="3">
															<select name="searchHealth.eent" style="border: #999 1px solid;height: 37px;width:200px; display:inline">
																<option value="">请选择</option>
																<option value="1" <s:if test='searchHealth.eent=="1"'> selected="selected"</s:if>>正常</option>
																<option value="0" <s:if test='searchHealth.eent=="0"'> selected="selected"</s:if>>异常</option>
															</select>
														</td>
													</s:if>
													<s:if test="#session.role==1">
														<td>
															<select name="searchHealth.eent" style="border: #999 1px solid;height: 37px;width:200px; display:inline">
																<option value="">请选择</option>
																<option value="1" <s:if test='searchHealth.eent=="1"'> selected="selected"</s:if>>正常</option>
																<option value="0" <s:if test='searchHealth.eent=="0"'> selected="selected"</s:if>>异常</option>
															</select>
														</td>
														<td>用户：</td>
														<td>
															<select data-value="<s:property value="searchHealth.userId"/>" name="searchHealth.userId" style="border: #999 1px solid;height: 37px;width:200px; display:inline"></select>
														</td>
													</s:if>
												</tr>
												<s:if test="#session.role==3">
													<tr>
														<td>检查日期：</td>
														<td colspan="5">
															<div style="width:30%;float:left;" class="am-u-sm-9"><input style="height:35px;width:150px;" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" name="searchHealth.minDate" value="<s:property value="searchHealth.minDate"/>"/></div>
															<span style="float:left;margin-left:50px;">--</span>
															<div style="width:30%;float:left;margin-left:10px;" class="am-u-sm-9"><input style="height:35px;width:150px;" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" name="searchHealth.maxDate" value="<s:property value="searchHealth.maxDate"/>"/></div>
														</td>
													</tr>
												</s:if>
												<s:if test="#session.role==1">
													<tr>
														<td>部门：</td>
														<td>
															<select data-value="<s:property value="searchHealth.user.departmentId"/>" name="searchHealth.user.departmentId" style="border: #999 1px solid;height: 37px;width:200px; display:inline"></select>
														</td>
														<td>检查日期：</td>
														<td colspan="3">
															<div style="width:30%;float:left;" class="am-u-sm-9"><input style="height:35px;width:150px;" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" name="searchHealth.minDate" value="<s:property value="searchHealth.minDate"/>"/></div>
															<span style="float:left;margin-left:50px;">--</span>
															<div style="width:30%;float:left;margin-left:10px;" class="am-u-sm-9"><input style="height:35px;width:150px;" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" name="searchHealth.maxDate" value="<s:property value="searchHealth.maxDate"/>"/></div>
														</td>
													</tr>
												</s:if>
											</table>
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
												<th class="table-title">部门</th>
												<th class="table-title">姓名</th>
												<th class="table-title">健康状况</th>
												<th class="table-title">血脂</th>
												<th class="table-title">血压</th>
												<th class="table-title">肝功能</th>
												<th class="table-title">血常规</th>
												<th class="table-title">心率</th>
												<th class="table-title">肿瘤标志物</th>
												<th class="table-title">x光透视</th>
												<th class="table-title">眼耳鼻咽喉</th>
												<th class="table-title">检查时间</th>
												<s:if test="#session.role==1">
													<th class="table-title">操作</th>
												</s:if>
											</tr>
										</thead>
										<tbody>
										<s:iterator value="list" status="st">
											<tr>
												<!--行start-->
												<td><s:property value="user.department.name"/></td>
												<td><s:property value="user.realName"/></td>
												<td>
													<s:if test="user.healthStatus==1">
														<span class="normal">正常</span>
													</s:if>
													<s:if test="user.healthStatus==0">
														<span class="exception">异常</span>
													</s:if>
												</td>
												<td>
													<s:if test="bloodFat==1">
														<span class="normal">正常</span>
													</s:if>
													<s:if test="bloodFat==0">
														<span class="exception">异常</span>
													</s:if>
												</td>
												<td>
													<s:if test="bloodPressure==1">
														<span class="normal">正常</span>
													</s:if>
													<s:if test="bloodPressure==0">
														<span class="exception">异常</span>
													</s:if>
												</td>
												<td>
													<s:if test="liver==1">
														<span class="normal">正常</span>
													</s:if>
													<s:if test="liver==0">
														<span class="exception">异常</span>
													</s:if>
												</td>
												<td>
													<s:if test="blood==1">
														<span class="normal">正常</span>
													</s:if>
													<s:if test="blood==0">
														<span class="exception">异常</span>
													</s:if>
												</td>
												<td>
													<s:if test="heartRate==1">
														<span class="normal">正常</span>
													</s:if>
													<s:if test="heartRate==0">
														<span class="exception">异常</span>
													</s:if>
												</td>
												<td>
													<s:if test="tumorMarker==1">
														<span class="normal">正常</span>
													</s:if>
													<s:if test="tumorMarker==0">
														<span class="exception">异常</span>
													</s:if>
												</td>
												<td>
													<s:if test="xgRay==1">
														<span class="normal">正常</span>
													</s:if>
													<s:if test="xgRay==0">
														<span class="exception">异常</span>
													</s:if>
												</td>
												<td>
													<s:if test="eent==1">
														<span class="normal">正常</span>
													</s:if>
													<s:if test="eent==0">
														<span class="exception">异常</span>
													</s:if>
												</td>
												<td>
													<s:property value="checkDate"/>
												</td>
												<s:if test="#session.role==1">
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
												</s:if>
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
					<form class="am-form" name="addForm" action="health_add.action" method="post" id="add-modal1"
						onsubmit="return checkAdd()">
						<div class="am-g" style="margin-top: 4px;">
							<div class="am-u-sm-3 am-u-md-3  am-text-right">
								姓名
							</div>
							<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
								<select data-am-selected placeholder="请选择" name="addHealth.userId">
								</select>
							</div>
						</div>
						<div class="am-g" style="margin-top: 4px;">
							<div class="am-u-sm-3 am-u-md-3  am-text-right">
								血脂
							</div>
							<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
								<label><input type="radio" name="addHealth.bloodFat" value="1" checked="checked"/>正常</label>
								<label><input type="radio" name="addHealth.bloodFat" value="0"/>异常</label>
							</div>
						</div>
						<div class="am-g" style="margin-top: 4px;">
							<div class="am-u-sm-3 am-u-md-3  am-text-right">
								血压
							</div>
							<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
								<label><input type="radio" name="addHealth.bloodPressure" value="1" checked="checked"/>正常</label>
								<label><input type="radio" name="addHealth.bloodPressure" value="0"/>异常</label>
							</div>
						</div>
						<div class="am-g" style="margin-top: 4px;">
							<div class="am-u-sm-3 am-u-md-3  am-text-right">
								肝功能
							</div>
							<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
								<label><input type="radio" name="addHealth.liver" value="1" checked="checked"/>正常</label>
								<label><input type="radio" name="addHealth.liver" value="0"/>异常</label>
							</div>
						</div>
						<div class="am-g" style="margin-top: 4px;">
							<div class="am-u-sm-3 am-u-md-3  am-text-right">
								血常规
							</div>
							<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
								<label><input type="radio" name="addHealth.blood" value="1" checked="checked"/>正常</label>
								<label><input type="radio" name="addHealth.blood" value="0"/>异常</label>
							</div>
						</div>
						<div class="am-g" style="margin-top: 4px;">
							<div class="am-u-sm-3 am-u-md-3  am-text-right">
								心率
							</div>
							<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
								<label><input type="radio" name="addHealth.heartRate" value="1" checked="checked"/>正常</label>
								<label><input type="radio" name="addHealth.heartRate" value="0"/>异常</label>
							</div>
						</div>
						<div class="am-g" style="margin-top: 4px;">
							<div class="am-u-sm-3 am-u-md-3  am-text-right">
								肿瘤标志物
							</div>
							<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
								<label><input type="radio" name="addHealth.tumorMarker" value="1" checked="checked"/>正常</label>
								<label><input type="radio" name="addHealth.tumorMarker" value="0"/>异常</label>
							</div>
						</div>
						<div class="am-g" style="margin-top: 4px;">
							<div class="am-u-sm-3 am-u-md-3  am-text-right">
								x光透视
							</div>
							<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
								<label><input type="radio" name="addHealth.xgRay" value="1" checked="checked"/>正常</label>
								<label><input type="radio" name="addHealth.xgRay" value="0"/>异常</label>
							</div>
						</div>
						<div class="am-g" style="margin-top: 4px;">
							<div class="am-u-sm-3 am-u-md-3  am-text-right">
								眼耳鼻咽喉
							</div>
							<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
								<label><input type="radio" name="addHealth.eent" value="1" checked="checked"/>正常</label>
								<label><input type="radio" name="addHealth.eent" value="0"/>异常</label>
							</div>
						</div>
						<div class="am-g" style="margin-top: 4px;">
							<div class="am-u-sm-3 am-u-md-3  am-text-right">
								检查时间
							</div>
							<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
								<input style="height:100%;" name="addHealth.checkDate" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" />
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
					体检数据详情
					<a href="javascript: void(0)" class="am-close am-close-spin"
						data-am-modal-close>&times;</a>
				</div>
				<div class="am-modal-bd">
					<form class="am-form" name="updateForm" action="health_update1.action" method="post" id="update-modal1"
						onsubmit="return checkUpdate()">
						<div class="am-g" style="margin-top: 4px;">
							<div class="am-u-sm-3 am-u-md-3  am-text-right">
								部门
							</div>
							<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
								<span name="departmentName"></span>
							</div>
						</div>
						<div class="am-g" style="margin-top: 4px;">
							<div class="am-u-sm-3 am-u-md-3  am-text-right">
								姓名
							</div>
							<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
								<span name="realName"></span>
								<input type="hidden" name="health.id">
							</div>
						</div>
						<div class="am-g" style="margin-top: 4px;">
							<div class="am-u-sm-3 am-u-md-3  am-text-right">
								血脂
							</div>
							<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
								<label><input type="radio" name="health.bloodFat" value="1"/>正常</label>
								<label><input type="radio" name="health.bloodFat" value="0"/>异常</label>
							</div>
						</div>
						<div class="am-g" style="margin-top: 4px;">
							<div class="am-u-sm-3 am-u-md-3  am-text-right">
								血压
							</div>
							<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
								<label><input type="radio" name="health.bloodPressure" value="1"/>正常</label>
								<label><input type="radio" name="health.bloodPressure" value="0"/>异常</label>
							</div>
						</div>
						<div class="am-g" style="margin-top: 4px;">
							<div class="am-u-sm-3 am-u-md-3  am-text-right">
								肝功能
							</div>
							<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
								<label><input type="radio" name="health.liver" value="1"/>正常</label>
								<label><input type="radio" name="health.liver" value="0"/>异常</label>
							</div>
						</div>
						<div class="am-g" style="margin-top: 4px;">
							<div class="am-u-sm-3 am-u-md-3  am-text-right">
								血常规
							</div>
							<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
								<label><input type="radio" name="health.blood" value="1"/>正常</label>
								<label><input type="radio" name="health.blood" value="0"/>异常</label>
							</div>
						</div>
						<div class="am-g" style="margin-top: 4px;">
							<div class="am-u-sm-3 am-u-md-3  am-text-right">
								心率
							</div>
							<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
								<label><input type="radio" name="health.heartRate" value="1"/>正常</label>
								<label><input type="radio" name="health.heartRate" value="0"/>异常</label>
							</div>
						</div>
						<div class="am-g" style="margin-top: 4px;">
							<div class="am-u-sm-3 am-u-md-3  am-text-right">
								肿瘤标志物
							</div>
							<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
								<label><input type="radio" name="health.tumorMarker" value="1"/>正常</label>
								<label><input type="radio" name="health.tumorMarker" value="0"/>异常</label>
							</div>
						</div>
						<div class="am-g" style="margin-top: 4px;">
							<div class="am-u-sm-3 am-u-md-3  am-text-right">
								x光透视
							</div>
							<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
								<label><input type="radio" name="health.xgRay" value="1"/>正常</label>
								<label><input type="radio" name="health.xgRay" value="0"/>异常</label>
							</div>
						</div>
						<div class="am-g" style="margin-top: 4px;">
							<div class="am-u-sm-3 am-u-md-3  am-text-right">
								眼耳鼻咽喉
							</div>
							<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
								<label><input type="radio" name="health.eent" value="1"/>正常</label>
								<label><input type="radio" name="health.eent" value="0"/>异常</label>
							</div>
						</div>
						<div class="am-g" style="margin-top: 4px;">
							<div class="am-u-sm-3 am-u-md-3  am-text-right">
								检查时间
							</div>
							<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
								<input style="height:100%;" name="health.checkDate" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" />
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
		
		<script>
			if($("select[name='searchHealth.userId']").length>0){
				var userId = $("select[name='searchHealth.userId']").data("value");
				var departmentId = $("select[name='searchHealth.user.departmentId']").data("value");
				$.getJSON("user_drop.action",{},function(list){
					var html = '<option label="--请选择--" value="">--请选择--</option>';
					$.each(list,function(index,data){
						html+='<option label="'+data.realName+'" value="'+data.id+'" ';
						if(data.id==userId){
							html+=' selected="selected" ';
						}
						html+=+'>'+data.realName+'</option>';
					});
					$("select[name='searchHealth.userId']").html(html);
				})
				$.getJSON("department_drop.action",{},function(list){
					var html = '<option label="--请选择--" value="">--请选择--</option>';
					$.each(list,function(index,data){
						html+='<option label="'+data.name+'" value="'+data.id+'" ';
						if(data.id==departmentId){
							html+=' selected="selected" ';
						}
						html+='>'+data.name+'</option>';
					});
					$("select[name='searchHealth.user.departmentId']").html(html);
				})
			}
			function add() {
				$("#add-modal").modal({
					width: 700,
					height: 490
				});
				$.getJSON("user_drop.action",{},function(list){
					var html = "";
					$.each(list,function(index,data){
						html+='<option label="'+data.realName+'" value="'+data.id+'">'+data.realName+'</option>';
					});
					$("#add-modal select[name='addHealth.userId']").html(html);
				})
			}
			function toUpdate(id){
				$.getJSON("health_update.action",{"health.id":id},function(health){
					$("#update-modal span[name='realName']").html(health.user.realName);
					$("#update-modal input[name='health.id']").val(health.id);
					$("#update-modal span[name='departmentName']").html(health.user.department.name);
					$("#update-modal input[name='health.bloodFat'][value='"+health.bloodFat+"']").prop("checked",true);
					$("#update-modal input[name='health.bloodPressure'][value='"+health.bloodPressure+"']").prop("checked",true);
					$("#update-modal input[name='health.liver'][value='"+health.liver+"']").prop("checked",true);
					$("#update-modal input[name='health.blood'][value='"+health.blood+"']").prop("checked",true);
					$("#update-modal input[name='health.heartRate'][value='"+health.heartRate+"']").prop("checked",true);
					$("#update-modal input[name='health.tumorMarker'][value='"+health.tumorMarker+"']").prop("checked",true);
					$("#update-modal input[name='health.xgRay'][value='"+health.xgRay+"']").prop("checked",true);
					$("#update-modal input[name='health.eent'][value='"+health.eent+"']").prop("checked",true);
					$("#update-modal").modal({width:700,height:690});
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
						location.href = "health_delete.action?searchHealth.id=" + id;
					},
					onCancel: function() {
					}
				});
			}
			function checkAdd(){
			  	if($("#add-modal input[name='addHealth.checkDate']").val()==""){
			  		alert("请选择检查时间");
			  		return false;
			  	}
		  		return true;
  			}
  			function checkUpdate(){
			  	if($("#update-modal input[name='health.checkDate']").val()==""){
			  		alert("请选择检查时间");
			  		return false;
			  	}
		  		return true;
  			}
</script>
	</body>

</html>