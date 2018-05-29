<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>查看员工信息</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="./scripts/jquery-3.3.1.min.js">
</script>
</head>


<body>
	<h4>查看员工信息</h4>
	<c:choose>
		<c:when test="${pageBean.data eq null}">
没有任何员工信息
</c:when>
		<c:when test="${fn:length(pageBean.data) eq 0}">
没有任何员工信息
</c:when>
		<c:otherwise>
			<table border="1" cellpadding="10" cellspacing="0">
				<tr>
					<td>ID</td>
					<td>姓名</td>
					<td>EMAIL</td>
					<td>生日</td>
					<td>创建时间</td>
					<td>部门</td>
					<td>删除</td>
				</tr>
				<c:forEach items="${pageBean.data}" var="employee"
					varStatus="employeeStatus">
					<tr>
						<td>${employee.id}</td>
						<td>${employee.employeeName}</td>
						<td>${employee.employeeEmail}</td>
						<td><fmt:formatDate value="${employee.employeeBirthday}"
								type="date" dateStyle="default" /></td>
						<td><fmt:formatDate value="${employee.createTime}"
								type="both" /></td>
						<td>${employee.department.departmentName}</td>
						<td><a class="delete" href="emp-delete?id=${employee.id}">删除</a></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="6" align="center"><a
						href="emp-list?pageNo=${pageBean.firstPage}">首页</a> <a
						href="emp-list?pageNo=${pageBean.prePage}">上一页</a>
						当前第${pageBean.pageNo},共${pageBean.lastPage}页 <a
						href="emp-list?pageNo=${pageBean.nextPage}">下一页</a> <a
						href="emp-list?pageNo=${pageBean.lastPage}">末页</a></td>
				</tr>
			</table>
		</c:otherwise>
	</c:choose>
	<script type="text/javascript">
		$(".delete").click(function() {
			var flag = confirm("确定删除吗？");
			if (!flag) {
				return false;
			}
		});
	</script>
	<c:if test="${returnMsg eq 1}">
		<script type="text/javascript">
			alert("数据删除成功！");
		</script>
	</c:if>
</body>
</html>