package dao;

import java.util.Calendar;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Bbs;
import model.User;
@Repository // Service는 바로 콘트롤러에 접근할 때 쓰지 않음. 지금은 바로 콘트롤러로 접근하기에 Repository
public class WriteDaoImpl implements WriteDao {
	@Autowired
	private SqlSession session;
	public Integer getMaxSeqno() {
		return session.selectOne("bbs.getSeqno");
	}
	public Integer getWriter(String id) {
		return session.selectOne("bbs.getUserNo",id);
	}
	public void insertBBS(Bbs bbs) {  // 여기서 추가해야할 것 seqno bbsType
		Integer seqno=this.getMaxSeqno();
		if(seqno==null) seqno=0; 
		seqno=seqno+1; 
		bbs.setHit(0);
		bbs.setPoint(0);
		bbs.setSeqno(seqno); // 작성일 설정
		session.insert("bbs.putBbs",bbs);
	}
	public void addHit(Integer seqno) {
		session.update("bbs.addHit",seqno);
		
	}

	
}
