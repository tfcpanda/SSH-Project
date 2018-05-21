package cn.edu.hzvtc.entities;

import java.util.Date;

public class Employee {
	private Integer id;
	// 不能被修改
	private String employeeName;
	private String employeeEmail;
	// 从前端传入的是 String 类型, 所以需要注意转换
	private Date employeeBirthday;
	// 不能被修改
	private Date createTime;
	// 单向 n-1 的关联关系
	private Department department;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public String getEmployeeEmail() {
		return employeeEmail;
	}

	public void setEmployeeEmail(String employeeEmail) {
		this.employeeEmail = employeeEmail;
	}

	public Date getEmployeeBirthday() {
		return employeeBirthday;
	}

	public void setEmployeeBirthday(Date employeeBirthday) {
		this.employeeBirthday = employeeBirthday;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	@Override
	public String toString() {
		return "Employee [id=" + id + ", employeeName=" + employeeName
				+ ", employeeEmail=" + employeeEmail + ", employeeBirthday="
				+ employeeBirthday + ", createTime=" + createTime
				+ ", department=" + department + "]";
	}

}
