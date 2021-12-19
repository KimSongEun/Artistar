package com.mycompany.artistar.index.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.artistar.artist.model.vo.Artist;
import com.mycompany.artistar.index.model.dao.IndexDao;
import com.mycompany.artistar.member.model.vo.Member;

@Service("indexservice")
public class IndexServiceImpl implements IndexService {
	@Autowired
	private IndexDao indexdao;
	public List<Artist> getArtistList(String searchValue) throws Exception {
		List<Artist> artistlist = null;
		try {
			artistlist = indexdao.getArtistList(searchValue);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return artistlist;
	}

	public List<Member> getMemberList(String searchValue) throws Exception {
		List<Member> memberlist = null;
		try {
			memberlist = indexdao.getMemberList(searchValue);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberlist;
	}
}
