package cn.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import cn.dao.HealthDao;
import cn.entity.TbHealth;
@Repository("healthDao")
public class HealthDaoImpl extends GenericDaoImpl<TbHealth> implements HealthDao {

	@Autowired
	@Qualifier("sessionFactory")
	public void setMySessionFactory(SessionFactory sessionFactory){
		super.setMySessionFactory(sessionFactory);
	}

}
