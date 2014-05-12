package com.chj.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chj.dao.UserDao;
import com.chj.entity.ActivityPart;
import com.chj.entity.ActivityUserPart;
import com.chj.entity.CirclePart;
import com.chj.entity.Tag;
import com.chj.entity.TopicPart;
import com.chj.entity.User;
import com.chj.entity.UserAddress;
import com.chj.entity.UserCollection;
import com.chj.entity.UserServer;
import com.chj.service.UserManager;
import com.json.JsonLableObject;

@Service
@Transactional
public class UserManagerImpl implements UserManager {
	@Autowired
	UserDao userDao;

	@Override
	public Object findPhoneCode(String phonenum) {
		return userDao.findPhoneCode(phonenum);
	}

	@Override
	public Object findUserByUniqueField(String uniqueField, String fieldValue) {
		return userDao.findUserByUniqueField(uniqueField, fieldValue);
	}

	@Override
	public Object findUserCountByUniqueField(String uniqueField,
			String fieldValue) {
		return userDao.findUserCountByUniqueField(uniqueField, fieldValue);
	}

	@Override
	public Long registerUser(String phonenum, String email, String nickname,
			String password) {
		return userDao.registerUser(phonenum, email, nickname, password);
	}

	@Override
	public Object checkPhoneCode(String phonenum, String code) {
		return userDao.checkPhoneCode(phonenum, code);
	}

	@Override
	public User weblogin(User user1) {
		return userDao.weblogin(user1);
	}

	@Override
	public void updateUserInfo(User userParam) {
		
		userDao.updateUserInfo(userParam);
	}

	@Override
	public void updateUserHeadImg(User user1) {
		
		userDao.updateUserHeadImg(user1);
	}

	@Override
	public void updateUserPassword(User user1) {
		
		userDao.updateUserPassword(user1);
	}

	@Override
	public void updateUserLableType(User user1) {
		userDao.updateUserLableType(user1);
	}

	@Override
	public List<JsonLableObject> findLableList(User user1) {
		
		List<JsonLableObject> rt = new ArrayList<JsonLableObject>();
		List<HashMap> tagSecond = (List<HashMap>) userDao
				.findLableSecondeList(user1);
		for (HashMap lableSec : tagSecond) {
			JsonLableObject temp = new JsonLableObject();
			temp.setTagId((Long) lableSec.get("tagId"));
			temp.setTagName(lableSec.get("tagName").toString());
			temp.setChild(userDao.findLableThirdList(lableSec.get("tagId")));

			rt.add(temp);
		}
		return rt;
	}

	@Override
	public void addUserTag(User user1, String tagIds) {
		
		for (String tagId : tagIds.split(",")) {
			userDao.addUserTag(user1, tagId);
		}
	}

	@Override
	public List<HashMap> findUserLableSecondList(User user1, Object parentTagId) {
		
		return userDao.findUserLableSecondList(user1, parentTagId);
	}

	@Override
	public  List<Map<String, Object>> findUserLableFirstList(User user1) {
		
		return userDao.findUserLableFirstList(user1);
	}

	@Override
	public List<Object> findAllLableTypeList() {
		
		return userDao.findAllLableTypeList();
	}

	@Override
	public Object findSecondLableList(Object parentTagId) {
		return userDao.findSecondLableList(parentTagId);
	}

	@Override
	public Object findHotLableList() {
		return userDao.findHotLableList();
	}

	@Override
	public void updateUserBasicInfo(User userParam) {
		
		userDao.updateUserBasicInfo(userParam);
	}

	@Override
	public void updateUserDetailInfo(User userParam) {
		
		userDao.updateUserDetailInfo(userParam);
	}

	@Override
	public List<Object> findUserAllLableList(Long userId) {
		
		return userDao.findUserAllLableList(userId);
	}

	@Override
	public int delUserTags(User user1, String tagIds) {
		for (String tagId : tagIds.split(",")) {
			userDao.delUserTags(user1.getUserId(), tagId);
		}

		return 1;
	}

	@Override
	public Long insertUserAddress(UserAddress address) {
		
		return userDao.insertUserAddress(address);
	}

	@Override
	public List<Object> loadUserAddress(User user1) {
		
		return userDao.loadUserAddress(user1);
	}

	@Override
	public int deleteUserAddress(UserAddress userAddress) {
		return userDao.deleteUserAddress(userAddress);
	}

	@Override
	public int updateShandCardno(User user1) {
		return userDao.updateShandCardno(user1);
	}

	@Override
	public int saveCollectionUser(UserCollection userCollection) {
		return userDao.saveCollectionUser(userCollection);
	}

