package com.mycompany.artistar.artist.model.service;

import java.util.List;

import com.mycompany.artistar.artist.model.vo.Artist;

public interface ArtistService {
	public List<Artist> getArtistList(Artist vo) throws Exception;
}