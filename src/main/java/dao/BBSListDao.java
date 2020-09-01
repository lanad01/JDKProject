package dao;

import java.util.List;

import model.Bbs;

public interface BBSListDao { //DB에서 가져오기
	List<Bbs> getBBSList(String bbstype);
	Bbs getBbsDetail(Integer seqno);
	String getWriter(Integer user_no);
	Integer getPageCnt(String bbsType);
	List<Bbs> read5Bbs(String bbsType);
}
