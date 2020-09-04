package dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Bbs;
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
}
