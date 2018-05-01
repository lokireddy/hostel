package com.myhostelmanager.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myhostelmanager.model.Block;
import com.myhostelmanager.model.Login;

@Repository("loginDao")
public class LoginDaoImpl implements LoginDao {

	@Autowired
	private SessionFactory sessionFactory;
	Logger logger = Logger.getLogger(LoginDaoImpl.class);

	public List getUser(String uid, String pwd) {
		// String hql = "select hid from Login where uid = '" + uid + "' and pwd
		// = '" + pwd +"'";
		// Query query = sessionFactory.getCurrentSession().createQuery(hql);
		// List<String> logins = query.list();
		List<Login> logins = sessionFactory.getCurrentSession().createCriteria(Login.class).list();
		logger.info("Dao: " + logins.size());
		return logins;

	}

	public List<Block> getBlocks(String hostelId) {

		String hql = "from Block where hid= '" + hostelId + "'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		List<Block> blocks = query.list();
		logger.info("Query executed.");
		return blocks;
	}

	public String getHostelName(String hostelId) {
		String hql = "select hname from Hostel where hid= '" + hostelId + "'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		List<String> hnames = query.list();
		logger.info("Query executed.");
		return hnames.get(0);
	}

}
