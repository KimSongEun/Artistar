package com.mycompany.artistar.post.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.artistar.post.model.dao.PostDao;
import com.mycompany.artistar.post.model.vo.Post;
import com.mycompany.artistar.post_img.vo.PostImg;
import com.mycompany.artistar.postcomment.model.vo.PostComment;

@Service("postService")
public class PostServiceImpl implements PostService {

	@Autowired
	private PostDao postDao;

	// insert post
	@Override
	@Transactional
	public int insertPost(Post vo) throws Exception {
		int result = 0;
		int resultPost = 0;

		int postNum = postDao.getPostSeqNextVal();
		vo.setPostNum(postNum);

		resultPost = postDao.insertPost(vo);
		if (postNum > 0 && resultPost > 0) {
			if (vo.getPostImgList() != null) {
				for (int i = 0; i < vo.getPostImgList().size(); i++) {
					vo.getPostImgList().get(i).setPostNum(postNum);
					result += postDao.insertPostImg(vo.getPostImgList().get(i));
				}
			}
		}
		System.out.println("postNum: " + postNum);
		System.out.println("insert post result:" + resultPost);
		System.out.println("insertImg 총 result:" + result);
		return resultPost + result;
	}

	// post_img테이블에 post_num, post_img 삽입
	@Override
	public int insertPostImg(PostImg pvo) throws Exception {
		return postDao.insertPostImg(pvo);
	}

	// post list follow 포함 조회
	@Override
	public List<Post> getPost(String id) throws Exception {
		return postDao.getPost(id);
	}

	// post detail 조회
	@Override
	public Post getPostDetail(Post vo) throws Exception {
		return postDao.getPostDetail(vo);
	}

	// post 삭제
	@Override
	public int deletePost(int postNum) throws Exception {
		return postDao.deletePost(postNum);
	}

	// 좋아요 추가
	@Override
	public void insertLike(Post vo) throws Exception {
		postDao.insertLike(vo);
		postDao.updateLikePlus(vo);
	}

	// 좋아요 삭제
	@Override
	public void deleteLike(Post vo) throws Exception {
		postDao.deleteLike(vo);
		postDao.updateLikeMinus(vo);
	}
	
	// 댓글 목록
	@Override
	public List<PostComment> getComment(int postNum) throws Exception {
		return postDao.getComment(postNum);
	}

	// 댓글 추가
	@Override
	public void insertComment(PostComment cvo) throws Exception {
		postDao.insertComment(cvo);
	}

	// 댓글 삭제
	@Override
	public void deleteComment(int postCommentNum) throws Exception {
		postDao.deleteComment(postCommentNum);	
	}
}
