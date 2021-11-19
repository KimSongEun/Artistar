package com.mycompany.artistar.post.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.artistar.post.model.vo.Post;

@Repository("postDao")
public class PostDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<Post> getPostList() throws Exception {
		return sqlSession.selectList("Post.postlist");
	}
}
