package com.myhostelmanager.dao;

import java.util.List;

public interface BlockDao {
	
	public List getBlocks(String hid); 
	public List getRoomNos(String bId);
}
