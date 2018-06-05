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
	//分页
	public List<Employee> getEmployeeByPage(int page, int pagesize) {
		return this.employeeDao.getEmployeeByPage(page, pagesize);
	}

	public int getRecordCount() {
		return this.employeeDao.getRecordCount();
	}
	//按ID删除数据
	public void delete(Integer id){
		this.employeeDao.delete(id);
	}
	public void save(Employee employee) {
		this.employeeDao.saveOrUpdate(employee);
	}
}
