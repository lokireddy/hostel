package com.myhostelmanager.service;

import java.util.List;
import java.util.Map;

public interface BlockService {
	public List getAllBlocks(String hId);
	public Map getBlockIdNames(String hId);
	public List getRooms(String bId);
}