	@Override
	public Object findUserNickNameImage(Object obj) {
		return userDao.findUserNickNameImage(obj);
	}

	@Override
	public Object findUserfriend(HashMap<String, Object> param) {
		return userDao.findUserfriend(param);
	}

	@Override
	public Long findUserfriendCount(HashMap<String, Object> param) {
		return userDao.findUserfriendCount(param);
	}

	@Override
	public List<TopicPart> findUserTopic(HashMap<String, Object> param) {
		return userDao.findUserTopic(param);
	}

	@Override
	public Long findUserTopicCount(HashMap<String, Object> param) {
		return userDao.findUserTopicCount(param);
	}

	@Override
	public Object delecteUserTopic(HashMap<String, Object> param) {
		return userDao.delecteUserTopic(param);
	}

	@Override
	public Object findUserImage(Object userId) {
		return userDao.findUserImage(userId);
	}

	@Override
	public Object findUserName(Object userId) {
		return userDao.findUserName(userId);
	}

	@Override
	public void addUserFriend(HashMap<String, Object> param) {
		userDao.addUserFriend(param);
	}

	@Override
	public List<ActivityUserPart> findUserActivityList(
			HashMap<String, Object> param) {
		
		return userDao.findUserActivityList(param);
	}

	@Override
	public Object findUserActivityListCount(HashMap<String, Object> param) {
		return userDao.findUserActivityListCount(param);
	}

	@Override
	public List<UserCollection> findUserCollectionCircle(HashMap map) {
		return userDao.findUserCollectionCircle(map);
	}

	@Override
	public List<UserCollection> findUserCollectionActivity(HashMap map) {
		return userDao.findUserCollectionActivity(map);
	}

	@Override
	public List<UserCollection> findUserCollectionTopic(HashMap map) {
		return userDao.findUserCollectionTopic(map);
	}

	@Override
	public List<UserCollection> findUserCollectionProduct(HashMap map) {
		return userDao.findUserCollectionProduct(map);
	}

	@Override
	public List<ActivityPart> findUserFriendActivityList(HashMap map) {
		return userDao.findUserFriendActivityList(map);
	}

	@Override
	public List<CirclePart> findUserFriendCircleList(HashMap map) {
		
		return userDao.findUserFriendCircleList(map);
	}

	@Override
	public List<TopicPart> findUserFriendTopicList(HashMap map) {
		
		return userDao.findUserFriendTopicList(map);
	}

	@Override
	public List<CirclePart> findMyjoinCircle(HashMap map) {
		return userDao.findMyjoinCircle(map);
	}

	@Override
	public List<CirclePart> findUserFriendHomeCircleList(HashMap map) {
		
		return userDao.findUserFriendHomeCircleList(map);
	}

	@Override
	public List<ActivityPart> findUserFriendHomeActivityList(HashMap map) {
		
		return userDao.findUserFriendHomeActivityList(map);
	}

	@Override
	public List<TopicPart> findUserFriendHomeTopicList(HashMap map) {
		
		return userDao.findUserFriendHomeTopicList(map);
	}

	@Override
	public List<HashMap> findUserUserMsgList(HashMap map) {
		return userDao.findUserUserMsgList(map);
	}

	@Override
	public Integer addUserComment(HashMap map) {
		return userDao.addUserComment(map);
	}

	@Override
	public Object findTheCirclePerple(HashMap map) {
		
		return userDao.findTheCirclePerple(map);
	}

	@Override
	public List<HashMap> findCircleByKeyword(HashMap map) {
		
		return userDao.findCircleByKeyword(map);
	}

	@Override
	public List<HashMap> findTopicByKeyword(HashMap map) {
		
		return userDao.findTopicByKeyword(map);
	}

	@Override
	public List<HashMap> findActivityByKeyword(HashMap map) {
		
		return userDao.findActivityByKeyword(map);
	}

	@Override
	public List<HashMap> loadAreaListFirst() {
		
		return userDao.loadAreaListFirst();
	}

	@Override
	public Object findAreaThree(Object areaId) {
		
		return userDao.findAreaThree(areaId);
	}

	@Override
	public Object findTheCirclePerpleCount(HashMap map) {
		
		return userDao.findTheCirclePerpleCount(map);
	}

	@Override
	public Object updateCirclePerple(String userId, String status,
			String circleId) {
		String[] userIds = userId.split(",");
		if (userIds.length > 0) {
			for (String str : userIds) {

				HashMap<String, String> map = new HashMap<String, String>();
				map.put("userId", str);
				map.put("status", status);
				map.put("circleId", circleId);
				map.put("filed", "status");
				userDao.updateCirclePerple(map);
			}
		}
		return null;
	}

