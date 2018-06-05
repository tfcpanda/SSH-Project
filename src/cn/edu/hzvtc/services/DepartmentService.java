package cn.edu.hzvtc.services;

import java.util.List;

import cn.edu.hzvtc.dao.DepartmentDao;
import cn.edu.hzvtc.entities.Department;

public class DepartmentService {
	//创建department类
	private DepartmentDao departmentDao;
	public void setDepartmentDao(DepartmentDao departmentDao) {
		this.departmentDao = departmentDao;
	}
	//编写list方法
	public List<Department> getAll() {
		return departmentDao.getAll();
	}
}
