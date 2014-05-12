package com.chj.service.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chj.dao.CircleDao;
import com.chj.service.CircleManager;

@Service
@Transactional
public class CircleManagerImpl implements CircleManager{
  
	@Autowired
	CircleDao circleDao;
	@Override
	public Object findUserCircle(HashMap<String, Object> param) {
		return circleDao.findUserCircle(param);
	}
	@Override
	public Object findCircleTag(Object object) {
		// TODO Auto-generated method stub
		return circleDao.findCircleTag(object);
	}
	@Override
	public Object findUserCircleCount(HashMap<String, Object> param) {
		// TODO Auto-generated method stub
		return circleDao.findUserCircleCount(param);
	}

}
