package com.mycompany.artistar.post.model.service;

import java.util.List;

import com.mycompany.artistar.post.model.vo.Post;
import com.mycompany.artistar.post_img.vo.PostImg;
import com.mycompany.artistar.postcomment.model.vo.PostComment;

public interface PostService {

	// post테이블에 post_num, id, post_content 삽입
	int insertPost(Post vo) throws Exception;

	// post_img테이블에 post_num, post_img 삽입
	int insertPostImg(PostImg pvo) throws Exception;
	
	// post list follow 포함 조회
	List<Post> getPost(String id) throws Exception;
	
	// post detail 조회
	Post getPostDetail(Post vo) throws Exception;
	
	// post 삭제
	int deletePost(int postNum) throws Exception;
	
	// 좋아요 추가
	void insertLike(Post vo) throws Exception;
	
	// 좋아요 삭제
	void deleteLike(Post vo) throws Exception;
	
	// 댓글 조회
	List<PostComment> getComment(int postNum) throws Exception;
	
	// 댓글 추가
	void insertComment(PostComment cvo) throws Exception;
	
	// 댓글 삭제
	void deleteComment(int postCommentNum) throws Exception;
}
