package com.mycompany.artistar.post.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.artistar.post.model.dao.PostDao;
import com.mycompany.artistar.post.model.vo.Post;
import com.mycompany.artistar.post_img.vo.PostImg;

@Service("postService")
public class PostServiceImpl implements PostService {

	@Autowired
	private PostDao postDao;

	// post_num 추출
	@Override
	public int getPostSeqNextVal() throws Exception {
		return postDao.getPostSeqNextVal();
	}

	// post테이블에 post_num, id, post_content 삽입
	@Override
	public int insertPost(Post vo) throws Exception {
		return postDao.insertPost(vo);
	}

	// post_img테이블에 post_num, post_img 삽입. post_img_num db 시퀀스
	@Override
	public int insertPostImg(PostImg pvo) throws Exception {
		return postDao.insertPostImg(pvo);
	}

// @Transactional
//	public int insertPost(Post vo) throws Exception {
//		int result = -1;
//		int postNum = postDao.getPostSeqNextVal();
//		System.out.println("postDao postNum: " + postNum);
//		int resultPost = postDao.insertPost(vo);
//		if(postNum > 0 && resultPost > 0) {
//			if(vo.getPostImgList() != null) {
//				for(int i=0; i<vo.getPostImgList().size(); i++) {
//					result = postDao.insertPostImg(vo.getPostImgList().get(i));	
//				}
//			}
//		}
//		return result;
//	}

}
