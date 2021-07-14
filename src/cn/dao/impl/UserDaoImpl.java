package cn.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import cn.dao.UserDao;
import cn.entity.TbUser;
@Repository("userDao")
public class UserDaoImpl extends GenericDaoImpl<TbUser> implements UserDao {

	@Autowired
	@Qualifier("sessionFactory")
	public void setMySessionFactory(SessionFactory sessionFactory){
		super.setMySessionFactory(sessionFactory);
	}

}
