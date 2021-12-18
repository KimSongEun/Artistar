package com.mycompany.artistar.dm.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.artistar.dm.model.service.DmService;
import com.mycompany.artistar.dm.model.vo.Dm;
import com.mycompany.artistar.member.model.vo.Member;

@Controller
public class DmController {
	@Autowired
	private DmService dmService;

	@RequestMapping(value = "/dm", method = RequestMethod.GET)
	public ModelAndView message_list(ModelAndView mv, HttpServletRequest request, HttpSession session) {

		session = request.getSession();
		Member mvo = (Member)session.getAttribute("member");
		String sessionid = mvo.getId();
		System.out.println("session id 값 : " + sessionid);
		
		/* String sessionid = (String) session.getAttribute("id"); */
		String viewpage = "";
		String userImg = null;
		Dm dm = new Dm();
		String id="";
		List<Dm> volist = null;
		List<Member> volist2 = null;
		HashMap<String, String> a = new HashMap<String, String>();
		// 사용자 아이디와 이미지 매칭

		dm.setId(sessionid);

		try {
			volist = dmService.messageList(dm);
			for (Dm vo : volist) {
				String user_id = vo.getId();
				String target_id = vo.getDm_target_id();
				if (sessionid.equals(vo.getId())) {
					id = vo.getDm_target_id();
					volist2 = dmService.MemberList(id);
					for (Member vo2 : volist2) {
						userImg = vo2.getMember_img();
						a.put(vo2.getId(), vo2.getMember_img());
					}
				} else if (sessionid.equals(vo.getDm_target_id())) {
					id = vo.getId();
					volist2 = dmService.MemberList(id);
					for (Member vo2 : volist2) {
						userImg = vo2.getMember_img();
//						mv.addObject("userImg",userImg);
						a.put(vo2.getId(), vo2.getMember_img());
					}
				}
			}
			viewpage = "DM/dm";
			mv.addObject("a", a);
			mv.addObject("sessionid", sessionid);
			mv.addObject("volist", volist);
		} catch (Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}

		mv.setViewName(viewpage);
		return mv;
	}

	@RequestMapping(value = "/dmChat", method = RequestMethod.GET)
	public ModelAndView messageContent(ModelAndView mv, HttpServletRequest request, HttpSession session,
			@RequestParam("dm_room") int dm_room) {
		/* String sessionid = (String) session.getAttribute("id"); */
		session = request.getSession();
		Member mvo = (Member)session.getAttribute("member");
		String sessionid = mvo.getId();
		System.out.println("session id 값 : " + sessionid);
		
		String viewpage = "";
		String id = null;
		String userImg = null;
		Dm dm = new Dm();
		List<Dm> volist = null;
		List<Member> volist2 = null;
		List<Dm> dmchatcontent = null;
		HashMap<String, String> a = new HashMap<String, String>();

		System.out.println("채팅방 : " + dm_room);
		dm.setId(sessionid);

		try {
			volist = dmService.messageList(dm);
			System.out.println(volist);
			for (Dm vo : volist) {
				String user_id = vo.getId();
				String target_id = vo.getDm_target_id();
				if (sessionid.equals(vo.getId())) {
					id = vo.getDm_target_id();
					volist2 = dmService.MemberList(id);
					for (Member vo2 : volist2) {
						userImg = vo2.getMember_img();
						System.out.println("사용자 프로필 " + vo2.getMember_img());
						a.put(vo2.getId(), vo2.getMember_img());

					}
				} else if (sessionid.equals(vo.getDm_target_id())) {
					id = vo.getId();
					volist2 = dmService.MemberList(id);
					for (Member vo2 : volist2) {
						userImg = vo2.getMember_img();
						a.put(vo2.getId(), vo2.getMember_img());
					}
				}
				System.out.println("사용자 아이디 : " + user_id + " / 타겟 아이디 : " + target_id);
				int message_result = dmService.readMessage(dm_room);
				// 메시지 읽으면 dm_check -> 1로 변경
			}
			viewpage = "DM/dm";
			mv.addObject("a", a);
			mv.addObject("sessionid", sessionid);
			mv.addObject("volist", volist);
			dmchatcontent = dmService.messageContent(dm_room);
			System.out.println("채팅내역" + dmchatcontent);
		} catch (Exception e) {
			e.printStackTrace();
		}

		viewpage = "DM/dm";
		mv.setViewName(viewpage);
		mv.addObject("dmchatcontent", dmchatcontent);
		return mv;
	}

