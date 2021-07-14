package cn.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.dao.HealthDao;
import cn.dao.UserDao;
import cn.entity.TbHealth;
import cn.entity.TbUser;
import cn.util.PageBean;

import com.alibaba.fastjson.JSON;

@Controller("healthAction")
@Scope("prototype")
public class HealthAction  extends BaseAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private TbHealth health;
	private TbHealth addHealth;
	private TbHealth searchHealth;
	private PageBean pageBean=new PageBean();
	private List<TbHealth> list;
	public TbHealth getHealth() {
		return health;
	}
	public void setHealth(TbHealth health) {
		this.health = health;
	}
	public PageBean getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	public List<TbHealth> getList() {
		return list;
	}
	public void setList(List<TbHealth> list) {
		this.list = list;
	}
	public TbHealth getAddHealth() {
		return addHealth;
	}
	public void setAddHealth(TbHealth addHealth) {
		this.addHealth = addHealth;
	}
	public TbHealth getSearchHealth() {
		return searchHealth;
	}
	public void setSearchHealth(TbHealth searchHealth) {
		this.searchHealth = searchHealth;
	}
	@Autowired
	@Qualifier("healthDao")
	private HealthDao healthDao;
	@Autowired
	@Qualifier("userDao")
	private UserDao userDao;
	public String add() throws IOException{
		TbUser user = userDao.get(TbUser.class, addHealth.getUserId());
		addHealth.setGmtCreate(new Date());
		addHealth.setGmtModified(new Date());
		addHealth.setUser(user);
		System.out.println(addHealth);
		healthDao.add(addHealth);
		response.sendRedirect("health_list.action?");
		return null;
	}
	DateFormat format =   
		new SimpleDateFormat("yyyy-MM-dd hh:mm:ss"); 
	public String list(){
		Integer role = (Integer)session.getAttribute("role");
		searchHealth = searchHealth==null?new TbHealth():searchHealth;
		if(role!=null){
			if(role==3){
				TbUser u=(TbUser)session.getAttribute("currentUser");
				searchHealth.setUserId(u.getId());
			}
			String sqlCount="select count(*) from TbHealth t where 1=1 ";
			String sql="from TbHealth t where 1=1 ";
			String append="";
			if(searchHealth!=null){
				if(searchHealth.getUserId()!=null){
					append+=" and t.user.id = "+searchHealth.getUserId()+" ";
				}
				if(searchHealth.getUser()!=null&&searchHealth.getUser().getDepartmentId()!=null){
					append+=" and t.user.department.id = "+searchHealth.getUser().getDepartmentId()+" ";
				}
				if(searchHealth.getBlood()!=null){
					append+=" and t.blood = "+searchHealth.getBlood()+" ";
				}
				if(searchHealth.getBloodFat()!=null){
					append+=" and t.bloodFat = "+searchHealth.getBloodFat()+" ";
				}
				if(searchHealth.getBloodPressure()!=null){
					append+=" and t.bloodPressure = "+searchHealth.getBloodPressure()+" ";
				}
				if(searchHealth.getEent()!=null){
					append+=" and t.eent = "+searchHealth.getEent()+" ";
				}
				if(searchHealth.getHeartRate()!=null){
					append+=" and t.heartRate = "+searchHealth.getHeartRate()+" ";
				}
				if(searchHealth.getLiver()!=null){
					append+=" and t.liver = "+searchHealth.getLiver()+" ";
				}
				if(searchHealth.getTumorMarker()!=null){
					append+=" and t.tumorMarker = "+searchHealth.getTumorMarker()+" ";
				}
				if(searchHealth.getXgRay()!=null){
					append+=" and t.xgRay = "+searchHealth.getXgRay()+" ";
				}
				if(searchHealth.getMinDate()!=null){
					append+=" and t.checkDate >= '"+format.format(searchHealth.getMinDate())+"' ";
				}
				if(searchHealth.getMaxDate()!=null){
					append+=" and t.checkDate <= '"+format.format(searchHealth.getMaxDate())+"' ";
				}
			}
			append+=" order by id desc ";
			pageBean.setTotalCount(healthDao.getCount(sqlCount+append));
			list=healthDao.getByPage(sql+append, pageBean.getPageNo(), pageBean.getPageSize());
			return "list";
		}
		return "login";
	}
	public String delete() throws IOException{
		healthDao.delete(searchHealth);
		response.sendRedirect("health_list.action?");
		return null;
	}
	public String detail() throws IOException{
		health=healthDao.get(TbHealth.class, health.getId());
		return "detail";
	}
	public String update() throws IOException{
		health=healthDao.get(TbHealth.class, health.getId());
		response.setContentType("text/json;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.print(JSON.toJSONString(health));
		out.close();
		return null;
	}
	public String update1()throws IOException{
		TbHealth health1 = healthDao.get(TbHealth.class, health.getId());
		health.setCheckDate(health1.getCheckDate());
		health.setGmtCreate(health1.getGmtCreate());
		health.setGmtModified(health1.getGmtModified());
		health.setUserId(health1.getUserId());
		healthDao.merge(health);
		response.sendRedirect("health_list.action?");
		return null;
	}
}
