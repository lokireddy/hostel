package com.myhostelmanager.service;

import java.util.List;

import com.myhostelmanager.model.Block;

public interface LoginService {
	public boolean isUserValid(String id, String pswd);
	public String getHostelId(String id, String pswd);
	public List<Block> getBlocks(String hostelId);
	public String getHostelName(String hostelId);
}
