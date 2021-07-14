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

import cn.dao.ConfigDao;
import cn.dao.DepartmentDao;
import cn.dao.HealthDao;
import cn.dao.UserDao;
import cn.entity.TbConfig;
import cn.entity.TbDepartment;
import cn.entity.TbHealth;
import cn.entity.TbUser;
import cn.util.PageBean;

import com.alibaba.fastjson.JSON;
@Controller("userAction")
@Scope("prototype")
public class UserAction extends BaseAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private TbUser user=new TbUser();
	private TbUser addUser = new TbUser();
	private TbUser updateUser = new TbUser();
	private TbUser detail = new TbUser();
	private TbUser login = new TbUser();
	private TbUser pwd = new TbUser();
	private TbConfig config = new TbConfig();
	private PageBean pageBean=new PageBean();
	private TbHealth health = null;
	private String password1;
	private List<TbUser> list;
	@Autowired
	@Qualifier("userDao")
	private UserDao userDao;
	@Autowired
	@Qualifier("healthDao")
	private HealthDao healthDao;
	@Autowired
	@Qualifier("configDao")
	private ConfigDao configDao;
	@Autowired
	@Qualifier("departmentDao")
	private DepartmentDao departmentDao;
	//登录
	public String login(){
		String hql="";
		session.setAttribute("role", login.getRole());
		System.out.println(login);
		hql="from TbUser where username=?";
		
		List<TbUser> list=userDao.getByHql(hql,login.getUsername());
		if(list!=null && list.size()>0){
			TbUser u=list.get(0);
			if(u.getPassword().equals(login.getPassword())){
				if(u.getRole()!=null&&login.getRole().equals(u.getRole())){
					System.out.println(u.getRole());
					session.setAttribute("role", u.getRole());
					session.setAttribute("currentUser", u);
					return "index";
				}else{
					request.setAttribute("msg", "用户身份错误!");
					return "login";
				}
			}else{
				request.setAttribute("msg", "用户密码错误!");
				return "login";
			}
		}
		request.setAttribute("msg", "用户名不存在!");
		return "login";
		
	}
	public String register() throws IOException{
		Map<String,Object> map = new HashMap<String,Object>();
		String hql = "from TbUser where username = ?";
		List<TbUser> list=userDao.getByHql(hql,addUser.getUsername());
		if(list!=null&&list.size()>0){
			map.put("status", false);
			map.put("msg", "该用户名称已经存在");
			response.setContentType("text/json;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.print(JSON.toJSONString(map));
			out.close();
			return null;
		}
		addUser.setDepartment(departmentDao.get(TbDepartment.class, addUser.getDepartmentId()));
		addUser.setGmtModified(new Date());
		addUser.setGmtCreate(new Date());
		addUser.setRole(2);
		userDao.add(addUser);
		map.put("status", true);
		map.put("msg", "保存成功");
		response.setContentType("text/json;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.print(JSON.toJSONString(map));
		out.close();
		return null;
	}
	public String list(){
		System.out.println("进入界面...");
		String sqlCount="select count(*) from TbUser u where role != 1 ";
		String sql="from TbUser u where role !=1 ";
		String append="";
		if(user.getUsername()!=null && !"".equals(user.getUsername())){
			append+=" and username like '%"+user.getUsername()+"%'";
		}
		append+=" order by u.id";
		pageBean.setTotalCount(userDao.getCount(sqlCount+append));
		list=userDao.getByPage(sql+append, pageBean.getPageNo(), pageBean.getPageSize());
		System.out.println(list);
		return "list";
	}
	public String drop() throws IOException{
		String sql="from TbUser u where role = 3 ";
		List<TbUser> list1=userDao.getByPage(sql, 1, 1000);
		response.setContentType("text/json;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.print(JSON.toJSONString(list1));
		out.close();
		return null;
	}
	public String shenhe() throws IOException{
		TbUser user1 = (TbUser) userDao.get(TbUser.class, user.getId());
		user1.setRole(user.getRole());
		user1.setGmtModified(new Date());
		userDao.merge(user1);
		response.sendRedirect("user_list.action?");
		return null;
	}
	public String delete() throws IOException{
		userDao.delete(user);
		response.sendRedirect("user_list.action?");
		return null;
	}
	public String detail() throws IOException{
		TbUser u=(TbUser)session.getAttribute("currentUser");
		if(u!=null){
			user=userDao.get(TbUser.class, u.getId());
			String hql = "from TbHealth where 1=1 and user_id = "+detail.getId()+" order by id desc";
			List<TbHealth> list1 = healthDao.getByPage(hql, 0, 1);
			if(list1.size()>0){
				health = list1.get(0);
			}
			hql = "from TbConfig where 1=1 order by id desc";
			List<TbConfig> list2 = configDao.getByPage(hql, 0, 1);
			if(list2!=null&&list2.size()>0){
				config = list2.get(0);
				if(config.getNextCheckDate().getTime()<new Date().getTime()){
					config = null;
				}
			}else{
				config = null;
			}
			return "detail";
		}
		return "login";
	}
	public String update() throws IOException{
		user=userDao.get(TbUser.class, user.getId());
		response.setContentType("text/json;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.print(JSON.toJSONString(user));
		out.close();
		return null;
	}
	public String update1()throws IOException{
		TbUser user1=userDao.get(TbUser.class, updateUser.getId());
		updateUser.setGmtModified(new Date());
		updateUser.setGmtCreate(user1.getGmtCreate());
		updateUser.setUsername(user1.getUsername());
		updateUser.setRole(user1.getRole());
		updateUser.setPassword(user1.getPassword());
		TbDepartment dept = departmentDao.get(TbDepartment.class, updateUser.getDepartmentId());
		updateUser.setDepartment(dept);
		System.out.println(updateUser);
		userDao.merge(updateUser);
//		response.sendRedirect("user_detail.action?");
		return "detail1";
	}
	public String updatepwd1(){
		return "updatepwd";
	}
	public String updatepwd(){
		TbUser u=(TbUser)session.getAttribute("currentUser");
		System.out.println(pwd);
		if(u!=null){
			if(!pwd.getPassword().equals(u.getPassword())){
				request.setAttribute("msg", "原密码不正确!");
				return "updatepwd";
			}else{
				u.setGmtModified(new Date());
				u.setPassword(password1);
				userDao.update(u);
			}
			request.setAttribute("msg", "密码修改成功,请重新登录!");
			return "login";
		}else{
			request.setAttribute("msg", "session失效,请重新登陆!");
			return "login";
		}
	}
	public TbUser getUser() {
		return user;
	}
	public void setUser(TbUser user) {
		this.user = user;
	}
	public PageBean getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	public List<TbUser> getList() {
		return list;
	}
	public void setList(List<TbUser> list) {
		this.list = list;
	}
	public String getPassword1() {
		return password1;
	}
	public void setPassword1(String password1) {
		this.password1 = password1;
	}
	public TbUser getAddUser() {
		return addUser;
	}
	public void setAddUser(TbUser addUser) {
		this.addUser = addUser;
	}
	public TbUser getLogin() {
		return login;
	}
	public void setLogin(TbUser login) {
		this.login = login;
	}
	public TbUser getDetail() {
		return detail;
	}
	public void setDetail(TbUser detail) {
		this.detail = detail;
	}
	public TbHealth getHealth() {
		return health;
	}
	public void setHealth(TbHealth health) {
		this.health = health;
	}
	public TbUser getPwd() {
		return pwd;
	}
	public void setPwd(TbUser pwd) {
		this.pwd = pwd;
	}
	public TbConfig getConfig() {
		return config;
	}
	public void setConfig(TbConfig config) {
		this.config = config;
	}
	public TbUser getUpdateUser() {
		return updateUser;
	}
	public void setUpdateUser(TbUser updateUser) {
		this.updateUser = updateUser;
	}
}
