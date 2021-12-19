package com.mycompany.artistar.index.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.artistar.artist.model.vo.Artist;
import com.mycompany.artistar.index.model.service.IndexService;
import com.mycompany.artistar.member.model.vo.Member;

@Controller
public class IndexController {
	@Autowired
	private IndexService indexservice;
	
	
	@GetMapping("/search")
	public ModelAndView search(ModelAndView mv, HttpServletRequest request, RedirectAttributes rttr,@RequestParam("searchValue") String searchValue) {
		System.out.println("서치 값 확인 "+searchValue);
		String viewpage = "";
		HttpSession session = request.getSession();
		Member mvo = (Member)session.getAttribute("member");
		String id = mvo.getId();
		System.out.println("mvo: " + mvo);
		System.out.println("id: " + id);
		List<Member> memberlist=null;
		List<Artist> artistlist=null;
		
		try {
			memberlist=indexservice.getMemberList(searchValue);
//			artistlist=indexservice.getArtistList(searchValue);
//			if(memberlist.size()==0) {
//				if(artistlist.size()!=0) {
//					
//					viewpage="index/search";
//					mv.addObject("artistlist",artistlist);
//				}
//			}
//			else if(artistlist.size()==0) {
//				if(memberlist.size()!=0) {
//					
//					viewpage="index/search";
//					mv.addObject("memberlist",memberlist);
//				}
//			}
//			System.out.println("artistlist : " + artistlist);
			
			if(memberlist.size()==0) {
				String msg="일치하는 사용자가 없습니다.";
				viewpage="index/search";
				mv.addObject("msg",msg);
			}
			else if(memberlist.size()!=0) {
				
				viewpage="index/search";
				mv.addObject("memberlist",memberlist);
			}
			System.out.println("memberlist : " + memberlist);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.setViewName(viewpage);
		return mv;
	}
	@GetMapping("/post/search")
	public ModelAndView postsearch(ModelAndView mv, HttpServletRequest request, RedirectAttributes rttr,@RequestParam("searchValue") String searchValue) {
		System.out.println("서치 값 확인 "+searchValue);
		String viewpage = "";
		HttpSession session = request.getSession();
		Member mvo = (Member)session.getAttribute("member");
		String id = mvo.getId();
		System.out.println("mvo: " + mvo);
		System.out.println("id: " + id);
		List<Member> memberlist=null;
		List<Artist> artistlist=null;
		
		try {
			memberlist=indexservice.getMemberList(searchValue);
//			artistlist=indexservice.getArtistList(searchValue);
//			if(memberlist.size()==0) {
//				if(artistlist.size()!=0) {
//					
//					viewpage="index/search";
//					mv.addObject("artistlist",artistlist);
//				}
//			}
//			else if(artistlist.size()==0) {
//				if(memberlist.size()!=0) {
//					
//					viewpage="index/search";
//					mv.addObject("memberlist",memberlist);
//				}
//			}
//			System.out.println("artistlist : " + artistlist);
			
			if(memberlist.size()==0) {
				String msg="일치하는 사용자가 없습니다.";
				viewpage="index/search";
				mv.addObject("msg",msg);
			}
			else if(memberlist.size()!=0) {
				
				viewpage="index/search";
				mv.addObject("memberlist",memberlist);
			}
			System.out.println("memberlist : " + memberlist);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.setViewName(viewpage);
		return mv;
	}
}
