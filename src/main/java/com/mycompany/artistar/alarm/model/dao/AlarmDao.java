package com.mycompany.artistar.alarm.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.artistar.alarm.model.vo.Alarm;

@Repository("alarmDao")
public class AlarmDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<Alarm> alarmList(String userId) throws Exception {
		return sqlSession.selectList("Alarm.alarmList", userId);
	}
	
	public int alarmCount(String userId) throws Exception {
		return sqlSession.selectOne("Alarm.alarmCount", userId);
	}
	
	public int alarmStatus(String userId) throws Exception {
		return sqlSession.update("Alarm.alarmStatus", userId);
	}
}
