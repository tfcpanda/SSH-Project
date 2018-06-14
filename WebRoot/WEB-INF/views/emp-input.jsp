<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>后台管理</title>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <script type="text/javascript" src="js/libs/modernizr.min.js"></script>
    <script type="text/javascript" src="./scripts/jquery-3.3.1.min.js">
</script>
</head>
<body>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="index.html" class="navbar-brand">后台管理</a></h1>
            <ul class="navbar-list clearfix">
                <li><a class="on" href="emp-list">首页</a></li>
                <li><a href="#">网站首页</a></li>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
                <li><a href="#">管理员</a></li>
                <li><a href="#">修改密码</a></li>
                <li><a href="#">退出</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="container clearfix">
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>菜单</h1>
        </div>
        <div class="sidebar-content">
            <ul class="sidebar-list">
                <li>
                    <a href="#"><i class="icon-font">&#xe003;</i>常用操作</a>
                    <ul class="sub-menu">
                        <li><a href="emp-list"><i class="icon-font">&#xe008;</i>员工信息</a></li>
                        <li><a href="#"><i class="icon-font">&#xe005;</i>博文管理</a></li>
                        <li><a href="#"><i class="icon-font">&#xe006;</i>分类管理</a></li>
                        <li><a href="#"><i class="icon-font">&#xe004;</i>留言管理</a></li>
                        <li><a href="#"><i class="icon-font">&#xe012;</i>评论管理</a></li>
                        <li><a href="#"><i class="icon-font">&#xe052;</i>友情链接</a></li>
                        <li><a href="#"><i class="icon-font">&#xe033;</i>广告管理</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="icon-font">&#xe018;</i>系统管理</a>
                    <ul class="sub-menu">
                        <li><a href="#"><i class="icon-font">&#xe017;</i>系统设置</a></li>
                        <li><a href="#"><i class="icon-font">&#xe037;</i>清理缓存</a></li>
                        <li><a href="#"><i class="icon-font">&#xe046;</i>数据备份</a></li>
                        <li><a href="#"><i class="icon-font">&#xe045;</i>数据还原</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="index.jsp">首页</a><span class="crumb-step">&gt;</span><a class="crumb-name" href="emp-list">员工列表</a><span class="crumb-step">&gt;</span><span>新增员工信息</span></div>
        </div>
        <div class="result-wrap">
            <div class="result-content">
                <form id="saveForm" action="emp-save" method="post">
                    <table class="insert-tab" width="100%">
                        <tbody>
                        	<!--部门开始-->
                        <tr>
                            <th width="120">部门：</th>
                            <td>
                                <select id="department" name="employee.department.id">
                                    <option value="0">请选择</option>
                                    <c:forEach items="${departments}" var="department" varStatus="departmentStatus">
		<option value="${department.id}" <c:if test="${department.id eq employee.department.id}">
			selected
			</c:if>>
			${department.departmentName}
			</option>
			</c:forEach> <br> 
                                </select> 
                            </td>
                        </tr>
                        <!--部门结束-->
                        <!--姓名开始-->
                            <tr>
                                <th>姓名：</th>
                                <td>
                                <c:if test="${employee eq null}">
                                   <input class="common-text required" id="employeeName" name="employee.employeeName" size="50" value="" type="text">
                               	</c:if>
                               	<c:if test="${employee ne null}">
									<input type="text" id="employeeName" name="employee.employeeName" disabled="disabled" value="${employee.employeeName}">
									<input type="hidden" name="employee.id" value="${employee.id}">
								</c:if>
                                </td>
                            </tr>
                            <!--姓名结束-->
                            <!--邮箱开始-->
                            <tr>
                                <th>EMAIL：</th>
                                <td><input id="employeeEmail" value="${employee.employeeEmail}" class="common-text" name="employee.employeeEmail" size="50"  type="text"></td>
                            </tr>
                           <!--邮箱结束-->
                           <!--生日开始-->
                            <tr>
                                <th>生日：</th>
                                  <td><input value="<fmt:formatDate value='${employee.employeeBirthday}'
type='date' dateStyle='default' />" id="employeeBirthday" class="common-text" name="employee.employeeBirthday" size="50"  type="text"></td>
                            </tr>
                            <!--生日结束-->
                            <tr>
                                <th></th>
                                <td>
                                    <input class="btn btn-primary btn6 mr10" value="提交" id = "sub"  type="submit">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>

    </div>
    <!--/main-->
</div>
</body>

<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$("#employeeName")
									.change(
											function() {
												var val = $(this).val();
												val = $.trim(val);
												var $this = $(this);
												if (val != "") {
													//把当前节点后面的所有 font 兄弟节点删除
													$this.nextAll("font")
															.remove();
													var url = "emp-validateEmployeeName?employeeName="
															+ val;
													$
															.ajax({
																url : url,
																dataType : "json",
																type : "post",
																success : function(
																		data) {
																	//若data的返回值为true，则提示删除成功，且把当前行删除
																	if (data.status) {
																		$this
																				.after("<font color='green'>姓名可用!</font>");
																	} else {
																		$this
																				.after("<font color='red'>姓名不可用!</font>");
																	}
																}
															});
												} else {
													alert("姓名 不能为空！");
													$(this).val("");
													$this.focus();
												}
											});
						});
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			$(document).on("click", "#sub", function() {
				if ($("#employeeName").val() == '') {
					alert("用户名不能为空！");
					return false;
				}
				if ($("#employeeEmail").val() == '') {
					alert("邮箱不能为空！");
					return false;
				}
				if ($("#employeeBirthday").val() == '') {
					alert("生日不能为空！");
					return false;
				}
				if ($("#department").val() == null) {
					alert("部门不能为空！");
					return false;
				}
				var coun =$("#department").val();
			if (coun == 0) {
				alert("部门不能为空！");
				return false;
			}
			});
		});
	</script>
</html>