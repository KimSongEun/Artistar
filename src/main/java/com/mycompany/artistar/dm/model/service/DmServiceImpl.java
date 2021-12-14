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
}
