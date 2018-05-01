package com.myhostelmanager.dao;

import java.util.List;
import java.util.Map;

import com.myhostelmanager.model.Person;

public interface OperationsDao {
	public List getMobileNumbers();
	public void savePerson(Person person);
	public List getAllPersons(String bId);
	public List getPerson(String pId);
}
