package dao;

import model.Bbs;

public interface WriteDao { // 해줘야할 것 - Insert, seqno
	Integer getMaxId();
	public void insertBBS(Bbs bbs);
}