	@Override
	public Object nsetCircleManager(String userId, String circleRole,
			String circleId) {
		String[] userIds = userId.split(",");
		Integer t = userIds.length;
		if ("1".equals(circleRole)) {
			List list = (List) userDao
					.selectCircleManager(circleRole, circleId);
			t = t + list.size();
		}
		if (t > 4) {
			return "管理员人数超过4人限制！";
		} else {
			for (String str : userIds) {

				HashMap<String, String> map = new HashMap<String, String>();
				map.put("userId", str);
				map.put("status", circleRole);
				map.put("circleId", circleId);
				map.put("filed", "circle_role");
				userDao.updateCirclePerple(map);
			}
			return null;
		}
	}

	@Override
	public Object selectCircleManager(String circleRole, String circleId) {

		return userDao.selectCircleManager(circleRole, circleId);
	}

	@Override
	public Object createCircleMessage(HashMap map) {
		
		return userDao.createCircleMessage(map);
	}

	@Override
	public Object examineTheMemberMeth(HashMap map) {
		
		return userDao.examineTheMemberMeth(map);
	}

	@Override
	public Object examineTheMemberMethCount(HashMap map) {
		
		return userDao.examineTheMemberMethCount(map);
	}

	@Override
	public Object signInTheMemberMeth(HashMap map) {
		
		return userDao.signInTheMemberMeth(map);
	}

	@Override
	public Object signInTheMemberMethCount(HashMap map) {
		
		return userDao.signInTheMemberMethCount(map);
	}

	@Override
	public Object updateActivityPerple(String actId, String uId, String tus) {
		String[] userIds = uId.split(",");
		if (userIds.length > 0) {
			for (String str : userIds) {

				HashMap<String, String> map = new HashMap<String, String>();
				map.put("userId", str);
				map.put("status", tus);
				map.put("activityId", actId);
				map.put("filed", "status");
				userDao.updateActivityPeople(map);
			}
		}
		return null;
	}

	@Override
	public Object createActivityMessage(HashMap map) {
		 
		return userDao.createActivityMessage(map);
	}

	@Override
	public Object findCredentialsCredentials(HashMap map) {
		
		return userDao.findCredentialsCredentials(map);
	}

	@Override
	public int settingAddressSelected(HashMap map) {
		
		 userDao.cancelAddressSelected(map);
		 userDao.settingAddressSelected(map);
		 return 1;
	}

	@Override
	public String findActivityQrcodePath(Long activityId, Long userId) {
		
		 return userDao.findActivityQrcodePath(activityId,userId);
	}

	@Override
	public  Long findUserCollectCount(HashMap map){
		return userDao.findUserCollectCount(map);
	}

	@Override
	public HashMap findUserLocation(Long userId) {
		
		return userDao.findUserLocation(userId);
	}

	@Override
	public Object checkUserGetCode(String code) {
		
		return userDao.checkUserGetCode(code);
	}

	@Override
	public void updateTbCodeTable(String code, Long userId) {
		HashMap map=new HashMap();
		map.put("code", code);
		map.put("userId", userId);
		userDao.updateTbCodeTable(map);
	}

	@Override
	public List<String> KeywordFliter(String word) {
		
		return userDao.KeywordFliter(word);
	}

	@Override
	public Object finduserThreelableList(User user1, Object parentId) {
		return userDao.finduserThreelableList(user1,parentId);
	}

	@Override
	public void updateUserLoginTime(Long userId, String ip) {
		
		userDao.updateUserLoginTime(userId,ip);
	}

	@Override
	public Long findUserAreaShopArea(String companyShopId, Long userId,Long areaId) {
		
		return userDao.findUserAreaShopArea(companyShopId,userId,areaId);
	}

	@Override
	public User findUserById(Long userId) {
		
		return userDao.findUserById(userId);
	}

	@Override
	public Long findIsFriend(HashMap param) {
		
		return userDao.findIsFriend(param);
	}

	@Override
	public void deleteUserFriend(HashMap<String, Object> param) {
		
	 userDao.deleteUserFriend(param);
	}

	@Override
	public Long selectUserCard(String cardNo) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("uniqueField", "shand_cardno");
		map.put("fieldValue", cardNo);		
		return userDao.selectUserCard(map);
	}

	@Override
	public void resetUserPassword(HashMap param) {
		// TODO Auto-generated method stub
		userDao.resetUserPassword(param);
	}

	
}
