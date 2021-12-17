package com.mycompany.artistar.admin.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.artistar.admin.model.service.AdminService;
import com.mycompany.artistar.artist.model.vo.Artist;
import com.mycompany.artistar.artist_delete.vo.ArtistDelete;
import com.mycompany.artistar.artist_delete_info.vo.ArtistDeleteInfo;
import com.mycompany.artistar.artist_insert.vo.ArtistInsert;
import com.mycompany.artistar.artist_update.vo.ArtistUpdate;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	//	cloudinary
	private static final String CLOUDINARY_CLOUD_NAME = "dcxu8acr5";
	private static final String CLOUDINARY_API_KEY = "871828519422828";
	private static final String CLOUDINARY_API_SECRET = "HLamwy59EVVxgcBr7jG2QfYByVs";
	
	@RequestMapping(value = "adminmain", method=RequestMethod.GET)
	public ModelAndView adminmain(ModelAndView mv) {
		String viewpage="";
		try {
			int artistInsertCount = adminService.getArtistInsertCount();
			int artistUpdateCount = adminService.getArtistUpdateCount();
			int artistDeleteCount = adminService.getArtistDeleteCount();
			int artInsertCount = adminService.getArtInsertCount();
			int artUpdateCount = adminService.getArtUpdateCount();
			int artDeleteCount = adminService.getArtDeleteCount();
			viewpage = "admin/adminmain";
			mv.addObject("artistInsertCount", artistInsertCount);
			mv.addObject("artistUpdateCount", artistUpdateCount);
			mv.addObject("artistDeleteCount", artistDeleteCount);
			mv.addObject("artInsertCount", artInsertCount);
			mv.addObject("artUpdateCount", artUpdateCount);
			mv.addObject("artDeleteCount", artDeleteCount);
		} catch(Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	// Artist Insert
	@RequestMapping(value = "artistInsertRequest", method=RequestMethod.GET)
	public ModelAndView artistInsertRequest(ModelAndView mv) {
		String viewpage="";
		List<ArtistInsert> artistInsertAll = null;
		List<ArtistInsert> artistInsertNotYet = null;
		List<ArtistInsert> artistInsertOk = null;
		List<ArtistInsert> artistInsertNope = null;
		try {
			artistInsertAll = adminService.artistInsertAll();
			artistInsertNotYet = adminService.artistInsertNotYet();
			artistInsertOk = adminService.artistInsertOk();
			artistInsertNope = adminService.artistInsertNope();
			int artistInsertCount = adminService.getArtistInsertCount();
			int artistUpdateCount = adminService.getArtistUpdateCount();
			int artistDeleteCount = adminService.getArtistDeleteCount();
			int artInsertCount = adminService.getArtInsertCount();
			int artUpdateCount = adminService.getArtUpdateCount();
			int artDeleteCount = adminService.getArtDeleteCount();
			viewpage = "admin/adminArtistInsertRequest";
			mv.addObject("artistInsertAll", artistInsertAll);
			mv.addObject("artistInsertNotYet", artistInsertNotYet);
			mv.addObject("artistInsertOk", artistInsertOk);
			mv.addObject("artistInsertNope", artistInsertNope);
			mv.addObject("artistInsertCount", artistInsertCount);
			mv.addObject("artistUpdateCount", artistUpdateCount);
			mv.addObject("artistDeleteCount", artistDeleteCount);
			mv.addObject("artInsertCount", artInsertCount);
			mv.addObject("artUpdateCount", artUpdateCount);
			mv.addObject("artDeleteCount", artDeleteCount);
		} catch(Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	@RequestMapping(value = "artistInsert", method=RequestMethod.POST)
	public ModelAndView artistInsert(ModelAndView mv
			, @RequestParam("insert_num") int insertNum
			, @RequestParam("result") int result
			) {
		String viewpage="";
		try {
			ArtistInsert artistInsertInfoDetail = adminService.artistInsertInfoDetail(insertNum);
			int artistInsertCount = adminService.getArtistInsertCount();
			int artistUpdateCount = adminService.getArtistUpdateCount();
			int artistDeleteCount = adminService.getArtistDeleteCount();
			int artInsertCount = adminService.getArtInsertCount();
			int artUpdateCount = adminService.getArtUpdateCount();
			int artDeleteCount = adminService.getArtDeleteCount();
			mv.addObject("result", result);
			mv.addObject("artistInsertInfoDetail", artistInsertInfoDetail);
			mv.addObject("artistInsertCount", artistInsertCount);
			mv.addObject("artistUpdateCount", artistUpdateCount);
			mv.addObject("artistDeleteCount", artistDeleteCount);
			mv.addObject("artInsertCount", artInsertCount);
			mv.addObject("artUpdateCount", artUpdateCount);
			mv.addObject("artDeleteCount", artDeleteCount);
			viewpage = "admin/adminArtistInsert";
		} catch(Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	@RequestMapping(value = "artistInsertDo", method=RequestMethod.POST)
	public ModelAndView artistInsertDo(ModelAndView mv
			, @RequestParam("insert_num") int insertNum
			, @RequestParam("result") int result
			, Artist artist
			, @RequestParam("id") String userId
			, @RequestParam("artistNewImg") MultipartFile report
			) {
		String viewpage="";
		String userFromId="admin"; //TODO:세션 값 받아오기
		int artistNum = adminService.getArtistSeqNextVal();
		artist.setArtistNum(artistNum);
		try {
			System.out.println("artistNum뭐야? : " + artistNum);
			int resultStatusOkResult = adminService.resultStatusOk(insertNum);
			int alarmResult = adminService.alarmArtist(artistNum, userId, userFromId);
			int artistInsertResult = adminService.insertArtist(artist, report);
			int contributorInsertResult = adminService.insertArtistContributor(artistNum, userId);
			if(resultStatusOkResult > 0 && alarmResult > 0 && artistInsertResult > 0 &&contributorInsertResult > 0 ) {
				viewpage = "common/confirm";
				mv.addObject("msg", "등록 처리를 완료하시겠습니까?");
				mv.addObject("alert", "등록 처리가 완료되었습니다!");
				mv.addObject("loc", "artistInsertRequest");
				mv.addObject("result", 1);
			} else if (resultStatusOkResult == 0) {
				viewpage = "common/confirm";
				mv.addObject("msg", "처리결과가 반영되지 않았습니다.");
				mv.addObject("result", 0);
			} else if (alarmResult == 0) {
				viewpage = "common/confirm";
				mv.addObject("msg", "알람이 전송되지 않았습니다.");
				mv.addObject("result", 0);
			} else if (artistInsertResult == 0) {
				viewpage = "common/confirm";
				mv.addObject("msg", "작가 정보가 정상 등록되지 않았습니다.");
				mv.addObject("result", 0);
			} else if (contributorInsertResult == 0) {
				viewpage = "common/confirm";
				mv.addObject("msg", "기여자 정보가 정상 등록되지 않았습니다.");
				mv.addObject("result", 0);
			} else {
				viewpage = "common/confirm";
				mv.addObject("msg", "정상 등록이 되지 않았습니다. 다시 시도해주세요.");
				mv.addObject("result", 0);
			}
		} catch(Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	@RequestMapping(value = "artistInsertRejectDo", method=RequestMethod.POST)
	public ModelAndView artistInsertRejectDo(ModelAndView mv
			, @RequestParam("insert_num") int insertNum
			, @RequestParam("result") int result
			, @RequestParam("id") String userId
			) {
		String viewpage="";
		String userFromId="admin"; //TODO:세션 값 받아오기
		try {
			int resultStatusNopeResult = adminService.resultStatusNope(insertNum);
			int alarmRejectResult = adminService.alarmArtistReject(userId, userFromId);
			if(resultStatusNopeResult > 0 && alarmRejectResult > 0) {
				viewpage = "common/confirm";
				mv.addObject("msg", "반려 처리를 완료하시겠습니까?");
				mv.addObject("alert", "반려 처리가 완료되었습니다!");
				mv.addObject("loc", "artistInsertRequest");
				mv.addObject("result", 1);
			} else if (resultStatusNopeResult == 0) {
				viewpage = "common/confirm";
				mv.addObject("msg", "처리결과가 반영되지 않았습니다.");
				mv.addObject("result", 0);
			} else if (alarmRejectResult == 0) {
				viewpage = "common/confirm";
				mv.addObject("msg", "알람이 전송되지 않았습니다.");
				mv.addObject("result", 0);
			} else {
				viewpage = "common/confirm";
				mv.addObject("msg", "정상 등록이 되지 않았습니다. 다시 시도해주세요.");
				mv.addObject("result", 0);
			}
		} catch(Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	// Artist Update
	@RequestMapping(value = "artistUpdateRequest", method=RequestMethod.GET)
	public ModelAndView artistUpdateRequest(ModelAndView mv) {
		String viewpage="";
		List<ArtistUpdate> artistUpdateAll = null;
		List<ArtistUpdate> artistUpdateNotYet = null;
		List<ArtistUpdate> artistUpdateOk = null;
		List<ArtistUpdate> artistUpdateNope = null;
		try {
			artistUpdateAll = adminService.artistUpdateAll();
			artistUpdateNotYet = adminService.artistUpdateNotYet();
			artistUpdateOk = adminService.artistUpdateOk();
			artistUpdateNope = adminService.artistUpdateNope();
			int artistInsertCount = adminService.getArtistInsertCount();
			int artistUpdateCount = adminService.getArtistUpdateCount();
			int artistDeleteCount = adminService.getArtistDeleteCount();
			int artInsertCount = adminService.getArtInsertCount();
			int artUpdateCount = adminService.getArtUpdateCount();
			int artDeleteCount = adminService.getArtDeleteCount();
			viewpage = "admin/adminArtistUpdateRequest";
			mv.addObject("artistUpdateAll", artistUpdateAll);
			mv.addObject("artistUpdateNotYet", artistUpdateNotYet);
			mv.addObject("artistUpdateOk", artistUpdateOk);
			mv.addObject("artistUpdateNope", artistUpdateNope);
			mv.addObject("artistInsertCount", artistInsertCount);
			mv.addObject("artistUpdateCount", artistUpdateCount);
			mv.addObject("artistDeleteCount", artistDeleteCount);
			mv.addObject("artInsertCount", artInsertCount);
			mv.addObject("artUpdateCount", artUpdateCount);
			mv.addObject("artDeleteCount", artDeleteCount);
		} catch(Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	@RequestMapping(value = "artistUpdate", method=RequestMethod.POST)
	public ModelAndView artistUpdate(ModelAndView mv
			, @RequestParam("update_num") int updateNum
			, @RequestParam("result") int result
			) {
		String viewpage="";
		try {
			ArtistUpdate artistUpdateInfoDetail = adminService.artistUpdateInfoDetail(updateNum);
			int artistInsertCount = adminService.getArtistInsertCount();
			int artistUpdateCount = adminService.getArtistUpdateCount();
			int artistDeleteCount = adminService.getArtistDeleteCount();
			int artInsertCount = adminService.getArtInsertCount();
			int artUpdateCount = adminService.getArtUpdateCount();
			int artDeleteCount = adminService.getArtDeleteCount();
			mv.addObject("result", result);
			mv.addObject("artistUpdateInfoDetail", artistUpdateInfoDetail);
			mv.addObject("artistInsertCount", artistInsertCount);
			mv.addObject("artistUpdateCount", artistUpdateCount);
			mv.addObject("artistDeleteCount", artistDeleteCount);
			mv.addObject("artInsertCount", artInsertCount);
			mv.addObject("artUpdateCount", artUpdateCount);
			mv.addObject("artDeleteCount", artDeleteCount);
			viewpage = "admin/adminArtistUpdate";
		} catch(Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	@RequestMapping(value = "artistUpdateDo", method=RequestMethod.POST)
	public ModelAndView artistUpdateDo(ModelAndView mv
			, @RequestParam("update_num") int updateNum
			, @RequestParam("result") int result
			, Artist artist
			, @RequestParam("id") String userId
			, @RequestParam("artistNewImg") MultipartFile report
			, @RequestParam("artistNum") int artistNum
			) {
		String viewpage="";
		String userFromId="admin"; //TODO:세션 값 받아오기
		try {
			int resultStatusOkUpdateResult = adminService.resultStatusOkUpdate(updateNum);
			int alarmArtistUpdateResult = adminService.alarmArtistUpdate(artistNum, userId, userFromId);
			int artistUpdateResult = adminService.updateArtist(artist, report);
			int contributorUpdateResult = adminService.insertArtistContributor(artistNum, userId);
			if(resultStatusOkUpdateResult > 0 && alarmArtistUpdateResult > 0 && artistUpdateResult > 0 && contributorUpdateResult > 0 ) {
				viewpage = "common/confirm";
				mv.addObject("msg", "수정 처리를 완료하시겠습니까?");
				mv.addObject("alert", "수정 처리가 완료되었습니다!");
				mv.addObject("loc", "artistUpdateRequest");
				mv.addObject("result", 1);
			} else if (resultStatusOkUpdateResult == 0) {
				viewpage = "common/confirm";
				mv.addObject("msg", "처리결과가 반영되지 않았습니다.");
				mv.addObject("result", 0);
			} else if (alarmArtistUpdateResult == 0) {
				viewpage = "common/confirm";
				mv.addObject("msg", "알람이 전송되지 않았습니다.");
				mv.addObject("result", 0);
			} else if (artistUpdateResult == 0) {
				viewpage = "common/confirm";
				mv.addObject("msg", "작가 정보가 정상 등록되지 않았습니다.");
				mv.addObject("result", 0);
			} else if (contributorUpdateResult == 0) {
				viewpage = "common/confirm";
				mv.addObject("msg", "기여자 정보가 정상 등록되지 않았습니다.");
				mv.addObject("result", 0);
			} else {
				viewpage = "common/confirm";
				mv.addObject("msg", "정상 등록이 되지 않았습니다. 다시 시도해주세요.");
				mv.addObject("result", 0);
			}
		} catch(Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	@RequestMapping(value = "artistUpdateRejectDo", method=RequestMethod.POST)
	public ModelAndView artistUpdateRejectDo(ModelAndView mv
			, @RequestParam("update_num") int updateNum
			, @RequestParam("result") int result
			, @RequestParam("id") String userId
			) {
		String viewpage="";
		String userFromId="admin"; //TODO:세션 값 받아오기
		try {
			int resultStatusNopeUpdateResult = adminService.resultStatusNopeUpdate(updateNum);
			int alarmArtistRejectUpdateResult = adminService.alarmArtistRejectUpdate(userId, userFromId);
			if(resultStatusNopeUpdateResult > 0 && alarmArtistRejectUpdateResult > 0) {
				viewpage = "common/confirm";
				mv.addObject("msg", "반려 처리를 완료하시겠습니까?");
				mv.addObject("alert", "반려 처리가 완료되었습니다!");
				mv.addObject("loc", "artistUpdateRequest");
				mv.addObject("result", 1);
			} else if (resultStatusNopeUpdateResult == 0) {
				viewpage = "common/confirm";
				mv.addObject("msg", "처리결과가 반영되지 않았습니다.");
				mv.addObject("result", 0);
			} else if (alarmArtistRejectUpdateResult == 0) {
				viewpage = "common/confirm";
				mv.addObject("msg", "알람이 전송되지 않았습니다.");
				mv.addObject("result", 0);
			} else {
				viewpage = "common/confirm";
				mv.addObject("msg", "정상 등록이 되지 않았습니다. 다시 시도해주세요.");
				mv.addObject("result", 0);
			}
		} catch(Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	// Artist Delete
	@RequestMapping(value = "artistDeleteRequest", method=RequestMethod.GET)
	public ModelAndView artistDeleteRequest(ModelAndView mv) {
		String viewpage="";
		List<ArtistDelete> artistDeleteAll = null;
		List<ArtistDelete> artistDeleteNotYet = null;
		List<ArtistDelete> artistDeleteOk = null;
		List<ArtistDelete> artistDeleteNope = null;
		try {
			artistDeleteAll = adminService.artistDeleteAll();
			artistDeleteNotYet = adminService.artistDeleteNotYet();
			artistDeleteOk = adminService.artistDeleteOk();
			artistDeleteNope = adminService.artistDeleteNope();
			int artistInsertCount = adminService.getArtistInsertCount();
			int artistUpdateCount = adminService.getArtistUpdateCount();
			int artistDeleteCount = adminService.getArtistDeleteCount();
			int artInsertCount = adminService.getArtInsertCount();
			int artUpdateCount = adminService.getArtUpdateCount();
			int artDeleteCount = adminService.getArtDeleteCount();
			viewpage = "admin/adminArtistDeleteRequest";
			mv.addObject("artistDeleteAll", artistDeleteAll);
			mv.addObject("artistDeleteNotYet", artistDeleteNotYet);
			mv.addObject("artistDeleteOk", artistDeleteOk);
			mv.addObject("artistDeleteNope", artistDeleteNope);
			mv.addObject("artistInsertCount", artistInsertCount);
			mv.addObject("artistUpdateCount", artistUpdateCount);
			mv.addObject("artistDeleteCount", artistDeleteCount);
			mv.addObject("artInsertCount", artInsertCount);
			mv.addObject("artUpdateCount", artUpdateCount);
			mv.addObject("artDeleteCount", artDeleteCount);
		} catch(Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	@RequestMapping(value = "artistDelete", method=RequestMethod.POST)
	public ModelAndView artistDelete(ModelAndView mv
			, @RequestParam("delete_num") int deleteNum
			, @RequestParam("result") int result
			) {
		String viewpage="";
		try {
			ArtistDelete artistDeleteInfoDetail = adminService.artistDeleteInfoDetail(deleteNum);
			int artistInsertCount = adminService.getArtistInsertCount();
			int artistUpdateCount = adminService.getArtistUpdateCount();
			int artistDeleteCount = adminService.getArtistDeleteCount();
			int artInsertCount = adminService.getArtInsertCount();
			int artUpdateCount = adminService.getArtUpdateCount();
			int artDeleteCount = adminService.getArtDeleteCount();
			mv.addObject("result", result);
			mv.addObject("artistDeleteInfoDetail", artistDeleteInfoDetail);
			mv.addObject("artistInsertCount", artistInsertCount);
			mv.addObject("artistUpdateCount", artistUpdateCount);
			mv.addObject("artistDeleteCount", artistDeleteCount);
			mv.addObject("artInsertCount", artInsertCount);
			mv.addObject("artUpdateCount", artUpdateCount);
			mv.addObject("artDeleteCount", artDeleteCount);
			viewpage = "admin/adminArtistDelete";
		} catch(Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	@RequestMapping(value = "artistDeleteDo", method=RequestMethod.POST)
	public ModelAndView artistDeleteDo(ModelAndView mv
			, @RequestParam("delete_num") int deleteNum
			, @RequestParam("result") int result
			, @RequestParam("id") String userId
			, @RequestParam("artistNum") int artistNum
			, ArtistDeleteInfo artistDeleteInfo
			) {
		String viewpage="";
		String userFromId="admin"; //TODO:세션 값 받아오기
		try {
			int resultStatusOkDeleteResult = adminService.resultStatusOkDelete(artistNum);
			int artistDeleteResult = adminService.deleteArtist(artistNum);
			int insertArtistDeleteInfoResult = adminService.insertArtistDeleteInfo(artistDeleteInfo);
			List<Integer> alarmArtistDeleteResult = new ArrayList<Integer>();
			
			List<String> artistDeleteAlarmIdList = adminService.artistDeleteAlarmIdList(artistNum);
			System.out.println("artistDeleteAlarmId리스트 출력해보자 : " + artistDeleteAlarmIdList);
			for(int i = 0; i<artistDeleteAlarmIdList.size(); i++) {
				userId=artistDeleteAlarmIdList.get(i);
				System.out.println("userId는??" + userId);
				int alarmArtistDelete = adminService.alarmArtistDelete(userId, userFromId);
				System.out.println("alarmArtistDelete는??" + alarmArtistDelete);
				alarmArtistDeleteResult.add(alarmArtistDelete);
			}
			System.out.println("Result는???? : " + alarmArtistDeleteResult);
			if(resultStatusOkDeleteResult > 0 && alarmArtistDeleteResult.size()==artistDeleteAlarmIdList.size() && artistDeleteResult > 0 && insertArtistDeleteInfoResult > 0 ) {
				viewpage = "common/confirm";
				mv.addObject("msg", "삭제 처리를 완료하시겠습니까?");
				mv.addObject("alert", "삭제 처리가 완료되었습니다!");
				mv.addObject("loc", "artistDeleteRequest");
				mv.addObject("result", 1);
			} else if (resultStatusOkDeleteResult == 0) {
				viewpage = "common/confirm";
				mv.addObject("msg", "처리결과가 반영되지 않았습니다.");
				mv.addObject("result", 0);
			} else if (alarmArtistDeleteResult.size()==artistDeleteAlarmIdList.size()) {
				viewpage = "common/confirm";
				mv.addObject("msg", "알람이 전송되지 않았습니다.");
				mv.addObject("result", 0);
			} else if (artistDeleteResult == 0) {
				viewpage = "common/confirm";
				mv.addObject("msg", "작가 정보가 정상 삭제되지 않았습니다.");
				mv.addObject("result", 0);
			} else if (insertArtistDeleteInfoResult == 0) {
				viewpage = "common/confirm";
				mv.addObject("msg", "작가 삭제 정보가 정상 등록되지 않았습니다.");
				mv.addObject("result", 0);
			} else {
				viewpage = "common/confirm";
				mv.addObject("msg", "정상 등록이 되지 않았습니다. 다시 시도해주세요.");
				mv.addObject("result", 0);
			}
		} catch(Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	@RequestMapping(value = "artistDeleteRejectDo", method=RequestMethod.POST)
	public ModelAndView artistDeleteRejectDo(ModelAndView mv
			, @RequestParam("delete_num") int deleteNum
			, @RequestParam("result") int result
			, @RequestParam("id") String userId
			) {
		String viewpage="";
		String userFromId="admin"; //TODO:세션 값 받아오기
		try {
			int resultStatusNopeDeleteResult = adminService.resultStatusNopeDelete(deleteNum);
			int alarmArtistRejectDeleteResult = adminService.alarmArtistRejectDelete(userId, userFromId);
			if(resultStatusNopeDeleteResult > 0 && alarmArtistRejectDeleteResult > 0) {
				viewpage = "common/confirm";
				mv.addObject("msg", "반려 처리를 완료하시겠습니까?");
				mv.addObject("alert", "반려 처리가 완료되었습니다!");
				mv.addObject("loc", "artistDeleteRequest");
				mv.addObject("result", 1);
			} else if (resultStatusNopeDeleteResult == 0) {
				viewpage = "common/confirm";
				mv.addObject("msg", "처리결과가 반영되지 않았습니다.");
				mv.addObject("result", 0);
			} else if (alarmArtistRejectDeleteResult == 0) {
				viewpage = "common/confirm";
				mv.addObject("msg", "알람이 전송되지 않았습니다.");
				mv.addObject("result", 0);
			} else {
				viewpage = "common/confirm";
				mv.addObject("msg", "정상 등록이 되지 않았습니다. 다시 시도해주세요.");
				mv.addObject("result", 0);
			}
		} catch(Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
}
