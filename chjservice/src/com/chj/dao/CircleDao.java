package com.chj.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.chj.entity.CircleTag;

@Repository
public class CircleDao extends BaseDao {

	public Object findUserCircle(HashMap<String, Object> param) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Circle.findMyJionCircle", param);
		return (List<HashMap>) obj;
		
	}

	public Object findCircleTag(Object object) {
		Long str = (Long) object;
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Tag.selCircleLable", str);
		return (List<HashMap>) obj;
	}

	public Object findUserCircleCount(HashMap<String, Object> param) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Circle.findMyJionCircleCount", param);
		return obj;
	}

}
