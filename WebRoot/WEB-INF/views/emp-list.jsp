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
</head>
<body>
	<h4>查看员工信息</h4>
	<c:choose>
		<c:when test="${employees eq null}">
没有任何员工信息
</c:when>
		<c:when test="${fn:length(employees) eq 0}">
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
				</tr>
				<c:forEach items="${employees}" var="employee"
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
					</tr>
				</c:forEach>
				<tr>
				<td colspan="6" align="center">
				<a href="">首页</a>
				<a href="">上一页</a> 
				<a href="">下一页</a> 
				<a href="">尾页</a> 
				</td>
				</tr>
			</table>
		</c:otherwise>
	</c:choose>
</body>
</html>