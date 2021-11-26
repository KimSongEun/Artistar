package com.mycompany.artistar.post.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("postDao")
public class PostDao {

	@Autowired
	private SqlSession sqlSession;
	
	
}
