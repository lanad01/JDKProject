package dao;

import java.util.List;

import model.Reply;

public interface RepDao {
	Integer getMaxRepNo();
	Integer getMaxRepGroupNo(Integer repno);
	void entryRep(Reply rep);
	List<Reply> getRepList(Integer seqno);//게시글 번호를 통해 찾읍시다.
	List<Reply> getRereList(Integer repno); //댓글 부모 번호를 통해 같은 부모번호를 가졌다면 리스트로서 가져온다.
	String getReplier(Integer user_no); //댓글의 user_no를 통해서 실제 뽑아 낼 id를 가져오는 메서드
	Integer getRereNum(Integer seqno);
	String getPicture(Integer user_no);
	String getReplierByRepno(Integer repno);
	void deleteRep(Integer repno);
	Reply getRep(Integer repno);
	void updateRep(Reply rep);
	void updateRere(Reply rereply);
	void deleteRere(Reply rep);
	String getRereplierByRere(Reply rep);
	List<Reply> getReListOnMyBbs(Integer user_no);
	List<Reply> getMyRep(Integer user_no);
	List<Reply> getRereOnMyRep(Integer user_no);
}
