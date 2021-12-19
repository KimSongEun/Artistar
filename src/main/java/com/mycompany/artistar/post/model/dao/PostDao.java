package com.mycompany.artistar.post.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.artistar.follow.vo.Follow;
import com.mycompany.artistar.post.model.vo.Post;
import com.mycompany.artistar.post_img.vo.PostImg;
import com.mycompany.artistar.postcomment.model.vo.PostComment;
import com.mycompany.artistar.story.model.vo.Story;

@Repository
public class PostDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int getPostSeqNextVal() throws Exception {
		return sqlSession.selectOne("Post.getPostSeqNextVal");
	}
	public int insertPost(Post vo) throws Exception {
		return sqlSession.insert("Post.InsertPost", vo);
	}
	public int insertPostImg(PostImg pvo) throws Exception {
		return sqlSession.insert("Post.InsertPostImg", pvo);
	}
	public List<Post> getPost(String id) throws Exception {
		return sqlSession.selectList("Post.getPost", id);
	}
	public Post getPostDetail(Post vo) throws Exception {
		return sqlSession.selectOne("Post.getPostDetail", vo);
	}
	public int deletePost(int postNum) throws Exception {
		return sqlSession.delete("Post.deletePost", postNum);
	}
	public void insertLike(Post vo) throws Exception {
		sqlSession.insert("Post.insertLike", vo);
	}
	public void updateLikePlus(Post vo) throws Exception {
		sqlSession.update("Post.updateLikePlus", vo);
	}
	public void deleteLike(Post vo) throws Exception {
		sqlSession.update("Post.deleteLike", vo);
	}
	public void updateLikeMinus(Post vo) throws Exception {
		sqlSession.update("Post.updateLikeMinus", vo);
	}
	public List<PostComment> getComment(int postNum) throws Exception {
		return sqlSession.selectList("Post.getComment", postNum);
	}
	public void insertComment(PostComment cvo) throws Exception {
		sqlSession.insert("Post.insertComment", cvo);
	}
	public void deleteComment(int postCommentNum) throws Exception {
		sqlSession.delete("Post.deleteComment", postCommentNum);
	}
//	스토리 가져오기
	public List<Follow> getStoryFollowList(String sessionid){
		return sqlSession.selectList("Follow.getFollow", sessionid);
	}
	public List<Story> getStoryMainList(/* String userId */) throws Exception { //메인스토리 리스트	
		return sqlSession.selectList("StoryNS.storyviewer"/*,userId*/);
	}
	
	public List<Story> getStoryIdList() throws Exception { //메인스토리 리스트	
		return sqlSession.selectList("StoryNS.storyOverlap");
	}
}
