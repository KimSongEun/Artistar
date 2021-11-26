package com.mycompany.artistar.post.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.artistar.post.model.dao.PostDao;
import com.mycompany.artistar.post.model.vo.Post;

@Service("postService")
public class PostServiceImpl implements PostService {

	@Autowired
	private PostDao postDao;

}
