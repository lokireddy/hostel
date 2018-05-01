package com.myhostelmanager.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myhostelmanager.dao.OperationsDao;
import com.myhostelmanager.form.NewTenantForm;
import com.myhostelmanager.model.Person;

@Service("operationsService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class OperationsServiceImpl implements OperationsService {

	@Autowired
	private OperationsDao operationsDao;
	Logger logger = Logger.getLogger(OperationsServiceImpl.class);

	public boolean isPersonExist(NewTenantForm newTenantForm) {
		logger.info("Checking person Exist or not.");
		boolean exist = false;
		List<String> mobileNumbers = operationsDao.getMobileNumbers();
		Iterator itr = mobileNumbers.iterator();
		while (itr.hasNext()) {
			exist = newTenantForm.getMobile().equals(itr.next());
			if (exist) {
				break;
			}
		}
		return exist;
	}

	public Person personFormToPerson(NewTenantForm newTenantForm) {

		Person person = new Person();
		person.setName(newTenantForm.getName());
		person.setMobile(newTenantForm.getMobile());
		person.setEmail(newTenantForm.getEmail());
		person.setId(newTenantForm.getId());
		person.setAddress(newTenantForm.getAddress());
		person.setRoom(newTenantForm.getRoom());
		person.setAmount(newTenantForm.getAmount());
		person.setbId(newTenantForm.getbId());
		logger.info("Converting String to Date.");
		DateFormat format = new SimpleDateFormat("mm/dd/yyyy", Locale.ENGLISH);
		try {
			java.sql.Date date = new java.sql.Date(format.parse(newTenantForm.getDoj()).getTime());
			logger.info("Converted Date: " + date);
			person.setDoj(date);
		} catch (ParseException e) {
			logger.error(e.getMessage());
		}

		return person;
	}

	public void savePerson(Person person) {
		logger.info(person.toString());
		operationsDao.savePerson(person);
	}

	public List getAllPersons(String bId) {
		List<Person> persons = operationsDao.getAllPersons(bId);
		logger.info("Total Persons Retrived: " + persons.size());
		return persons;
	}

	public List getPerson(String pId) {
		List<Person> person = operationsDao.getPerson(pId);
		logger.info("Size of the Person: " + person.size() + "\n" + person.toString());
		return person;
	}
}
