package com.mycompany.artistar.artist.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.artistar.artinfo.model.service.ArtInfoService;
import com.mycompany.artistar.artinfo.model.vo.ArtInfo;
import com.mycompany.artistar.artist.model.service.ArtistService;
import com.mycompany.artistar.artist.model.vo.Artist;
import com.mycompany.artistar.artist_delete.vo.ArtistDelete;
import com.mycompany.artistar.artist_insert.vo.ArtistInsert;
import com.mycompany.artistar.artist_update.vo.ArtistUpdate;

@Controller
public class ArtistController {
	@Autowired
	private ArtistService artistService;
	
	@Autowired
	private ArtInfoService artInfoService;
	
	//	cloudinary
	private static final String CLOUDINARY_CLOUD_NAME = "dcxu8acr5";
	private static final String CLOUDINARY_API_KEY = "871828519422828";
	private static final String CLOUDINARY_API_SECRET = "HLamwy59EVVxgcBr7jG2QfYByVs";
	
	@RequestMapping(value = "artistmain", method=RequestMethod.GET)
	public ModelAndView artistMain(ModelAndView mv) {
		String viewpage = "";
		String userId = "song"; // TODO: 로그인 하면 바꾸기
		List<Artist> artistvolist = null;
		try {
		artistvolist = artistService.getArtistList(1, 3);
		int myArtGalleryArtistCount = artistService.myArtGalleryArtistCount(userId);
		int myArtGalleryArtCount = artistService.myArtGalleryArtCount(userId);
		viewpage = "artist/artistmain";
		mv.addObject("artistvolist", artistvolist);
		mv.addObject("myArtGalleryArtistCount", myArtGalleryArtistCount);
		mv.addObject("myArtGalleryArtCount", myArtGalleryArtCount);
		mv.addObject("userId", userId);
		
		} catch (Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	public static final int LIMIT = 3;
	
	@RequestMapping(value = "artistmain.ajax", method=RequestMethod.POST) 
	@ResponseBody
	public Map<String,Object> artistMain(
			@RequestParam(name="currentPage") int currentPage,
			@RequestParam(name="offset") int offset
			) {
		System.out.println("currentPage의 값은 : " + currentPage);
		System.out.println("offset의 값은 : " + offset);
		List<Artist> artistvolist = null;
		Map<String, Object> map = new HashMap<String,Object>();
		int listCount=artistService.artistListCount();
		int maxPage=(int)((double)listCount/LIMIT + 0.9);
		try {
			artistvolist = artistService.getArtistList(currentPage, LIMIT);
			map.put("artistvolist", artistvolist);
			map.put("maxPage", maxPage);
			map.put("offset", offset);
			map.put("currentPage", currentPage);
		} catch (Exception e){
			e.printStackTrace();
		}
		System.out.println("ajax로 갈 것 " + artistvolist);
		return map;
	};
	
	@RequestMapping(value="myartgallery", method=RequestMethod.GET)
	public ModelAndView myArtGallery(ModelAndView mv
			, @RequestParam(value="userId") String userId
			) {
		String viewpage = "";
		try {
			int myArtGalleryArtistCount = artistService.myArtGalleryArtistCount(userId);
			int myArtGalleryArtCount = artistService.myArtGalleryArtCount(userId);
			String myArtGalleryProfileImg = artistService.myArtGalleryProfileImg(userId);
			List<Artist> myGalleryArtistList = artistService.getMyGalleryArtistList(1, 1,userId);
			List<ArtInfo> myGalleryArtList = artInfoService.getMyGalleryArtList(1, 3, userId);
			viewpage = "artist/myartgallery";
			mv.addObject("userId", userId);
			mv.addObject("myArtGalleryArtistCount", myArtGalleryArtistCount);
			mv.addObject("myArtGalleryArtCount", myArtGalleryArtCount);
			mv.addObject("myArtGalleryProfileImg", myArtGalleryProfileImg);
			mv.addObject("myGalleryArtistList", myGalleryArtistList);
			mv.addObject("myGalleryArtList", myGalleryArtList);
		} catch (Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		System.out.println("userId : " + userId);
		return mv;
	}
	
	@RequestMapping(value="myartgalleryartist.ajax", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> myArtGalleryArtist(
			@RequestParam(name="currentPage") int currentPage,
			@RequestParam(name="offset") int offset
			//, @RequestParam(value="userId") String userId
			) {
		System.out.println("들어왔나?");
			List<Artist> myGalleryArtistList = null;
			List<ArtInfo> myGalleryArtList = null;
			Map<String, Object> map = new HashMap<String,Object>();
			String userId = "song"; //TODO : session 값 읽어오기!
			int myArtGalleryArtistCount = artistService.myArtGalleryArtistCount(userId);
			int myArtGalleryArtCount = artistService.myArtGalleryArtCount(userId);
			int maxPageArtist=(int)((double)myArtGalleryArtistCount + 0.9);
			int maxPageArt=(int)((double)myArtGalleryArtCount + 0.9);
		try {
			String myArtGalleryProfileImg = artistService.myArtGalleryProfileImg(userId);
			myGalleryArtistList = artistService.getMyGalleryArtistList(currentPage, 1, userId);
			myGalleryArtList = artInfoService.getMyGalleryArtList(currentPage, 3, userId);
			map.put("userId", userId);
			map.put("myArtGalleryArtistCount", myArtGalleryArtistCount);
			map.put("myArtGalleryArtCount", myArtGalleryArtCount);
			map.put("myArtGalleryProfileImg", myArtGalleryProfileImg);
			map.put("myGalleryArtistList", myGalleryArtistList);
			map.put("myGalleryArtList", myGalleryArtList);
			map.put("maxPageArtist", maxPageArtist);
			map.put("maxPageArt", maxPageArt);
			map.put("offset", offset);
			map.put("currentPage", currentPage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("offset : " + offset);
		System.out.println("maxPageArtist : " + maxPageArtist);
		return map;
	}
	
	@RequestMapping(value="myartgalleryart.ajax", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> myArtGalleryArt(
			@RequestParam(name="currentPage") int currentPage,
			@RequestParam(name="offset") int offset
			//, @RequestParam(value="userId") String userId
			) {
		System.out.println("들어왔나?");
			List<Artist> myGalleryArtistList = null;
			List<ArtInfo> myGalleryArtList = null;
			Map<String, Object> map = new HashMap<String,Object>();
			String userId = "song"; //TODO : session 값 읽어오기!
			int myArtGalleryArtistCount = artistService.myArtGalleryArtistCount(userId);
			int myArtGalleryArtCount = artistService.myArtGalleryArtCount(userId);
			int maxPageArtist=(int)((double)myArtGalleryArtistCount/LIMIT + 0.9);
			int maxPageArt=(int)((double)myArtGalleryArtCount/LIMIT + 0.9);
		try {
			String myArtGalleryProfileImg = artistService.myArtGalleryProfileImg(userId);
			myGalleryArtistList = artistService.getMyGalleryArtistList(currentPage, 1, userId);
			myGalleryArtList = artInfoService.getMyGalleryArtList(currentPage, 3, userId);
			map.put("userId", userId);
			map.put("myArtGalleryArtistCount", myArtGalleryArtistCount);
			map.put("myArtGalleryArtCount", myArtGalleryArtCount);
			map.put("myArtGalleryProfileImg", myArtGalleryProfileImg);
			map.put("myGalleryArtistList", myGalleryArtistList);
			map.put("myGalleryArtList", myGalleryArtList);
			map.put("maxPageArtist", maxPageArtist);
			map.put("maxPageArt", maxPageArt);
			map.put("offset", offset);
			map.put("currentPage", currentPage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("offset : " + offset);
		System.out.println("maxPageArtist : " + maxPageArtist);
		return map;
	}
	
	@RequestMapping("artistdetail")
	public ModelAndView artistDetail(ModelAndView mv
			, @RequestParam(value="artistNum") int artistNum
			) {
		String viewpage = "";
		try {
			Artist artistProfileArtist = artistService.getArtistProfileArtist(artistNum);
			int artistProfileArtCount = artistService.artistProfileArtCount(artistNum);
			int artistProfileFollowerCount = artistService.artistProfileFollowerCount(artistNum);
			int artistProfileContributorCount = artistService.artistProfileContributorCount(artistNum);
			List<ArtInfo> artistProfileArtInfoList = artInfoService.getArtistProfileArtInfoList(1, 3, artistNum);
//			
			viewpage = "artist/artistdetail";
			mv.addObject("artistNum", artistNum);
			mv.addObject("artistProfileArtist", artistProfileArtist);
			mv.addObject("artistProfileArtCount", artistProfileArtCount);
			mv.addObject("artistProfileFollowerCount", artistProfileFollowerCount);
			mv.addObject("artistProfileContributorCount", artistProfileContributorCount);
			mv.addObject("artistProfileArtInfoList", artistProfileArtInfoList);
		} catch (Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	@RequestMapping(value="artistdetail.ajax", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> artistDetail(
			@RequestParam(name="currentPage") int currentPage,
			@RequestParam(name="offset") int offset,
			@RequestParam(value="artistNum") int artistNum
			) {
		System.out.println("들어왔나?");
			List<ArtInfo> artistProfileArtInfoList = null;
			Map<String, Object> map = new HashMap<String,Object>();
			int artistProfileArtCount = artistService.artistProfileArtCount(artistNum);
			int maxPageArt=(int)((double)artistProfileArtCount/LIMIT + 0.9);
		try {
			artistProfileArtInfoList = artInfoService.getArtistProfileArtInfoList(currentPage, 3, artistNum);
			map.put("artistNum", artistNum);
			map.put("artistProfileArtCount", artistProfileArtCount);
			map.put("artistProfileArtInfoList", artistProfileArtInfoList);
			map.put("maxPageArt", maxPageArt);
			map.put("offset", offset);
			map.put("currentPage", currentPage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping(value="artistedit", method=RequestMethod.POST)
	public ModelAndView artistEdit(ModelAndView mv
			, @RequestParam(value="artistNum") int artistNum
			, @RequestParam(value="type") String type
			) {
		String viewpage = "";
		try {
			Artist artistProfileArtist = artistService.getArtistProfileArtist(artistNum);
			viewpage = "artist/artistedit";
			mv.addObject("artistNum", artistNum);
			mv.addObject("type", type);
			mv.addObject("artistProfileArtist", artistProfileArtist);
		} catch (Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}	
	
	@RequestMapping(value="artisteditupdate", method=RequestMethod.POST)
	public ModelAndView artistEditUpdate(ModelAndView mv
			, ArtistUpdate artistUpdate
			, @RequestParam(value="artist_num") int artistNum
			, @RequestParam("artistImg") MultipartFile report
//			,HttpServletRequest request
//			,HttpServletResponse response
			) {
		System.out.println("artist_num : 은?" + artistNum);
		String viewpage = "";
		try {
			String userId = "song"; //TODO : session 값 읽어오기!
			int result = artistService.artistUpdateRequest(artistUpdate, report, userId);
			if(result>0) {
				viewpage = "common/alert";
				mv.addObject("msg", "요청 처리가 완료되었습니다. 검토 후 수정내용 반영하도록 하겠습니다 :)");
				mv.addObject("loc", "artistdetail?artistNum="+artistNum);
				mv.addObject("result", 1);
			} else {
				viewpage = "common/alert";
				mv.addObject("msg", "정상 처리가 되지 않았습니다. 다시 시도해주세요.");
				mv.addObject("result", 0);
			}
//			Artist artistProfileArtist = artistService.getArtistProfileArtist(artistNum);
			
//			mv.addObject("artistNum", artistNum);
//			mv.addObject("artistProfileArtist", artistProfileArtist);
		} catch (Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	@RequestMapping(value="artisteditdelete", method=RequestMethod.POST)
	public ModelAndView artistEditDelete(ModelAndView mv
			, @RequestParam(value="reason") String reason
			, @RequestParam(value="artist_num") int artistNum
			) {
		String viewpage = "";
		try {
			String userId = "song"; //TODO : session 값 읽어오기!
			int result = artistService.artistDeleteRequest(reason, userId, artistNum);
			if(result>0) {
				viewpage = "common/alert";
				mv.addObject("msg", "요청 처리가 완료되었습니다. 검토 후 반영하도록 하겠습니다 :)");
				mv.addObject("loc", "artistdetail?artistNum="+artistNum);
				mv.addObject("result", 1);
			} else {
				viewpage = "common/alert";
				mv.addObject("msg", "정상 처리가 되지 않았습니다. 다시 시도해주세요.");
				mv.addObject("result", 0);
			}
		} catch (Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	@RequestMapping(value="artistinsert", method=RequestMethod.POST)
	public ModelAndView artistInsert(ModelAndView mv
			, ArtistInsert artistInsert
			, @RequestParam("artistImg") MultipartFile report
			) {
		String viewpage = "";
		try {
			String userId = "song"; //TODO : session 값 읽어오기!
			int result = artistService.artistInsertRequest(artistInsert, report, userId);
			if(result>0) {
				viewpage = "common/alert";
				mv.addObject("msg", "요청 처리가 완료되었습니다. 검토 후 반영하도록 하겠습니다 :)");
				mv.addObject("loc", "artistmain");
				mv.addObject("result", 1);
			} else {
				viewpage = "common/alert";
				mv.addObject("msg", "정상 처리가 되지 않았습니다. 다시 시도해주세요.");
				mv.addObject("result", 0);
			}
		} catch (Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	@RequestMapping(value="artistFollow.ajax", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> artistFollowAjax(
			@RequestParam("artistNum") int artistNum
			) {
		Map<String, Object> map = new HashMap<String,Object>();
		String userId = "song"; //TODO : session 값 읽어오기!
		try {
			int followResult = artistService.artistFollow(artistNum, userId);
			if(followResult==1) {
				map.put("result", "success");
			} else {
				map.put("result", "fail");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping(value="artistUnfollow.ajax", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> artistUnfollowAjax(
			@RequestParam("artistNum") int artistNum
			) {
		Map<String, Object> map = new HashMap<String,Object>();
		String userId = "song"; //TODO : session 값 읽어오기!
		try {
			int followResult = artistService.artistUnfollow(artistNum, userId);
			if(followResult==1) {
				map.put("result", "success");
			} else {
				map.put("result", "fail");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
}
