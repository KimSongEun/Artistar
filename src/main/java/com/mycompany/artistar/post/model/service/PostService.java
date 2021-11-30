package com.mycompany.artistar.post.model.service;

import java.util.List;

import com.mycompany.artistar.post.model.vo.Post;
import com.mycompany.artistar.post_img.vo.PostImg;

public interface PostService {

	// post테이블에 post_num, id, post_content 삽입
	int insertPost(Post vo) throws Exception;

	// post_img테이블에 post_num, post_img 삽입
	int insertPostImg(PostImg pvo) throws Exception;
	
	// post list follow 포함 조회
	List<Post> getPost(String id) throws Exception;
	
	// post detail 조회
	List<Post> getPostDetail(int postNum) throws Exception;
}
