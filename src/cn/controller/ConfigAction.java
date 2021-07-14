package cn.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.dao.ConfigDao;
import cn.entity.TbConfig;
import cn.util.PageBean;

@Controller("configAction")
@Scope("prototype")
public class ConfigAction  extends BaseAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private TbConfig config;
	private PageBean pageBean=new PageBean();
	private List<TbConfig> list;
	public PageBean getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	public TbConfig getConfig() {
		return config;
	}
	public void setConfig(TbConfig config) {
		this.config = config;
	}
	public List<TbConfig> getList() {
		return list;
	}
	public void setList(List<TbConfig> list) {
		this.list = list;
	}
	@Autowired
	@Qualifier("configDao")
	private ConfigDao configDao;
	public String list() throws IOException{
		String hql = "from TbConfig where 1=1 order by id desc";
		list = configDao.getByPage(hql, 0, 1);
		if(list!=null&&list.size()>0){
			config = list.get(0);
		}
		return "list";
	}
	public String detail() throws IOException{
		String hql = "from TbConfig where 1=1 order by id desc";
		list = configDao.getByPage(hql, 0, 1);
		if(list!=null&&list.size()>0){
			config = list.get(0);
		}else{
			config = null;
		}
		return "detail";
	}
	public String update()throws IOException{
		String hql = "from TbConfig where 1=1 order by id desc";
		list = configDao.getByPage(hql, 0, 1);
		if(list!=null&&list.size()>0){
			TbConfig config1 = list.get(0);
			config1.setNextCheckDate(config.getNextCheckDate());
			configDao.merge(config1);
		}else{
			configDao.add(config);
		}
		response.sendRedirect("config_detail.action");
		return null;
	}
}
