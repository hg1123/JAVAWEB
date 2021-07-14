package cn.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import cn.dao.DepartmentDao;
import cn.entity.TbDepartment;
@Repository("departmentDao")
public class DepartmentDaoImpl extends GenericDaoImpl<TbDepartment> implements DepartmentDao {

	@Autowired
	@Qualifier("sessionFactory")
	public void setMySessionFactory(SessionFactory sessionFactory){
		super.setMySessionFactory(sessionFactory);
	}

}
