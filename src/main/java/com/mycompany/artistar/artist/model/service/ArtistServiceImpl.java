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
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return volist;
	}

	@Override
	public List<Artist> getArtistArtInfoImgList(int artistNum) throws Exception {
		List<Artist> volist = null;
		try {
			volist = artistDao.getArtistArtInfoImgList(artistNum);
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return volist;
	}

	@Override
	public List<Artist> getArtistFollowerList(Artist vo) throws Exception {
		List<Artist> volist = null;
		try {
			volist = artistDao.getArtistFollowerList();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return volist;
	}

	@Override
	public int myArtGalleryArtistCount(String userId) throws Exception {
		int myArtGalleryArtistCount = 0;
		try {
			myArtGalleryArtistCount=artistDao.myArtGalleryArtistCount(userId);
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return myArtGalleryArtistCount;
	}

	@Override
	public int myArtGalleryArtCount(String userId) throws Exception {
		int myArtGalleryArtCount = 0;
		try {
			myArtGalleryArtCount=artistDao.myArtGalleryArtCount(userId);
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return myArtGalleryArtCount;
	}

	@Override
	public String myArtGalleryProfileImg(String userId) throws Exception {
		String myArtGalleryProfileImg = null;
		try {
			myArtGalleryProfileImg=artistDao.myArtGalleryProfileImg(userId);
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return myArtGalleryProfileImg;
	}
}
