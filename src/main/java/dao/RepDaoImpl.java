package dao;

import java.util.Calendar;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Reply;
@Repository
public class RepDaoImpl implements RepDao {
	@Autowired
	private SqlSession session;
	public Integer getMaxRepNo() {
		return session.selectOne("rep.getMaxRepno");
	}
	public Integer getMaxRepGroupNo(Integer repno) {
		return session.selectOne("rep.getMaxRepGroupNo",repno);
	}

	public void entryRep(Reply rep) { //여기서 repno를 설정해줘
		System.out.println("댓글 추가 로직");
		Integer repno=this.getMaxRepNo();
		if(repno==null) repno=0; 
		repno=repno+1;
		rep.setRepno(repno); // set
		Calendar today=Calendar.getInstance();
		int year=today.get(Calendar.YEAR);
		int month=today.get(Calendar.MONTH)+1;
		int date=today.get(Calendar.DATE);
		String repDate=year+"/"+month+"/"+date;
		System.out.println("작성일자: "+repDate);
		rep.setRegister_date(repDate); //set
		session.insert("rep.putRep",rep);
	}

	public void entryReRep(Reply rep) { //여기선 repno가 아니라 repgroupno를 설정해줘
		// TODO Auto-generated method stub
		System.out.println("대댓글 추가 로직");
		System.out.println("여기선 게시판에서 받아온 repno가 있겠지??" + rep.getRepno());
		Integer repgroupuno=this.getMaxRepGroupNo(rep.getRepno()); //같은 repno를 가진 reply레코드의 repgrounp를 하나씩 증가시키는 로직
		if(repgroupuno == 1) {
			repgroupuno+=1; //repgroupno 이 번호 가지고 나중에 줄 세울거야
		}
//		if(repgroupno==null) repno=0; 
//		repno=repno+1;
		Calendar today=Calendar.getInstance();
		int year=today.get(Calendar.YEAR);
		int month=today.get(Calendar.MONTH)+1;
		int date=today.get(Calendar.DATE);
		String repDate=year+"/"+month+"/"+date;
		System.out.println("작성일자: "+repDate);
		rep.setRegister_date(repDate); //set
		
	}
	public List<Reply> getRepList(Integer seqno) { //bbscont에 뿌려 낼 리플리스트
		return session.selectList("rep.getRepList",seqno);
	}
	public String getReplier(Integer user_no) { //
		return null;
	}

}
