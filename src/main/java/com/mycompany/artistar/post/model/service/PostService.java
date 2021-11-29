package com.mycompany.artistar.post.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.mycompany.artistar.post.model.vo.Post;
import com.mycompany.artistar.post_img.vo.PostImg;

public interface PostService {

	// post테이블에 post_num, id, post_content 삽입
	public int insertPost(Post vo) throws Exception;

	// post_img테이블에 post_num, post_img 삽입
	public int insertPostImg(PostImg pvo) throws Exception;
	
	// post 조회
	public List<Post> getPost(String id) throws Exception;
}
