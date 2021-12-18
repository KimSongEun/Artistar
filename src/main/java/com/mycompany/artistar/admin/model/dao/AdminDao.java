package com.mycompany.artistar.admin.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.artistar.artinfo.model.vo.ArtInfo;
import com.mycompany.artistar.artinfo_delete.vo.ArtInfoDelete;
import com.mycompany.artistar.artinfo_delete_info.vo.ArtDeleteInfo;
import com.mycompany.artistar.artinfo_insert.vo.ArtInfoInsert;
import com.mycompany.artistar.artinfo_update.vo.ArtInfoUpdate;
import com.mycompany.artistar.artist.model.vo.Artist;
import com.mycompany.artistar.artist_delete.vo.ArtistDelete;
import com.mycompany.artistar.artist_delete_info.vo.ArtistDeleteInfo;
import com.mycompany.artistar.artist_insert.vo.ArtistInsert;
import com.mycompany.artistar.artist_update.vo.ArtistUpdate;

@Repository("adminDao")
public class AdminDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int getArtistInsertCount(){
		return sqlSession.selectOne("Admin.getArtistInsertCount");
	}
	public int getArtistUpdateCount(){
		return sqlSession.selectOne("Admin.getArtistUpdateCount");
	}
	public int getArtistDeleteCount(){
		return sqlSession.selectOne("Admin.getArtistDeleteCount");
	}
	public int getArtInsertCount(){
		return sqlSession.selectOne("Admin.getArtInsertCount");
	}
	public int getArtUpdateCount(){
		return sqlSession.selectOne("Admin.getArtUpdateCount");
	}
	public int getArtDeleteCount(){
		return sqlSession.selectOne("Admin.getArtDeleteCount");
	}
	// ArtistInsert
	public List<ArtistInsert> artistInsertAll() throws Exception {
		return sqlSession.selectList("Admin.artistInsertAll");
	}
	public List<ArtistInsert> artistInsertNotYet() throws Exception{
		return sqlSession.selectList("Admin.artistInsertNotYet");
	}
	public List<ArtistInsert> artistInsertOk() throws Exception{
		return sqlSession.selectList("Admin.artistInsertOk");
	}
	public List<ArtistInsert> artistInsertNope() throws Exception{
		return sqlSession.selectList("Admin.artistInsertNope");
	}
	public ArtistInsert artistInsertInfoDetail(int insertNum) throws Exception{
		return sqlSession.selectOne("Admin.artistInsertInfoDetail", insertNum);
	}
	public int resultStatusOk(int insertNum) throws Exception {
		return sqlSession.update("Admin.resultStatusOk", insertNum);
	}
	public int resultStatusNope(int insertNum) throws Exception {
		return sqlSession.update("Admin.resultStatusNope", insertNum);
	}
	public int alarmArtist(int artistNum, String userId, String userFromId) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("artistNum", artistNum);
		map.put("userId", userId);
		map.put("userFromId", userFromId);
		
		return sqlSession.insert("Admin.alarmArtist", map);
	}
	public int alarmArtistReject(String userId, String userFromId) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("userFromId", userFromId);
		return sqlSession.insert("Admin.alarmArtistReject", map);
	}
	public int insertArtist(Artist artist) throws Exception {
		return sqlSession.insert("Admin.insertArtist", artist);
	}
	public int getArtistSeqNextVal(){
		return sqlSession.selectOne("Admin.getArtistSeqNextVal");
	}
	public int getArtistSeqCurrVal(){
		return sqlSession.selectOne("Admin.getArtistSeqCurrVal");
	}
	public int insertArtistContributor(int artistNum, String userId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("artistNum", artistNum);
		map.put("userId", userId);
		return sqlSession.insert("Admin.insertArtistContributor", map);
	}
	// ArtistUpdate
	public List<ArtistUpdate> artistUpdateAll() throws Exception {
		return sqlSession.selectList("Admin.artistUpdateAll");
	}
	public List<ArtistUpdate> artistUpdateNotYet() throws Exception{
		return sqlSession.selectList("Admin.artistUpdateNotYet");
	}
	public List<ArtistUpdate> artistUpdateOk() throws Exception{
		return sqlSession.selectList("Admin.artistUpdateOk");
	}
	public List<ArtistUpdate> artistUpdateNope() throws Exception{
		return sqlSession.selectList("Admin.artistUpdateNope");
	}
	public ArtistUpdate artistUpdateInfoDetail(int updateNum) throws Exception{
		return sqlSession.selectOne("Admin.artistUpdateInfoDetail", updateNum);
	}
	public int resultStatusOkUpdate(int updateNum) throws Exception {
		return sqlSession.update("Admin.resultStatusOkUpdate", updateNum);
	}
	public int resultStatusNopeUpdate(int updateNum) throws Exception {
		return sqlSession.update("Admin.resultStatusNopeUpdate", updateNum);
	}
	public int alarmArtistUpdate(int artistNum, String userId, String userFromId) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("artistNum", artistNum);
		map.put("userId", userId);
		map.put("userFromId", userFromId);
		
		return sqlSession.insert("Admin.alarmArtistUpdate", map);
	}
	public int alarmArtistRejectUpdate(String userId, String userFromId) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("userFromId", userFromId);
		
		return sqlSession.insert("Admin.alarmArtistRejectUpdate", map);
	}
	public int updateArtist(Artist artist) throws Exception {
		return sqlSession.update("Admin.updateArtist", artist);
	}
	
	// Artist Delete
	public List<ArtistDelete> artistDeleteAll() throws Exception {
		return sqlSession.selectList("Admin.artistDeleteAll");
	}
	public List<ArtistDelete> artistDeleteNotYet() throws Exception{
		return sqlSession.selectList("Admin.artistDeleteNotYet");
	}
	public List<ArtistDelete> artistDeleteOk() throws Exception{
		return sqlSession.selectList("Admin.artistDeleteOk");
	}
	public List<ArtistDelete> artistDeleteNope() throws Exception{
		return sqlSession.selectList("Admin.artistDeleteNope");
	}
	public ArtistDelete artistDeleteInfoDetail(int deleteNum) throws Exception{
		return sqlSession.selectOne("Admin.artistDeleteInfoDetail", deleteNum);
	}
	public ArtistDelete artistAlreadyDeleteInfoDetail(int deleteNum) throws Exception{
		return sqlSession.selectOne("Admin.artistAlreadyDeleteInfoDetail", deleteNum);
	}
	public int resultStatusOkDelete(int artistNum) throws Exception {
		return sqlSession.update("Admin.resultStatusOkDelete", artistNum);
	}
	public int resultStatusNopeDelete(int deleteNum) throws Exception {
		return sqlSession.update("Admin.resultStatusNopeDelete", deleteNum);
	}
	public int alarmArtistDelete(String userId, String userFromId) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("userFromId", userFromId);
		
		return sqlSession.insert("Admin.alarmArtistDelete", map);
	}
	public int alarmArtistRejectDelete(String userId, String userFromId) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("userFromId", userFromId);
		
		return sqlSession.insert("Admin.alarmArtistRejectDelete", map);
	}
	public int deleteArtist(int artistNum) throws Exception {
		return sqlSession.delete("Admin.deleteArtist", artistNum);
	}
	public int insertArtistDeleteInfo(ArtistDeleteInfo artistDeleteInfo) throws Exception {
		return sqlSession.insert("Admin.insertArtistDeleteInfo", artistDeleteInfo);
	}
	public List<String> artistDeleteAlarmIdList(int artistNum) throws Exception {
		return sqlSession.selectList("Admin.artistDeleteAlarmIdList", artistNum);
	}
	
	// Art Insert
	public List<ArtInfoInsert> artInsertAll() throws Exception {
		return sqlSession.selectList("Admin.artInsertAll");
	}
	public List<ArtInfoInsert> artInsertNotYet() throws Exception{
		return sqlSession.selectList("Admin.artInsertNotYet");
	}
	public List<ArtInfoInsert> artInsertOk() throws Exception{
		return sqlSession.selectList("Admin.artInsertOk");
	}
	public List<ArtInfoInsert> artInsertNope() throws Exception{
		return sqlSession.selectList("Admin.artInsertNope");
	}
	public ArtInfoInsert artInsertInfoDetail(int insertNum) throws Exception{
		return sqlSession.selectOne("Admin.artInsertInfoDetail", insertNum);
	}
	public int resultStatusOkArtInsert(int insertNum) throws Exception {
		return sqlSession.update("Admin.resultStatusOkArtInsert", insertNum);
	}
	public int resultStatusNopeArtInsert(int insertNum) throws Exception {
		return sqlSession.update("Admin.resultStatusNopeArtInsert", insertNum);
	}
	public int alarmArtInsert(int artistNum, int artinfoNum, String userId, String userFromId) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("artistNum", artistNum);
		map.put("artinfoNum", artinfoNum);
		map.put("userId", userId);
		map.put("userFromId", userFromId);
		return sqlSession.insert("Admin.alarmArtInsert", map);
	}
	public int alarmArtRejectInsert(int artistNum, String userId, String userFromId) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("artistNum", artistNum);
		map.put("userId", userId);
		map.put("userFromId", userFromId);
		return sqlSession.insert("Admin.alarmArtRejectInsert", map);
	}
	public int insertArt(ArtInfo artInfo) throws Exception {
		return sqlSession.insert("Admin.insertArt", artInfo);
	}
	public int getArtSeqNextVal(){
		return sqlSession.selectOne("Admin.getArtSeqNextVal");
	}
	
	// Art Update
	public List<ArtInfoUpdate> artUpdateAll() throws Exception {
		return sqlSession.selectList("Admin.artUpdateAll");
	}
	public List<ArtInfoUpdate> artUpdateNotYet() throws Exception{
		return sqlSession.selectList("Admin.artUpdateNotYet");
	}
	public List<ArtInfoUpdate> artUpdateOk() throws Exception{
		return sqlSession.selectList("Admin.artUpdateOk");
	}
	public List<ArtInfoUpdate> artUpdateNope() throws Exception{
		return sqlSession.selectList("Admin.artUpdateNope");
	}
	public ArtInfoUpdate artUpdateInfoDetail(int updateNum) throws Exception{
		return sqlSession.selectOne("Admin.artUpdateInfoDetail", updateNum);
	}
	public int resultStatusOkArtUpdate(int updateNum) throws Exception {
		return sqlSession.update("Admin.resultStatusOkArtUpdate", updateNum);
	}
	public int resultStatusNopeArtUpdate(int updateNum) throws Exception {
		return sqlSession.update("Admin.resultStatusNopeArtUpdate", updateNum);
	}
	public int alarmArtUpdate(int artistNum, int artinfoNum, String userId, String userFromId) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("artistNum", artistNum);
		map.put("artinfoNum", artinfoNum);
		map.put("userId", userId);
		map.put("userFromId", userFromId);
		
		return sqlSession.insert("Admin.alarmArtUpdate", map);
	}
	public int alarmArtRejectUpdate(int artistNum, String userId, String userFromId) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("artistNum", artistNum);
		map.put("userId", userId);
		map.put("userFromId", userFromId);
		
		return sqlSession.insert("Admin.alarmArtRejectUpdate", map);
	}
	public int updateArt(ArtInfo artInfo) throws Exception {
		return sqlSession.update("Admin.updateArt", artInfo);
	}
	
	// Art Delete
	public List<ArtInfoDelete> artDeleteAll() throws Exception {
		return sqlSession.selectList("Admin.artDeleteAll");
	}
	public List<ArtInfoDelete> artDeleteNotYet() throws Exception{
		return sqlSession.selectList("Admin.artDeleteNotYet");
	}
	public List<ArtInfoDelete> artDeleteOk() throws Exception{
		return sqlSession.selectList("Admin.artDeleteOk");
	}
	public List<ArtInfoDelete> artDeleteNope() throws Exception{
		return sqlSession.selectList("Admin.artDeleteNope");
	}
	public ArtInfoDelete artDeleteInfoDetail(int deleteNum) throws Exception{
		return sqlSession.selectOne("Admin.artDeleteInfoDetail", deleteNum);
	}
	public ArtInfoDelete artAlreadyDeleteInfoDetail(int deleteNum) throws Exception{
		return sqlSession.selectOne("Admin.artAlreadyDeleteInfoDetail", deleteNum);
	}
	public int resultStatusOkDeleteArt(int artinfoNum) throws Exception {
		return sqlSession.update("Admin.resultStatusOkDeleteArt", artinfoNum);
	}
	public int resultStatusNopeDeleteArt(int deleteNum) throws Exception {
		return sqlSession.update("Admin.resultStatusNopeDeleteArt", deleteNum);
	}
	public int alarmArtDelete(String userId, String userFromId) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("userFromId", userFromId);
		
		return sqlSession.insert("Admin.alarmArtDelete", map);
	}
	public int alarmArtRejectDelete(String userId, String userFromId) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("userFromId", userFromId);
		
		return sqlSession.insert("Admin.alarmArtRejectDelete", map);
	}
	public int deleteArt(int artinfoNum) throws Exception {
		return sqlSession.delete("Admin.deleteArt", artinfoNum);
	}
	public int insertArtDeleteInfo(ArtDeleteInfo artDeleteInfo) throws Exception {
		return sqlSession.insert("Admin.insertArtDeleteInfo", artDeleteInfo);
	}
	public List<String> artDeleteAlarmIdList(int artinfoNum) throws Exception {
		return sqlSession.selectList("Admin.artDeleteAlarmIdList", artinfoNum);
	}
	public List<Artist> artistNameSearch(String artistSearch) throws Exception {
		return sqlSession.selectList("Admin.artistNameSearch", artistSearch);
	}
	public int artistNumSearch(String artistName) throws Exception {
		return sqlSession.selectOne("Admin.artistNumSearch", artistName);
	}
}

