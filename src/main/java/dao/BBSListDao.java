package dao;

import java.util.List;

import model.Bbs;
import model.Search;

public interface BBSListDao { //DB에서 가져오기
	List<Bbs> getBBSList(String bbstype);
	Bbs getBbsDetail(Integer seqno);
	String getWriter(Integer user_no);
	Integer getPageCnt(String bbsType);
	List<Bbs> read5Bbs(String bbsType);
	List<Bbs> getNotices(Integer user_no);
	List<Bbs> getTop10ByHit();
	List<Bbs> getTop10ByRep();
	void deleteBbs(Integer seqno);
	String getId(Integer user_no);
	void updateBbs(Bbs bbs);
	Integer getRownum(Bbs bbs);
	void like(Bbs bbs);
	Integer getSeqnoByRownum(Bbs bbs);
	List<Bbs> searchBbs(Search sch);
	List<Bbs> getGanyum();
	List<Bbs> getWhole();
	List<Bbs> getMyBbs(Integer user_no);
}
