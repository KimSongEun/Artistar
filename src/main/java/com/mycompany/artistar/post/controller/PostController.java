package com.mycompany.artistar.post.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.artistar.post.model.service.PostService;

@Controller
public class PostController {

	@Autowired
	private PostService postService;

	@RequestMapping(value = "/post/postinsert", method = RequestMethod.GET)
	public String postInsert() {
		return "/post/postinsert";
	}

	@RequestMapping(value = "/post/postinsert", method = RequestMethod.POST)
	public String DoPostInsert(MultipartHttpServletRequest mRequest) {
		List<MultipartFile> fileList = mRequest.getFiles("postImg");
        String path = "C:\\uploadFiles\\";
        
        for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            System.out.println("originFileName : " + originFileName);
            
            // 파일 이름 바꾸기
            String now = new SimpleDateFormat("yyyyMMddHmsS").format(new Date());  //현재시간
            int i = -1;
            i = originFileName.lastIndexOf("."); // 파일 확장자 위치
            String newFileName = now + originFileName.substring(i, originFileName.length());  //현재시간과 확장자 합치기
            System.out.println("newFileName: " + newFileName);
            
            // 저장
            String saveFile = path + newFileName;
            try {
                mf.transferTo(new File(saveFile));
            } catch (Exception e) {
            	e.printStackTrace();
            }
        }

        return "redirect:/post/postinsert";
	}

}
