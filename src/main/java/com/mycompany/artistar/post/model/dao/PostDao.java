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
	public List<Post> getPostDetail(int postNum) throws Exception {
		return sqlSession.selectList("Post.getPostDetail", postNum);
	}
	public int deletePost(int postNum) throws Exception {
		return sqlSession.delete("Post.deletePost", postNum);
	}
}
