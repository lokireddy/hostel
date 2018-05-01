package com.myhostelmanager.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myhostelmanager.controller.MainController;
import com.myhostelmanager.dao.BlockDao;
import com.myhostelmanager.model.Block;

@Service("blockService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class BlockServiceImpl implements BlockService {
	
	@Autowired
	private BlockDao blockDao;
	Logger logger=Logger.getLogger(MainController.class);
	
	public List getAllBlocks(String hId) {
		
		return blockDao.getBlocks(hId);
	}

	public Map getBlockIdNames(String hId) {
		List<Block> blocks = blockDao.getBlocks(hId);
		logger.info("getBlocks() called");
		Iterator itr = blocks.iterator();
		Map<String, String> bNames = new HashMap<String, String>();
		while(itr.hasNext()){
			Block b = (Block) itr.next();
			logger.info("Block =id: " + b.getBid() + "  Name: " + b.getBname());
			bNames.put(b.getBid(), b.getBname());
		}
		return bNames;
	}

	public List getRooms(String bId) {
		logger.info("Block Id: " + bId);
		List<String> rooms = blockDao.getRoomNos(bId);
		logger.info("No of Rooms: "+ rooms.size());
		return rooms;
	}
}
