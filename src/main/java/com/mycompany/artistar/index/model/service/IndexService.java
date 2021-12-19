package com.mycompany.artistar.index.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mycompany.artistar.artist.model.vo.Artist;
import com.mycompany.artistar.member.model.vo.Member;


public interface IndexService {

	List<Artist> getArtistList(String searchValue) throws Exception;

	List<Member> getMemberList(String searchValue) throws Exception;

	

}
