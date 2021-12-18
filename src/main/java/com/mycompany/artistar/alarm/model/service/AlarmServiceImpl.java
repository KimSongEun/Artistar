package com.mycompany.artistar.alarm.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.artistar.alarm.model.dao.AlarmDao;
import com.mycompany.artistar.alarm.model.vo.Alarm;

@Service("alarmService")
public class AlarmServiceImpl implements AlarmService {
	@Autowired
	private AlarmDao alarmDao;

	@Override
	public List<Alarm> alarmList(String userId) throws Exception {
		return alarmDao.alarmList(userId);
	}

	@Override
	public int alarmCount(String userId) throws Exception {
		return alarmDao.alarmCount(userId);
	}

	@Override
	public int alarmStatus(String userId) throws Exception {
		return alarmDao.alarmStatus(userId);
	}

}
