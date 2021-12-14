package com.mycompany.artistar.dm.model.service;

import java.util.List;

import com.mycompany.artistar.dm.model.vo.Dm;
import com.mycompany.artistar.member.model.vo.Member;

public interface DmService {
	public List<Dm> messageList(Dm dm) throws Exception;
	
	public List<Member> MemberList(String id) throws Exception;
}
