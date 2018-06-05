package cn.edu.hzvtc.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import cn.edu.hzvtc.entities.Employee;

public class EmployeeDao extends BaseDao<Employee>{
	
	public List<Employee> getAll() {
		String hql = "From Employee e LEFT OUTER JOIN FETCH e.department";
		return getSession().createQuery(hql).list();
	}
	public List<Employee> getEmployeeByPage(int firstResult, int maxResult) {
		String hql = "From Employee e LEFT OUTER JOIN FETCH e.department";
		return getSession().createQuery(hql).setFirstResult(firstResult)
				.setMaxResults(maxResult).list();
	}

	public int getRecordCount() {
		String hql = "SELECT count(e.id) FROM Employee e";
		return ((Long) getSession().createQuery(hql).uniqueResult()).intValue();
	}
//	//按ID删除
//	public void delete(Integer id){
//		String hql = "DELETE FROM Employee e WHERE e.id = ?";
//		getSession().createQuery(hql).setInteger(0,id).executeUpdate();
//	}

}	
