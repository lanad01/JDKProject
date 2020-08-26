package dao;

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
		System.out.println("bbslistdaoimpl bbstype :"+bbstype);
		return session.selectList("bbs.getBBSList", bbstype);
	}
	public Bbs getBbsDetail(Integer seqno) {
		// TODO Auto-generated method stub
		System.out.println("BBSLISTDAOIMPL: "+seqno);
		return session.selectOne("bbs.getBbsDetail", seqno);
	}
	public String getWriter(Integer user_no) {
		// TODO Auto-generated method stub
		return session.selectOne("bbs.getWriter",user_no);
	}

}