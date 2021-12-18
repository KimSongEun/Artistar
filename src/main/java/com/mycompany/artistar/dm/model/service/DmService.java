package com.mycompany.artistar.dm.model.service;

import java.util.List;

import com.mycompany.artistar.dm.model.vo.Dm;
import com.mycompany.artistar.member.model.vo.Member;

public interface DmService {
	public List<Dm> messageList(Dm dm) throws Exception;
	
	public List<Member> MemberList(String id) throws Exception;
	
	public List<Dm> messageContent(int dm_room) throws Exception;
	
	public int readMessage(int dm_room) throws Exception;
	
	public int sendMessage(Dm send) throws Exception;

	public int maxRoomNum() throws Exception;

	public int roomCheck(String sessionid, String dm_target_id) throws Exception;

	public int getRoomNum(String sessionid, String dm_target_id) throws Exception;
}
