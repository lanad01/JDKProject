package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Bbs;
import model.Search;
@Repository
public class BBSListDaoImpl implements BBSListDao {
	@Autowired
	private SqlSession session;
	public List<Bbs> getBBSList(String bbstype) {
		return session.selectList("bbs.getBBSList", bbstype);
	}
	public Bbs getBbsDetail(Integer seqno) {
		// TODO Auto-generated method stub
		return session.selectOne("bbs.getBbsDetail", seqno);
	}
	public String getWriter(Integer user_no) {
		// TODO Auto-generated method stub
		return session.selectOne("bbs.getWriter",user_no);
	}
	public Integer getPageCnt(String bbsType) {
		// TODO Auto-generated method stub
		return session.selectOne("bbs.getPageCntByBbsType",bbsType);
	}
	public List<Bbs> read5Bbs(String bbsType) {
		// TODO Auto-generated method stub
		return session.selectList("bbs.getBbs5",bbsType);
	}
	public List<Bbs> getNotices(Integer user_no) {
		// TODO Auto-generated method stub
		return session.selectList("bbs.getNotice",user_no);
	}
	public List<Bbs> getTop10ByHit() {
		// TODO Auto-generated method stub
		return session.selectList("bbs.getTop10Hit");
	}
	public List<Bbs> getTop10ByRep() {
		// TODO Auto-generated method stub
		return session.selectList("bbs.getTop10Rep");
	}
	public void deleteBbs(Integer seqno) {
		// TODO Auto-generated method stub
		session.delete("bbs.deleteBbs",seqno);
	}
	public String getId(Integer user_no) {
		// TODO Auto-generated method stub
		return session.selectOne("bbs.getId",user_no);
	}
	public void updateBbs(Bbs bbs) {
		// TODO Auto-generated method stub
		session.update("bbs.updateBbs",bbs);
	}
	public Integer getRownum(Bbs bbs) {
		// TODO Auto-generated method stub
		return session.selectOne("bbs.getRownum",bbs);
	}
	public void like(Bbs bbs) {
		// TODO Auto-generated method stub
		session.update("bbs.like",bbs);
	}
	public Integer getSeqnoByRownum(Bbs bbs) {
		// TODO Auto-generated method stub
		System.out.println("dao Impl -1된 rownum : "+bbs.getRn());
		return session.selectOne("bbs.getSeqnoByRownum",bbs);
	}
	public List<Bbs> searchBbs(Search sch) {
		// TODO Auto-generated method stub
		System.out.println("Impl searchKey : "+sch.getSearchkey());
		System.out.println("bbsType in Impl : " +sch.getBbstype());
		System.out.println("Impl keyword"+sch.getKeyword());
		if(!sch.getBbstype().contentEquals("wholeAndGanyum") && sch.getSearchkey().contentEquals("schTotal")){
			System.out.println("SCHTotal 분기");
			return session.selectList("bbs.searchByTotal",sch);
		}else if(!sch.getBbstype().contentEquals("wholeAndGanyum") && sch.getSearchkey().contentEquals("schContent")) {
			System.out.println("SCHContent 분기");
			return session.selectList("bbs.searchByContent", sch);
		}else if(!sch.getBbstype().contentEquals("wholeAndGanyum") && sch.getSearchkey().contentEquals("schNickNm")) {
			System.out.println("SCHbyNick 분기");
			return session.selectList("bbs.searchByName",sch);
		// 개념글 및 전체글 검색 분기 ---------------------------------------------------------
		}else if(sch.getBbstype().contentEquals("wholeAndGanyum") && sch.getSearchkey().contentEquals("schTotal") ) {
			System.out.println("개념 및 전체글 검색 + SCHTotal분기");
			return session.selectList("bbs.schAtWholeAndGanyumByTotal",sch);
		}else if(sch.getBbstype().contentEquals("wholeAndGanyum") && sch.getSearchkey().contentEquals("schContent") ) {
			System.out.println("개념 및 전체글 검색 + SCHContent분기");
			return session.selectList("bbs.schAtWholeAndGanyumByContent",sch);
		}else if(sch.getBbstype().contentEquals("wholeAndGanyum") && sch.getSearchkey().contentEquals("schNickNm") ) {
			System.out.println("개념 및 전체글 검색 + SCHContent분기");
			return session.selectList("bbs.schAtWholeAndGanyumByNick",sch);
		}
		return null;
	}
	public List<Bbs> getGanyum() {
		// TODO Auto-generated method stub
		return session.selectList("bbs.getGanyum");
	}
	public List<Bbs> getWhole() {
		// TODO Auto-generated method stub
		return session.selectList("bbs.getWhole");
	}
	public List<Bbs> getMyBbs(Integer user_no) {
		// TODO Auto-generated method stub
		return session.selectList("bbs.getMyBbs",user_no);
	}
	public List<Bbs> getLifeStory(Integer life_no) {
		// TODO Auto-generated method stub
		return session.selectList("bbs.getLife",life_no);
	}
}
