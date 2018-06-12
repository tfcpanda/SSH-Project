package cn.edu.hzvtc.actions;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Session;

import cn.edu.hzvtc.entities.Employee;
import cn.edu.hzvtc.entities.PageBean;
import cn.edu.hzvtc.services.DepartmentService;
import cn.edu.hzvtc.services.EmployeeService;

import com.opensymphony.xwork2.ActionSupport;

public class EmployeeAction extends ActionSupport implements SessionAware,RequestAware {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	private EmployeeService employeeService;
	private int returnMsg;
	private Integer id;
	private DepartmentService departmentService;
	private Employee employee;
	private String employeeName;
	/*
	 * 判断是否可用
	 */
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public String validateEmployeeName() throws UnsupportedEncodingException {
		employeeName= new String(employeeName.getBytes("iso-8859-1"),"UTF-8");
		status = false;
		if(employeeService.employeeNameIsValid(employeeName)){
			status = true;
		}
		return "ajax-success";
	}
	/*
	 * 录入成功的方法
	 */
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public String save() {
		if (employee.getId() == null) {
			employee.setCreateTime(new Date());
			employeeService.saveOrUpdate(employee);
			session.put("returnMsg", 1);
		} else {
			Employee emp = employeeService.get(employee.getId());
			emp.setEmployeeBirthday(employee.getEmployeeBirthday());
			emp.setEmployeeEmail(employee.getEmployeeEmail());
			emp.getDepartment().setId(employee.getDepartment().getId());
			session.put("returnMsg", 2);
			employeeService.saveOrUpdate(emp);
		}
		return SUCCESS;
	}
	/*
	 * 	跳转方法
	 */
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}
	public String input() {
		if (id != null) {
			request.put("employee", employeeService.get(id));
		}
		request.put("departments", departmentService.getAll());
		return INPUT;
	}
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

	public void setReturnMsg(int returnMsg) {
		this.returnMsg = returnMsg;
	}

	public int getReturnMsg() {
		return returnMsg;
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

	private Map<String, Object> request;
	@Override
	public void setRequest(Map<String, Object> arg0) {
		this.request = arg0;
	}

	public String list() {
		pageBean = new PageBean<Employee>();
		pageBean.setPageNo(pageNo);
		pageBean.setPageSize(2);
		int recordCount = employeeService.getRecordCount();
		pageBean.setRecordCount(recordCount);
		List<Employee> datas = employeeService.getEmployeeByPage(
				(pageBean.getPageNo() - 1) * pageBean.getPageSize(),
				pageBean.getPageSize());
		pageBean.setData(datas);
		if(session.containsKey("returnMsg")){
			returnMsg = (Integer) session.get("returnMsg");
			session.remove("returnMsg");
		}
		return "list";
	}

	// 得到Bean里面的数据
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
