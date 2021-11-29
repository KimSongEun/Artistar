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
	public int artistListCount() {
		return artistDao.artistListCount();
	}
	
	@Override
	public List<Artist> getArtistList(int startPage, int limit) throws Exception {
		List<Artist> volist = null;
		try {
			volist = artistDao.getArtistList(startPage, limit);
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

	@Override
	public List<Artist> getMyGalleryArtistList(String userId) throws Exception {
		List<Artist> volist = null;
		try {
			volist = artistDao.getMyGalleryArtistList(userId);
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return volist;
	}

	@Override
	public Artist getArtistProfileArtist(int artistNum) throws Exception {
		return artistDao.getArtistProfileArtist(artistNum);
	}

	@Override
	public int artistProfileArtCount(int artistNum) throws Exception {
		return artistDao.artistProfileArtCount(artistNum);
	}

	@Override
	public int artistProfileFollowerCount(int artistNum) throws Exception {
		return artistDao.artistProfileFollowerCount(artistNum);
	}

	@Override
	public int artistProfileContributorCount(int artistNum) throws Exception {
		return artistDao.artistProfileContributorCount(artistNum);
	}
}
