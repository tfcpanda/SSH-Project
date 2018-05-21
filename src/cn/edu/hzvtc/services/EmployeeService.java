package cn.edu.hzvtc.services;

import java.util.List;

import cn.edu.hzvtc.dao.EmployeeDao;
import cn.edu.hzvtc.entities.Employee;

public class EmployeeService {
	//业务逻
	private EmployeeDao employeeDao;
	public void setEmployeeDao(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}
	public List<Employee> getAll() {
		return this.employeeDao.getAll();
	}


}
