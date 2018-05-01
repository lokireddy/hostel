package com.myhostelmanager.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myhostelmanager.controller.MainController;
import com.myhostelmanager.model.Block;

@Repository("blockDao")
public class BlockDaoImpl implements BlockDao {

	@Autowired
	private SessionFactory sessionFactory;
	Logger logger=Logger.getLogger(MainController.class);
	
	public List getBlocks(String hId) {
		logger.info("Hid in getBlocks():" + hId);
		String hql = "from Block where hid= '"+hId+"'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
        List<Block> blocks = query.list();
        logger.info("Query Executed.");
        logger.info("Blocks Size:" + blocks.size());
		return blocks;
	}

	public List getRoomNos(String bId) {
		logger.info("Block Id:"+ bId);
		String hql = "select rno from Room where bId = '"+bId+"'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		List<String> roomNos = query.list();
		return roomNos;
	}
}
