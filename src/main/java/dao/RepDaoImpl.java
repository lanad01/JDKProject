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
		if(rep.getRepgroupno()==0) { //원댓글 추가다?
			Integer repno=this.getMaxRepNo();
			if(repno==null) {
				repno=0; 
			}
			repno=repno+1;
			rep.setRepno(repno); // set
		}else if(rep.getRepgroupno() != 0) {//0이 아니면 대댓글이다
			Integer repgroupno=this.getMaxRepGroupNo(rep.getRepno()); 
			repgroupno++;
			rep.setRepgroupno(repgroupno);
		}
		Calendar today=Calendar.getInstance();
		int year=today.get(Calendar.YEAR);
		int month=today.get(Calendar.MONTH)+1;
		int date=today.get(Calendar.DATE);
		int hour=today.get(Calendar.HOUR);
		int min=today.get(Calendar.MINUTE);
		String repDate=year+"/"+month+"/"+date+"  "+hour+":"+min;
		rep.setRegister_date(repDate); //set
		session.insert("rep.putRep",rep);
	}

	public List<Reply> getRepList(Integer seqno) { //bbscont에 뿌려 낼 리플리스트
		return session.selectList("rep.getRepList",seqno);
	}
	public List<Reply> getRereList(Integer repno) { // bbscont에 뿌려 낼 대댓글 리스트
		return session.selectList("rep.getRereList",repno);
	}
	public String getReplier(Integer user_no) { //
		return session.selectOne("rep.getReplier",user_no);
	}
	public Integer getRereNum(Integer seqno) {
		return session.selectOne("rep.getRereNum",seqno);
	}
	

}
