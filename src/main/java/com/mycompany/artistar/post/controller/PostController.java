package com.mycompany.artistar.post.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.mycompany.artistar.member.model.vo.Member;
import com.mycompany.artistar.post.model.dao.PostDao;
import com.mycompany.artistar.post.model.service.PostService;
import com.mycompany.artistar.post.model.vo.Post;
import com.mycompany.artistar.post_img.vo.PostImg;
import com.mycompany.artistar.postcomment.model.vo.PostComment;

@Controller
@RequestMapping("/post")
public class PostController {

	@Autowired
	private PostService postService;

	// cloudinary
	private static final String CLOUDINARY_CLOUD_NAME = "dcxu8acr5";
	private static final String CLOUDINARY_API_KEY = "871828519422828";
	private static final String CLOUDINARY_API_SECRET = "HLamwy59EVVxgcBr7jG2QfYByVs";

	Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap("cloud_name", "dcxu8acr5", "api_key", "871828519422828",
			"api_secret", "HLamwy59EVVxgcBr7jG2QfYByVs"));

	// get postlist
	@GetMapping("/postlist")
	public ModelAndView postList(ModelAndView mv, HttpServletRequest request, RedirectAttributes rttr) {
		String viewpage = "";
		HttpSession session = request.getSession();
		Member mvo = (Member)session.getAttribute("member");
		String id = mvo.getId();
		System.out.println("mvo: " + mvo);
		System.out.println("id: " + id);
		try {
			List<Post> list = postService.getPost(id);
			mv.addObject("postlist", list);
			viewpage = "/post/postlist";
		} catch (Exception e) {
			e.printStackTrace();
			viewpage = "error/commonError";
		}
		mv.setViewName(viewpage);
		return mv;
	}

	// get postinsert
	@GetMapping("/postinsert")
	public ModelAndView postInsert(ModelAndView mv) {
		mv.setViewName("/post/postinsert");
		return mv;
	}

	// post postinsert
	@PostMapping("/postinsert")
	public ModelAndView DoPostInsert(ModelAndView mv, HttpServletRequest request, RedirectAttributes rttr,
			MultipartHttpServletRequest mRequest, @RequestParam("postContent") String postContent) {
		System.out.println("postContent: " + postContent);
		// !아이디어
//		List<PostImg> postImgList = new ArrayList<PostImg>();
//		PostImg pvo = new PostImg();
//		postImgList.add(pvo);
//		vo.setPostImgList(postImgList);

		String viewpage = "";
		Post vo = new Post();
		int result = -1;
		// 세션 값 가져오기
		HttpSession session = request.getSession();
		Member mvo = (Member)session.getAttribute("member");
		
		vo.setPostContent(postContent);
		vo.setId(mvo.getId());

		// 파일 저장 =============================================================
		String urlPhoto = null;
		Map uploadResult = null;
		List<PostImg> postImgList = new ArrayList<PostImg>();
		List<MultipartFile> fileList = mRequest.getFiles("postImg");
		for (MultipartFile mf : fileList) {
			// 파일이 있다면 저장
			if (!fileList.isEmpty()) {
				try {
					File file = Files.createTempFile("temp", mf.getOriginalFilename()).toFile();
					mf.transferTo(file);

					uploadResult = cloudinary.uploader().upload(file, ObjectUtils.emptyMap());
					urlPhoto = (String) uploadResult.get("url");
					System.out.println("uploadResult: " + uploadResult);
					System.out.println("urlPhoto: " + urlPhoto);
				} catch (IOException e) {
					System.out.println("error with upload photo to cloudinary: " + e);
				}
			}

			// 저장한 파일 url
			PostImg pvo = new PostImg();
			pvo.setPostImg(urlPhoto);
			postImgList.add(pvo);
		}
		vo.setPostImgList(postImgList);

		// InsertPost ===========================================================
		try {
			result = postService.insertPost(vo);
			if (result > 0) {
				System.out.println("총 insert성공 갯수: " + result);
				viewpage = "redirect:/post/postlist";
			} else {
				System.out.println("insert 실패");
				viewpage = "error/commonError";
			}
		} catch (Exception e) {
			e.printStackTrace();
			viewpage = "error/commonError";
		}

		mv.setViewName(viewpage);
		return mv;

//		// 파일 저장, 저장한 파일 이름 꺼내서 저장. ==============================================
//		List<MultipartFile> fileList = mRequest.getFiles("postImg");
//		String root = request.getSession().getServletContext().getRealPath("resources");
//		String savePath = root + "\\uploadFiles\\";
//
//		// 폴더가 없다면 생성한다.
//		File folder = new File(savePath);
//		if (!folder.exists()) {
//			System.out.println("폴더 생성");
//			folder.mkdirs();
//		}
//        
//		// for문 안에서 파일 하나 저장할 때마다 db에 이름 들어감. ======================================
//		for (MultipartFile mf : fileList) {
//			// 원본 파일 명
//			String originFileName = mf.getOriginalFilename();
//			System.out.println("originFileName : " + originFileName);
//
//			// 파일 이름 바꾸기
//			String now = new SimpleDateFormat("yyyyMMddHmsS").format(new Date()); // 현재시간
//			int i = -1;
//			i = originFileName.lastIndexOf("."); // 파일 확장자 위치
//			String newFileName = now + originFileName.substring(i, originFileName.length()); // 현재시간과 확장자 합치기
//			System.out.println("newFileName: " + newFileName);
//
//			// 파일 저장
//			String saveFile = savePath + newFileName;
//			try {
//				mf.transferTo(new File(saveFile));
//				System.out.println(saveFile + "저장합니다.");
//			} catch (Exception e) {
//				e.printStackTrace();
//				viewpage = "error/commonError";
//			}
//
//			PostImg pvo = new PostImg();
//			pvo.setPostImg(saveFile);
//			postImgList.add(pvo);
//		}

	}

	// get postdetail
	@GetMapping("/postdetail")
	public ModelAndView postDetail(ModelAndView mv, HttpServletRequest request, RedirectAttributes rttr,
			@RequestParam("postNum") int postNum) {
		String viewpage = "";
		int result = -1;
		Post vo = new Post();
		
		// 세션 값 가져오기
		HttpSession session = request.getSession();
		Member mvo = (Member)session.getAttribute("member");

		vo.setPostNum(postNum);
		vo.setId(mvo.getId());

		try {
//			List<Post> list = postService.getPostDetail(vo);
			mv.addObject("postdetail", postService.getPostDetail(vo));
			viewpage = "/post/postdetail";
		} catch (Exception e) {
			e.printStackTrace();
			viewpage = "error/commonError";
		}
		mv.setViewName(viewpage);
		return mv;
	}

	// postdelete
	@RequestMapping("/postdelete")
	public ModelAndView postDelete(ModelAndView mv, HttpSession session, HttpServletRequest request,
			@RequestParam("postNum") int postNum, @RequestParam("id") String id) {
		String viewpage = "";
		int result = -1;
		session = request.getSession();
		Member mvo = (Member)session.getAttribute("member");
		String sessionId = mvo.getId();

		// sessionId와 post작성자 id가 일치할 때
		if (sessionId != null && sessionId == id) {
			try {
				result = postService.deletePost(postNum);
				if (result > 0) {
					viewpage = "redirect:/post/postlist";
				} else {
					System.out.println("delete 실패");
				}
			} catch (Exception e) {
				e.printStackTrace();
				viewpage = "error/commonError";
			}
		}
		mv.setViewName(viewpage);
		return mv;
	}

	// ajax postlike
	@PostMapping("/postlike")
	@ResponseBody
	public String insertLike(HttpServletRequest request, @RequestParam("likeCheck") int likeCheck,
			@RequestParam("postNum") int postNum) {
		String result = "";
		HttpSession session = request.getSession();
		Member mvo = (Member)session.getAttribute("member");

		Post vo = new Post();
		vo.setId(mvo.getId());
		vo.setPostNum(postNum);
		vo.setLikeCheck(likeCheck);

		try {
			if (likeCheck == 1) {
				postService.insertLike(vo);
				result = "ok";
			} else if (likeCheck == 0) {
				postService.deleteLike(vo);
				result = "ok";
			} else {
				System.out.println("like 처리실패");
				result = "like 처리실패";
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = "error: " + e;
		}
		return result;
	}

	// ajax get comment list
	@PostMapping("/postcomment")
	@ResponseBody
	public List<PostComment> getComment(@RequestParam("postNum") int postNum) {
		List<PostComment> list = new ArrayList<PostComment>();
		try {
			list = postService.getComment(postNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// ajax insert comment
	@PostMapping("/postaddc")
	@ResponseBody
	public List<PostComment> insertComment(HttpServletRequest request, @RequestParam("postComment") String postComment,
			@RequestParam("postNum") int postNum) {
		HttpSession session = request.getSession();
		Member mvo = (Member)session.getAttribute("member");

		List<PostComment> list = new ArrayList<PostComment>();
		PostComment cvo = new PostComment();
		cvo.setId(mvo.getId());
		cvo.setPostNum(postNum);
		cvo.setPostComment(postComment);

		try {
			postService.insertComment(cvo);
			list = postService.getComment(postNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// ajax delete comment
	@PostMapping("/postdelc")
	@ResponseBody
	public List<PostComment> delComments(HttpServletRequest request, @RequestParam("postCommentNum") int postCommentNum,
			@RequestParam("postNum") int postNum) {
		List<PostComment> list = new ArrayList<PostComment>();
		try {
			postService.deleteComment(postCommentNum);
			list = postService.getComment(postNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