	@RequestMapping(value = "/dmSend", method = RequestMethod.POST)
	public ModelAndView sendMessage(ModelAndView mv, HttpServletRequest request, HttpSession session,
			@RequestParam("dm_room") int dm_room, @RequestParam("dm_chat") String dm_chat,
			@RequestParam("dm_target_id") String dm_target_id) {
		/* String sessionid = (String) session.getAttribute("id"); */
		session = request.getSession();
		Member mvo = (Member)session.getAttribute("member");
		String sessionid = mvo.getId();
		System.out.println("session id 값 : " + sessionid);
		String viewpage = "";
		String id = null;
		String userImg = null;

		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String dm_date = format1.format(time);

		Dm dm = new Dm();
		List<Dm> volist = null;
		List<Member> volist2 = null;
		List<Dm> dmchatcontent = null;
		Dm send = new Dm();
		HashMap<String, String> a = new HashMap<String, String>();
		dm.setId(sessionid);
		try {
			send.setId(sessionid);
			send.setDm_chat(dm_chat);
			send.setDm_date(dm_date);
			send.setDm_room(dm_room);
			send.setDm_target_id(dm_target_id);
			int sendMessage = dmService.sendMessage(send);
			volist = dmService.messageList(dm);
			System.out.println(volist);
			for (Dm vo : volist) {
				String user_id = vo.getId();
				String target_id = vo.getDm_target_id();
				/*
				 * send.setId(sessionid); send.setDm_chat(dm_chat); send.setDm_room(dm_room);
				 * send.setDm_target_id(vo.getDm_target_id()); send.setDm_date(dm_date);
				 * 
				 * int sendMessage = dmService.sendMessage(send);
				 * System.out.println(sendMessage+"메세지 보낸 결과 값 ================");
				 */
				if (sessionid.equals(vo.getId())) {
					id = vo.getDm_target_id();
					volist2 = dmService.MemberList(id);
					for (Member vo2 : volist2) {
						userImg = vo2.getMember_img();
						a.put(vo2.getId(), vo2.getMember_img());
					}
				} else if (sessionid.equals(vo.getDm_target_id())) {
					id = vo.getId();
					volist2 = dmService.MemberList(id);
					for (Member vo2 : volist2) {
						userImg = vo2.getMember_img();
						a.put(vo2.getId(), vo2.getMember_img());
					}
				}
				int message_result = dmService.readMessage(dm_room);
				// 메시지 읽으면 dm_check -> 1로 변경

			}
			viewpage = "DM/dm";
			mv.addObject("a", a);
			mv.addObject("sessionid", sessionid);
			mv.addObject("volist", volist);
			dmchatcontent = dmService.messageContent(dm_room);

		} catch (Exception e) {
			e.printStackTrace();
		}

		viewpage = "DM/dm";
		mv.setViewName(viewpage);
		mv.addObject("dmchatcontent", dmchatcontent);
		return mv;
	}

	@RequestMapping(value = "/mkroom", method = RequestMethod.POST)
	public ModelAndView sendMessage(ModelAndView mv, HttpServletRequest request, HttpSession session,
			@RequestParam("dm_target_id") String dm_target_id, @RequestParam("dm_chat") String dm_chat) {
		
		/* String sessionid = (String) session.getAttribute("id"); */
		session = request.getSession();
		Member mvo = (Member)session.getAttribute("member");
		String sessionid = mvo.getId();
		System.out.println("session id 값 : " + sessionid);
		String viewpage = "";
		int maxRoomNum = 0; // 채팅 방 번호 최대 값 구하기
		String id = null;
		String userImg = null;
		int RoomNumCheck=0;
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String dm_date = format1.format(time);
		int getRoomNum=0;
		int dm_room=0;
		Dm dm = new Dm();
		List<Dm> volist = null;
		List<Member> volist2 = null;
		List<Dm> dmchatcontent = null;
		Dm send = new Dm();
		HashMap<String, String> a = new HashMap<String, String>();
		dm.setId(sessionid);
		try {
			maxRoomNum = dmService.maxRoomNum();
			RoomNumCheck=dmService.roomCheck(sessionid, dm_target_id);
			if(RoomNumCheck==0) {
				dm_room=maxRoomNum+1;
			}
			else{
				getRoomNum=dmService.getRoomNum(sessionid, dm_target_id);
				dm_room=getRoomNum;
			}
			
			send.setId(sessionid);
			send.setDm_chat(dm_chat);
			send.setDm_date(dm_date);
			send.setDm_room(dm_room);
			send.setDm_target_id(dm_target_id);
			int sendMessage = dmService.sendMessage(send);
			
			volist = dmService.messageList(dm);
			for (Dm vo : volist) {
				String user_id = vo.getId();
				String target_id = vo.getDm_target_id();
				if (sessionid.equals(vo.getId())) {
					id = vo.getDm_target_id();
					volist2 = dmService.MemberList(id);
					for (Member vo2 : volist2) {
						userImg = vo2.getMember_img();
						a.put(vo2.getId(), vo2.getMember_img());
					}
				} else if (sessionid.equals(vo.getDm_target_id())) {
					id = vo.getId();
					volist2 = dmService.MemberList(id);
					for (Member vo2 : volist2) {
						userImg = vo2.getMember_img();
						a.put(vo2.getId(), vo2.getMember_img());
					}
				}
				int message_result = dmService.readMessage(dm_room);
				// 메시지 읽으면 dm_check -> 1로 변경

			}
			viewpage = "DM/dm";
			mv.addObject("a", a);
			mv.addObject("sessionid", sessionid);
			mv.addObject("volist", volist);
			dmchatcontent = dmService.messageContent(dm_room);

		} catch (Exception e) {
			e.printStackTrace();
		}

		viewpage = "DM/dm";
		mv.setViewName(viewpage);
		mv.addObject("dmchatcontent", dmchatcontent);
		return mv;
		
		
		
	}

}
