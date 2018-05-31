package cn.edu.hzvtc.actions;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Session;

import cn.edu.hzvtc.entities.Employee;
import cn.edu.hzvtc.entities.PageBean;
import cn.edu.hzvtc.services.EmployeeService;

import com.opensymphony.xwork2.ActionSupport;

public class EmployeeAction extends ActionSupport implements SessionAware {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	private EmployeeService employeeService;
	private Integer id;
	/*
	 * 判定数据库中数据是否删除
	 */
	private Boolean status;

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}
	/*
	 * 分页
	 */
	private PageBean<Employee> pageBean;

	public void setPageBean(PageBean<Employee> pageBean) {
		this.pageBean = pageBean;
	}

	public PageBean<Employee> getPageBean() {
		return pageBean;
	}

	private int pageNo = 1;

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}


	private String nextAction;

	public String getNextAction() {
		return nextAction;
	}

	/*
	 * 删除方法
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	public String delete() {
		try {
			employeeService.delete(id);
			status = true;
			GetBeanData();
		} catch (Exception e) {
			status = false;
			e.printStackTrace();
		}
		return "ajax-success";
	}

	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	private Map<String, Object> session;

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.session = arg0;
	}

	public String list() {
		pageBean = new PageBean<Employee>();
		pageBean.setPageNo(pageNo);
		pageBean.setPageSize(2);
		int recordCount = employeeService.getRecordCount();
		pageBean.setRecordCount(recordCount);
		List<Employee> datas = employeeService.getEmployeeByPage((pageBean.getPageNo() - 1) * pageBean.getPageSize(),
				pageBean.getPageSize());
		pageBean.setData(datas);
		return "list";
	}
	//得到数据源
	public void GetBeanData() {
		pageBean = new PageBean<Employee>();
		pageBean.setPageNo(pageNo);
		pageBean.setPageSize(2);
		int recordCount = employeeService.getRecordCount();
		pageBean.setRecordCount(recordCount);
		List<Employee> datas = employeeService.getEmployeeByPage(
				(pageBean.getPageNo() - 1) * pageBean.getPageSize(),
				pageBean.getPageSize());
		pageBean.setData(datas);
	}

}
