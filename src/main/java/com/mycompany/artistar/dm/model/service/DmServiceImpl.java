package com.mycompany.artistar.dm.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.artistar.dm.model.dao.dmDao;
import com.mycompany.artistar.dm.model.vo.Dm;
import com.mycompany.artistar.member.model.vo.Member;

@Service("dmService")
public class DmServiceImpl implements DmService{
	@Autowired dmDao dmdao;
	
	public List<Dm> messageList(Dm dm) throws Exception{
		List<Dm> volist =null;
		try {
			volist = dmdao.messageList(dm);
			System.out.println("DAOLIST"+volist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return volist;
	}
	
	public List<Member> MemberList(String id) throws Exception{
		List<Member> volist2=null;
//		System.out.println(id+"service에서 받는 id 값");
		try {
			
			volist2=dmdao.MemberList(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return volist2;
	}
	
	public List<Dm> messageContent(int dm_room) throws Exception{
		List<Dm> volist =null;
		try {
			volist = dmdao.massageContent(dm_room);
			System.out.println("DAOLISTMASSAGECONTENT" + volist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return volist;
	}
	
	public int readMessage(int dm_room) throws Exception{
		int result=dmdao.readMessage(dm_room);
		
		return result;
	}
	
	public int sendMessage(Dm send) throws Exception{
		int result=0;
		try {
			result=dmdao.sendMessage(send);
			System.out.println("DAOSENDMESSAGE : " + send);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int maxRoomNum() throws Exception{
		int result=0;
		try {
			result=dmdao.maxRoomNum();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int roomCheck(String sessionid, String dm_target_id) throws Exception{
		int result=0;
		try {
			result=dmdao.roomCheck(sessionid,dm_target_id);
			System.out.println("방번호 체크하기. 없으면 0, 있으면 1 : "+result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int getRoomNum(String sessionid, String dm_target_id) throws Exception{
		int result=0;
		try {
			result=dmdao.getRoomNum(sessionid,dm_target_id);
			System.out.println("방번호 가져오기. : "+result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
