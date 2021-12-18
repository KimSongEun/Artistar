package com.mycompany.artistar.alarm.model.service;

import java.util.List;

import com.mycompany.artistar.alarm.model.vo.Alarm;

public interface AlarmService {
	
	public List<Alarm> alarmList(String userId) throws Exception;
	
	public int alarmCount(String userId) throws Exception;
	
	public int alarmStatus(String userId) throws Exception;
}
