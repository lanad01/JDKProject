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

	public void entryRep(Reply rep) { //여기서 댓글인지 대댓글인지 분기를 줘보자 
		System.out.println("----------------------RepDaoImpl 시작 ------------------------------");
		System.out.println("repgroupno 값 : "+rep.getRepgroupno());
		if(rep.getRepgroupno()==0) { //원댓글 추가다?
			System.out.println("RepDaoImpl 원댓글 추가 분기");
			Integer repno=this.getMaxRepNo();
			if(repno==null) {
				repno=0; 
			}
			repno=repno+1;
			rep.setRepno(repno); // set
		}else if(rep.getRepgroupno() != 0) {//0이 아니면 대댓글이다
			System.out.println("RepDaoImpl 대댓글 추가 분기");
			Integer repgroupno=this.getMaxRepGroupNo(rep.getRepno()); 
			repgroupno++;

			System.out.println("RedDaoImpl 대댓글 - repgroupno : "+repgroupno);
			rep.setRepgroupno(repgroupno);
		}
		Calendar today=Calendar.getInstance();
		int year=today.get(Calendar.YEAR);
		int month=today.get(Calendar.MONTH)+1;
		int date=today.get(Calendar.DATE);
		int hour=today.get(Calendar.HOUR);
		int min=today.get(Calendar.MINUTE);
		String repDate=year+"/"+month+"/"+date+"  "+hour+":"+min;
		System.out.println("작성일자: "+repDate);
		rep.setRegister_date(repDate); //set
		session.insert("rep.putRep",rep);
	}

	public List<Reply> getRepList(Integer seqno) { //bbscont에 뿌려 낼 리플리스트
		System.out.println("getRepList에 들어가는 seqno : "+seqno);
		System.out.println("댓글 리스트 뽑아내봐 그냥"+session.selectList("rep.getRepList",seqno));
		return session.selectList("rep.getRepList",seqno);
	}
	public List<Reply> getRereList(Integer repno) { // bbscont에 뿌려 낼 대댓글 리스트
		System.out.println("&&&&&&&&&&&&&&&&&&&&대댓글 리스트 출력 &&&&&&&&&&&&&&&&&&&&&&&&&&&");
		System.out.println("대댓글 List에 들어가는 reqno : "+repno);
		System.out.println("대댓글 리스트 뽑아내봐 그냥"+session.selectList("rep.getRereList",repno));
		return session.selectList("rep.getRereList",repno);
	}
	public String getReplier(Integer user_no) { //
		return session.selectOne("rep.getReplier",user_no);
	}
	

}
