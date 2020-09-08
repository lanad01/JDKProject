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
	public String getPicture(Integer user_no) {
		// TODO Auto-generated method stub
		return session.selectOne("rep.getPicture",user_no);
	}
	public String getReplierByRepno(Integer repno) {
		// TODO Auto-generated method stub
		return session.selectOne("rep.getReplierByRepno",repno);
	}
	public void deleteRep(Integer repno) {
		// TODO Auto-generated method stub
		session.delete("rep.deleteByRepno",repno);
	}
	public void updateRep(Reply rep) {
		session.update("rep.updateRep", rep);
	}
	public Reply getRep(Integer repno) {
		// TODO Auto-generated method stub
		return session.selectOne("rep.getRepByRepno",repno);
	}
	public void updateRere(Reply rereply) {
		// TODO Auto-generated method stub
		session.update("rep.updateRere",rereply);
	}
	public void deleteRere(Reply rep) {
		// TODO Auto-generated method stub
		session.delete("rep.deleteRere", rep);
	}
	public String getRereplierByRere(Reply rep) {
		// TODO Auto-generated method stub
		return session.selectOne("rep.getRereplierByRere",rep);
	}
	public List<Reply> getReListOnMyBbs(Integer user_no) {
		// TODO Auto-generated method stub
		return session.selectList("rep.getReListOnMyBbs",user_no);
	}
	public List<Reply> getMyRep(Integer user_no) {
		// TODO Auto-generated method stub
		return session.selectList("rep.getMyRep",user_no);
	}
	public List<Reply> getRereOnMyRep(Integer user_no) {
		// TODO Auto-generated method stub
		return session.selectList("rep.getRereOnMyRep",user_no);
	}
	

}
