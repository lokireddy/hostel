package com.myhostelmanager.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myhostelmanager.controller.MainController;
import com.myhostelmanager.model.Person;

@Repository("operationsDao")
public class OperationsDaoImpl implements OperationsDao {

	@Autowired
	private SessionFactory sessionFactory;
	Logger logger = Logger.getLogger(MainController.class);

	public List getMobileNumbers() {
		logger.info("Getting all Mobile numbers.");
		String hql = "select mobile from Person ";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		List<String> mobileNos = query.list();
		return mobileNos;
	}

	public void savePerson(Person person) {
		try {
			// sessionFactory.getCurrentSession().beginTransaction();
			sessionFactory.getCurrentSession().save(person);
			// sessionFactory.getCurrentSession().getTransaction().commit();
			logger.info("Person saved to DataBase.");
		} catch (HibernateException e) {
			logger.error(e.getMessage());
		}

	}

	public List getAllPersons(String bId) {
		logger.info("Getting all Persons");
		String hql = "from Person where bId = ?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, bId);
		List<Person> allPersons = query.list();
		return allPersons;
	}

	public List getPerson(String pId) {
		logger.info("Getting Person with ID: " + pId);
		String hql = "from Person where autoId = ?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, pId);
		List<Person> person = query.list();
		return person;
	}
}
