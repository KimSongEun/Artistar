package com.mycompany.artistar.post.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.artistar.post.model.vo.Post;
import com.mycompany.artistar.post_img.vo.PostImg;

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
}
