package cn.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import cn.dao.ConfigDao;
import cn.entity.TbConfig;
@Repository("configDao")
public class ConfigDaoImpl extends GenericDaoImpl<TbConfig> implements ConfigDao {

	@Autowired
	@Qualifier("sessionFactory")
	public void setMySessionFactory(SessionFactory sessionFactory){
		super.setMySessionFactory(sessionFactory);
	}

}
