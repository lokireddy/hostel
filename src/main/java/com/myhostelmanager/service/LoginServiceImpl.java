package com.myhostelmanager.service;

import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myhostelmanager.dao.LoginDao;
import com.myhostelmanager.model.Block;
import com.myhostelmanager.model.Login;

@Service("loginService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private LoginDao loginDao;
	private List<Login> loginList;
	Logger logger=Logger.getLogger(LoginServiceImpl.class);
	
	public boolean isUserValid(String id, String pswd) {
		logger.info("id: "+ id+" and pswd: "+ pswd);
		loginList = loginDao.getUser(id, pswd);
		logger.info("Size:"+loginList.size());
		Iterator itr = loginList.iterator();
		boolean status = false;
//		if(loginList.size()==1){
//			status = true;
//		}
        while(itr.hasNext())
        {
        	Login l=(Login)itr.next();
        	logger.info(l.getUid()+ l.getPwd()+ l.getHid());
            if(id.equals(l.getUid()) && pswd.equals(l.getPwd())){
            	status = true;
            	break;
            }
            else{
            	status = false;
            }
        }
        logger.info("Login Status: "+ status);
        return status;
	}


	public String getHostelId(String id, String pswd) {
		Iterator itr = loginList.iterator();
		String hostelId = "";
        while(itr.hasNext())
        {
        	Login l = (Login)itr.next();
        	logger.info( l.getUid()+ l.getPwd()+ l.getHid());
            if(id.equals(l.getUid()) && pswd.equals(l.getPwd())){
            	hostelId = l.getHid();
            }
        }
		return hostelId;
	}


	public List<Block> getBlocks(String hostelId) {
		List<Block> blockList = loginDao.getBlocks(hostelId);
		logger.info("No of. Block Records:"+blockList.size());
		Iterator itr = blockList.iterator();
        while(itr.hasNext())
        {
        	Block block=(Block)itr.next();
        	logger.info("Block ID: " +  block.getBid()+ " Block Name: " + block.getBname() + " Hostel ID: "+block.getHid());
        }	
		return blockList;
	}


	public String getHostelName(String hostelId) {
		return loginDao.getHostelName(hostelId);
	}
	
}
