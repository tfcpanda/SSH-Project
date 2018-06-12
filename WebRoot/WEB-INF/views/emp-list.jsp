<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>后台管理</title>
		<link rel="stylesheet" type="text/css" href="css/common.css" />
		<link rel="stylesheet" type="text/css" href="css/main.css" />
		<script type="text/javascript" src="js/libs/modernizr.min.js"></script>
		<script type="text/javascript" src="./scripts/jquery-3.3.1.min.js">		
</script>
	</head>

	<body>
		<div class="topbar-wrap white">
			<div class="topbar-inner clearfix">
				<div class="topbar-logo-wrap clearfix">
					<h1 class="topbar-logo none"><a href="#" class="navbar-brand">后台管理</a></h1>
					<ul class="navbar-list clearfix">
						<li>
							<a class="on" href="#">首页</a>
						</li>
						<li>
							<a href="http://www.baidu.com/" target="_blank">网站首页</a>
						</li>
					</ul>
				</div>
				<div class="top-info-wrap">
					<ul class="top-info-list clearfix">
						<li>
							<a href="#">管理员</a>
						</li>
						<li>
							<a href="#">修改密码</a>
						</li>
						<li>
							<a href="#">退出</a>
						</li>
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
								<li>
									<a href="#"><i class="icon-font">&#xe008;</i>作品管理</a>
								</li>
								<li>
									<a href="#"><i class="icon-font">&#xe005;</i>博文管理</a>
								</li>
								<li>
									<a href="#"><i class="icon-font">&#xe006;</i>分类管理</a>
								</li>
								<li>
									<a href="#"><i class="icon-font">&#xe004;</i>留言管理</a>
								</li>
								<li>
									<a href="#"><i class="icon-font">&#xe012;</i>评论管理</a>
								</li>
								<li>
									<a href="#"><i class="icon-font">&#xe052;</i>友情链接</a>
								</li>
								<li>
									<a href="#"><i class="icon-font">&#xe033;</i>广告管理</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="#"><i class="icon-font">&#xe018;</i>系统管理</a>
							<ul class="sub-menu">
								<li>
									<a href="#"><i class="icon-font">&#xe017;</i>系统设置</a>
								</li>
								<li>
									<a href="#"><i class="icon-font">&#xe037;</i>清理缓存</a>
								</li>
								<li>
									<a href="#"><i class="icon-font">&#xe046;</i>数据备份</a>
								</li>
								<li>
									<a href="#"><i class="icon-font">&#xe045;</i>数据还原</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<!--/sidebar-->
			<div class="main-wrap">

				<div class="crumb-wrap">
					<div class="crumb-list"><i class="icon-font"></i>
						<a href="#">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">作品管理</span></div>
				</div>
				<div class="search-wrap">
					<div class="search-content">
						<form action="#" method="post">
							<table class="search-tab">
								<tr>
									<th width="120">选择分类:</th>
									<td>
										<select name="search-sort" id="">
											<option value="">全部</option>
											<option value="19">精品界面</option>
											<option value="20">推荐界面</option>
										</select>
									</td>
									<th width="70">关键字:</th>
									<td><input class="common-text" placeholder="关键字" name="keywords" value="" id="" type="text"></td>
									<td><input class="btn btn-primary btn2" name="sub" value="查询" type="submit"></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
				<div class="result-wrap">
					<form name="myform" id="myform" method="post">
						<div class="result-title">
							<div class="result-list">
								<a href=emp-input><i class="icon-font"></i>新增作品</a>
								<a id="batchDel" href="javascript:void(0)"><i class="icon-font"></i>批量删除</a>
								<a id="updateOrd" href="javascript:void(0)"><i class="icon-font"></i>更新排序</a>
							</div>
						</div>
						<div class="result-content">
							<c:choose>
								<c:when test="${pageBean.data eq null}">
									没有任何员工信息
								</c:when>
								<c:when test="${fn:length(pageBean.data) eq 0}">
									没有任何员工信息
								</c:when>
								<c:otherwise>
									<table id="empTable" class="result-tab" width="100%">
										<!--头部 样式-->
										<thead>
											<tr>
												<th class="tc" width="5%"><input class="allChoose" name="" type="checkbox"></th>
												<th>ID</th>
												<th>姓名 </th>
												<th>EMAIL</th>
												<th>生日</th>
												<th>创建时间</th>
												<th>部门</th>
												<th colspan="2">操作</th>
											</tr>
										</thead>
										<!--中部 显示-->
										<tbody id="show">
											<c:forEach items="${pageBean.data}" var="employee" varStatus="employeeStatus">
												<tr>
													<td class="tc"><input type="checkbox"></td>
													<td>${employee.id}</td>
													<td>${employee.employeeName}</td>
													<td>${employee.employeeEmail}</td>
													<td>
														<fmt:formatDate value="${employee.employeeBirthday}" pattern="yyyy-MM-dd" />
													</td>
													<td>
														<fmt:formatDate value="${employee.createTime}" pattern="yyyy-MM-dd hh:mm:ss" />
													</td>
													<td>${employee.department.departmentName}</td>
													<td>
														<a class="delete" href="emp-delete?id=${employee.id}">删除</a>
														<input type="hidden" value="${employee.employeeName}">
													</td>
													<td><a href="emp-input?id=${employee.id}">编辑</a></td>
												</tr>
											</c:forEach>
										</tbody>
										<tfoot id="empTable">
												<td colspan="9" align="center">
													<a href="emp-list?pageNo=${pageBean.firstPage}">首页</a>
													<a href="emp-list?pageNo=${pageBean.prePage}">上一页</a>
													当前第${pageBean.pageNo},共${pageBean.lastPage}页
													<a href="emp-list?pageNo=${pageBean.nextPage}">下一页</a>
													<a href="emp-list?pageNo=${pageBean.lastPage}">末页</a>
												</td>
										</tfoot>
									</table>
								</c:otherwise>
							</c:choose>
						</div>
					</form>
				</div>
			</div>
			<!--/main-->
		</div>
		<!-- script代码 -->
		<script type="text/javascript">
			$(document).ready(function() {
				$(document).on("click", ".delete", function() {
					var employeeName = $(this).next(":hidden").val();
					var flag = confirm("确定要删除" + employeeName + "的信息吗?");
					if(flag) {
						var $tr = $(this).parent().parent();
						//删除，使用 ajax 的方式
						var url = this.href;
						$.ajax({
							url: url,
							dataType: "json",
							type: "post",
							success: function(data) {
								//若data的返回值为true，则提示删除成功，且把当前行删除
								
								if(data.status) {
									var $this= $("#empTable tbody");
									 $this.html("");
									$.each(data.pageBean.data, function(index, obj) {
										var tr = "<tr>";
										tr = tr +  "<td class='tc'>"+"<input type='checkbox'>"+"</td>";
										tr = tr + "<td>" + obj.id + "</td>";
										tr = tr + "<td>" + obj.employeeName + "</td>";
										tr = tr + "<td>" + obj.employeeEmail + "</td>";
										tr = tr + "<td>" + obj.employeeBirthday.substring(0, obj.employeeBirthday.indexOf("T")) + "</td>";
										tr = tr + "<td>" + obj.createTime.replace("T", " ") + "</td>";
										tr = tr + "<td>" + obj.department.departmentName + "</td>";
										tr=tr+"<td><a href='emp-delete?id="+ obj.id+"&pageNo="+data.pageBean.pageNo +"'class='delete'>删除</a><input type='hidden' value='"+obj.employeeName+"'/></td>"
										tr = tr + "<td><a href='emp-input?id=" + obj.id + "' class='delete'>编辑</a></td>";
										tr = tr + "</tr>"
										$("#empTable tbody").append(tr);
										
										/* console.log(obj); */
									});
									
									$("#empTable tfoot").html("");
									tr="<tr><td colspan='9' align='center'>";
									tr=tr+"&nbsp;<a href='emp-list?pageNo="+data.pageBean.firstPage+"'>首页</a>&nbsp;";
									tr=tr+"<a href='emp-list?pageNo="+data.pageBean.prePage+"'>上一页</a>&nbsp;";
									tr=tr+"<a>当前第"+data.pageBean.pageNo+"页,&nbsp;共"+data.pageBean.lastPage+"页</a>&nbsp;";
									tr=tr+"<a href='emp-list?pageNo="+data.pageBean.nextPage+"'>下一页</a>&nbsp;";
									tr=tr+"<a href='emp-list?pageNo="+data.pageBean.lastPage+"'>末页</a>&nbsp;";
									$("#empTable tfoot").append(tr);
									alert("删除成功!"); 
								} else {
									//若data的返回值为false，提示删除失败
									alert("删除失败!");
								}
							}
						});
					}
					//取消超链接的默认行为
					return false;

				});
			});
		</script>
	</body>

</html>