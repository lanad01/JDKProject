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
		Calendar today=Calendar.getInstance();
		int year=today.get(Calendar.YEAR);
		int month=today.get(Calendar.MONTH)+1;
		int date=today.get(Calendar.DATE);
		int hour=today.get(Calendar.HOUR);
		int min=today.get(Calendar.MINUTE);
		String bbsDate=year+"/"+month+"/"+date+" "+hour+":"+min;
		Integer rownum=this.getMaxRownum(bbs.getBbstype());
		if(rownum==null) {
			rownum=1;
			bbs.setRn(rownum);
		}
		bbs.setHit(0);
		bbs.setPoint(0);
		bbs.setSeqno(seqno);
		bbs.setRegister_date(bbsDate); // 작성일 설정
		if(bbs.getUser_no()==1) {
			bbs.setBbstype("NOTICE");
		}
		for(int i=61; i<90; i++) {
			bbs.setContent("질문답변글"+i);
			bbs.setTitle("글 제목"+i);
			bbs.setSeqno(i);
			bbs.setPoint(i);
			bbs.setRn(i);
			session.insert("bbs.putBbs",bbs);
		}
//		session.insert("bbs.putBbs",bbs);
		
	}
	public void addHit(Integer seqno) {
		session.update("bbs.addHit",seqno);
	}
	public Integer getMaxRownum(String bbstype) {
		// TODO Auto-generated method stub
		return session.selectOne("bbs.getMaxRow",bbstype);
	}

	
}
