package com.mycompany.artistar.post.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.artistar.post.model.service.PostService;
import com.mycompany.artistar.post.model.vo.Post;
import com.mycompany.artistar.post_img.vo.PostImg;

@Controller
@RequestMapping("/post")
public class PostController {

	@Autowired
	private PostService postService;

	@GetMapping("/postlist")
	public ModelAndView postList(ModelAndView mv) {
		mv.setViewName("/post/postlist");
		return mv;
	}

	@GetMapping("/postinsert")
	public ModelAndView postInsert(ModelAndView mv) {
		mv.setViewName("/post/postinsert");
		return mv;
	}

	@PostMapping("/postinsert")
	public ModelAndView DoPostInsert(MultipartHttpServletRequest mRequest, HttpServletRequest request,
			@RequestParam("postContent") String postContent, ModelAndView mv) {
		System.out.println("postContent: " + postContent);

		String viewpage = "";
		Post vo = new Post();
		PostImg pvo = new PostImg();
		int result = -1;

		vo.setPostContent(postContent);
		vo.setId("user01");
		// TODO: session id 넣어주기

		// getPostSeqNextVal. postNum 가져옴 ========================================
		try {
			int postNum = postService.getPostSeqNextVal();
			vo.setPostNum(postNum);
			pvo.setPostNum(postNum);
		} catch (Exception e) {
			e.printStackTrace();
			viewpage = "error/commonError";
		}

		// insertPost ==============================================================
		System.out.println("vo: " + vo);
		try {
			result = postService.insertPost(vo);
			if (result > 0) {
				System.out.println("insertPost 성공");
			} else {
				System.out.println("insertPost 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			viewpage = "error/commonError";
		}

		// 파일 저장, 저장한 파일 이름 꺼내서 저장. ==============================================
		List<MultipartFile> fileList = mRequest.getFiles("postImg");
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles\\";

		// 폴더가 없다면 생성한다.
		File folder = new File(savePath);
		if (!folder.exists()) {
			System.out.println("폴더 생성");
			folder.mkdir();
		}

		// for문 안에서 파일 하나 저장할 때마다 db에 이름 들어감. ======================================
		for (MultipartFile mf : fileList) {
			// 원본 파일 명
			String originFileName = mf.getOriginalFilename();
			System.out.println("originFileName : " + originFileName);

			// 파일 이름 바꾸기
			String now = new SimpleDateFormat("yyyyMMddHmsS").format(new Date()); // 현재시간
			int i = -1;
			i = originFileName.lastIndexOf("."); // 파일 확장자 위치
			String newFileName = now + originFileName.substring(i, originFileName.length()); // 현재시간과 확장자 합치기
			System.out.println("newFileName: " + newFileName);

			// 파일 저장
			String saveFile = savePath + newFileName;
			try {
				mf.transferTo(new File(saveFile));
				System.out.println(saveFile + "저장합니다.");
			} catch (Exception e) {
				e.printStackTrace();
				viewpage = "error/commonError";
			}

			// insertPostImg ==========================================================
			try {
				pvo.setPostImg(saveFile);
				System.out.println("for문 속 saveFile: " + saveFile);
				result = postService.insertPostImg(pvo);
				if (result > 0) {
					System.out.println("insertPostImg 성공");
					viewpage = "/post/postlist";
				} else {
					System.out.println("insertPostImg 실패");
				}
			} catch (Exception e) {
				e.printStackTrace();
				viewpage = "error/commonError";
			}
		}
		mv.setViewName(viewpage);
		return mv;
	}
}
