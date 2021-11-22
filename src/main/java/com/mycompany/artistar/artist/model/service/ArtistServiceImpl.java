package com.mycompany.artistar.artist.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.artistar.artist.model.dao.ArtistDao;
import com.mycompany.artistar.artist.model.vo.Artist;


@Service("artistService")
public class ArtistServiceImpl implements ArtistService {
	@Autowired
	private ArtistDao artistDao;
	
	@Override
	public List<Artist> getArtistList(Artist vo) throws Exception {
		List<Artist> volist = null;
		try {
			volist = artistDao.getArtistList();
		} catch(Throwable e) {
			e.printStackTrace();
		}
		return volist;
	}

	@Override
	public List<Artist> getArtistArtInfoList(Artist vo) throws Exception {
		List<Artist> volist = null;
		try {
			volist = artistDao.getArtistArtInfoList();
		} catch(Throwable e) {
			e.printStackTrace();
		}
		return volist;
	}
	
}
