package com.myhostelmanager.dao;

import java.util.List;

import com.myhostelmanager.model.Block;
import com.myhostelmanager.model.Login;

public interface LoginDao {
	public List<Login> getUser(String uid, String pwd);
	public List<Block> getBlocks(String hostelId);
	public String getHostelName(String hostelId);
}
