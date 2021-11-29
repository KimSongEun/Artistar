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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.mycompany.artistar.post.model.service.PostService;
import com.mycompany.artistar.post.model.vo.Post;
import com.mycompany.artistar.post_img.vo.PostImg;

@Controller
@RequestMapping("/post")
public class PostController {

	@Autowired
	private PostService postService;

//	cloudinary
	private static final String CLOUDINARY_CLOUD_NAME = "dcxu8acr5";
	private static final String CLOUDINARY_API_KEY = "871828519422828";
	private static final String CLOUDINARY_API_SECRET = "HLamwy59EVVxgcBr7jG2QfYByVs";

	Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
			"cloud_name","dcxu8acr5",
			"api_key", "871828519422828",
			"api_secret", "HLamwy59EVVxgcBr7jG2QfYByVs"));

	@GetMapping("/postlist")
	public ModelAndView postList(ModelAndView mv) {
		String id = "";
		id = "user01";
		// TODO: login session 에서 읽어와서 넣기
		
		try {
			List<Post> list = postService.getPost(id);
			mv.addObject("postlist", list);
		} catch (Exception e) {
			// TODO list 읽기 실패시 오류페이지
			e.printStackTrace();
		}
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
		// !아이디어
//		List<PostImg> postImgList = new ArrayList<PostImg>();
//		PostImg pvo = new PostImg();
//		postImgList.add(pvo);
//		vo.setPostImgList(postImgList);
		
		String viewpage = "";
		Post vo = new Post();
		int result = -1;

		vo.setPostContent(postContent);
		vo.setId("user01");
		// TODO: session id 넣어주기
		
		// 파일 저장 =============================================================
		String urlPhoto = null;
        Map uploadResult = null;
        List<PostImg> postImgList = new ArrayList<PostImg>();
        List<MultipartFile> fileList = mRequest.getFiles("postImg"); 
        for(MultipartFile mf : fileList) {
			// 파일이 있다면 저장
			if(!fileList.isEmpty()) {
				try {
					File file = Files.createTempFile("temp",mf.getOriginalFilename()).toFile();
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
				// TODO: 실패
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

}
