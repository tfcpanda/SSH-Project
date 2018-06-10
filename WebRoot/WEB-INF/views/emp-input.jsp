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
<script type="text/javascript" src="./scripts/jquery-3.3.1.min.js">
</script>
</head>
<body>
	<h4>录入员工信息</h4>
	<form id="saveForm" action="emp-save" method="post">
		<label for="employeeName">姓名</label> <input type="text"
			id="employeeName" name="employee.employeeName"> <br> <label
			for="employeeEmail">Email</label> <input type="text"
			id="employeeEmail" name="employee.employeeEmail"><br> <label
			for="employeeBirthday">生日</label> <input type="text"
			id="employeeBirthday" name="employee.employeeBirthday"><br>
		<label for="department">部门</label> <select id="department"
			name="employee.department.id">
			<option value="0">请选择...</option>
			<c:forEach items="${departments}" var="department"
				varStatus="departmentStatus">
				<option value="${department.id}">${department.departmentName}</option>
			</c:forEach>
		</select>
		<br> 
		<input id="sub" type="submit" value="确定">
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#employeeName").change(function() {
				var val = $(this).val();
				val = $.trim(val);
				var $this = $(this);
				if (val != "") {
					//把当前节点后面的所有 font 兄弟节点删除
					$this.nextAll("font").remove();
					var url = "emp-validateEmployeeName?employeeName=" + val;
					$.ajax({
						url : url,
						dataType : "json",
						type : "post",
						success : function(data) {
							//若data的返回值为true，则提示删除成功，且把当前行删除
							if (data.status) {
								$this.after("<font color='green'>姓名可用!</font>");
							} else {
								$this.after("<font color='red'>姓名不可用!</font>");
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
			});
		});
	</script>
</body>


	</html>