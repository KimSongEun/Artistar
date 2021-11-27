package com.mycompany.artistar.post.model.service;

import com.mycompany.artistar.post.model.vo.Post;
import com.mycompany.artistar.post_img.vo.PostImg;

public interface PostService {
	// post_num 추출
	public int getPostSeqNextVal() throws Exception;
	
	// post테이블에 post_num, id, post_content 삽입
	public int insertPost(Post vo) throws Exception;
	
	// post_img테이블에 post_num, post_img 삽입. post_img_num db 시퀀스
	public int insertPostImg(PostImg pvo) throws Exception;
	}
