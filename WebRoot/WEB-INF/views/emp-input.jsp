<i><%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>录入员工信息</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>
<body>
<h4>录入员工信息</h4>
<form id="saveForm" action="emp-save" method="post">
<label for="employeeName">姓名</label>
<input type="text" id="employeeName" name="employee.employeeName">
<br> 
<label for="employeeEmail">Email</label> 
<input type="text" id="employeeEmail" name="employee.employeeEmail"><br>
<label for="employeeBirthday">生日</label> <input type="text" id="employeeBirthday" name="employee.employeeBirthday"><br>
<label for="department">部门</label> <select id="department" name="employee.department.id">
<option value="0">请选择...</option>
<c:forEach items="${departments}" var="department" varStatus="departmentStatus">
<option value="${department.id}">${department.departmentName}</option>
</c:forEach>
</select><br> <input type="submit" value="确定">
</form>
</body>
</html></i>