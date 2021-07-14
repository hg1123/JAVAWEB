package cn.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.dao.DepartmentDao;
import cn.entity.TbDepartment;
import cn.util.PageBean;

import com.alibaba.fastjson.JSON;

@Controller("departmentAction")
@Scope("prototype")
public class DepartmentAction  extends BaseAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private TbDepartment searchDepartment;
	private TbDepartment addDepartment;
	private TbDepartment updateDepartment;
	private TbDepartment deleteDepartment;
	private PageBean pageBean=new PageBean();
	private List<TbDepartment> list;
	public TbDepartment getSearchDepartment() {
		return searchDepartment;
	}
	public void setSearchDepartment(TbDepartment searchDepartment) {
		this.searchDepartment = searchDepartment;
	}
	public TbDepartment getAddDepartment() {
		return addDepartment;
	}
	public void setAddDepartment(TbDepartment addDepartment) {
		this.addDepartment = addDepartment;
	}
	public TbDepartment getUpdateDepartment() {
		return updateDepartment;
	}
	public void setUpdateDepartment(TbDepartment updateDepartment) {
		this.updateDepartment = updateDepartment;
	}
	public TbDepartment getDeleteDepartment() {
		return deleteDepartment;
	}
	public void setDeleteDepartment(TbDepartment deleteDepartment) {
		this.deleteDepartment = deleteDepartment;
	}
	public PageBean getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	public List<TbDepartment> getList() {
		return list;
	}
	public void setList(List<TbDepartment> list) {
		this.list = list;
	}
	@Autowired
	@Qualifier("departmentDao")
	private DepartmentDao departmentDao;
	public String add() throws IOException{
		addDepartment.setGmtCreate(new Date());
		addDepartment.setGmtModified(new Date());
		String hql = "from TbDepartment where name = ?";
		List<TbDepartment> list=departmentDao.getByHql(hql,addDepartment.getName());
		Map<String,Object> map = new HashMap<String,Object>();
		if(list!=null&&list.size()>0){
			map.put("status", false);
			map.put("msg", "该部门名称已经存在");
			response.setContentType("text/json;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.print(JSON.toJSONString(map));
			out.close();
			return null;
		}
		departmentDao.add(addDepartment);
		map.put("status", true);
		map.put("msg", "添加成功");
		PrintWriter out=response.getWriter();
		out.print(JSON.toJSONString(map));
		return null;
	}
	public String list(){
		System.out.println("进入界面...");
		String sqlCount="select count(*) from TbDepartment u where 1=1 ";
		String sql="from TbDepartment u where 1=1 ";
		String append="";
		if(searchDepartment!=null&&searchDepartment.getName()!=null && !"".equals(searchDepartment.getName())){
			append+=" and name like '%"+searchDepartment.getName()+"%'";
		}
		append+=" order by id";
		pageBean.setTotalCount(departmentDao.getCount(sqlCount+append));
		list=departmentDao.getByPage(sql+append, pageBean.getPageNo(), pageBean.getPageSize());
		System.out.println(list);
		return "list";
	}
	public String drop() throws IOException{
		String sql="from TbDepartment u where 1=1 order by sortNum desc ";
		list=departmentDao.getByPage(sql, 1, 1000);
		response.setContentType("text/json;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.print(JSON.toJSONString(list));
		out.close();
		return null;
	}
	public String delete() throws IOException{
		System.out.println(deleteDepartment);
		departmentDao.delete(deleteDepartment);
		response.sendRedirect("department_list.action?");
		return null;
	}
	public String detail() throws IOException{
		deleteDepartment=departmentDao.get(TbDepartment.class, deleteDepartment.getId());
		return "detail";
	}
	public String update() throws IOException{
		updateDepartment=departmentDao.get(TbDepartment.class, updateDepartment.getId());
		response.setContentType("text/json;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.print(JSON.toJSONString(updateDepartment));
		out.close();
		return null;
	}
	public String update1()throws IOException{
		String hql = "from TbDepartment where name = ?";
		List<TbDepartment> list=departmentDao.getByHql(hql,updateDepartment.getName());
		Map<String,Object> map = new HashMap<String,Object>();
		if(list!=null&&list.size()>0){
			if(!list.get(0).getId().equals(updateDepartment.getId())){
				map.put("status", false);
				map.put("msg", "该部门名称已经存在");
				response.setContentType("text/json;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.print(JSON.toJSONString(map));
				out.close();
				return null;
			}
		}
		TbDepartment department1 = departmentDao.get(TbDepartment.class, updateDepartment.getId());
		department1.setName(updateDepartment.getName());
		department1.setSortNum(updateDepartment.getSortNum());
		department1.setGmtModified(new Date());
		departmentDao.merge(department1);
		map.put("status", true);
		map.put("msg", "更新成功");
		response.setContentType("text/json;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.print(JSON.toJSONString(map));
		out.close();
		return null;
	}
}
