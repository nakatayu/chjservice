package com.chj.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Repository;

import com.chj.entity.ActivityPart;
import com.chj.entity.ActivityUserPart;
import com.chj.entity.CirclePart;
import com.chj.entity.Tag;
import com.chj.entity.TopicPart;
import com.chj.entity.User;
import com.chj.entity.UserAddress;
import com.chj.entity.UserCollection;
import com.chj.entity.UserServer;
import com.chj.entity.UserTag;
import com.chj.entity.VerifyMessage;
import com.chj.util.KeywordFliter;
import com.chj.util.StaticConstant;
import com.json.JsonLableObject;

@Repository
public class UserDao extends BaseDao {

	public Object findPhoneCode(String phonenum) {

		System.out.println(phonenum);
		String s = CreateMessage(phonenum);
		VerifyMessage message = gainVerifyMessage(phonenum, s);
		Object object = this.getSqlMapClientTemplate().insert(
				"VerifyMessage.addVerifyMessage", message);
		if (object != null) {
			return s;
		}
		return null;
	}

	private VerifyMessage gainVerifyMessage(String phone, String mess) {

		VerifyMessage message = new VerifyMessage();
		message.setMessage(mess);
		message.setPhone(phone);
		Date date = new Date();
		message.setCreateTime(date);
		Date d = new Date();
		d.setMinutes(d.getMinutes() + 30);
		message.setFailTime(d);
		message.setStatus("F");
		System.out.println(date);
		return message;
	}

	private String CreateMessage(String phone) {
		phone = phone.substring(2, 9);
		Integer in = Integer.parseInt(phone);
		Integer t = (int) (Math.random() * in);
		if (t < 100000) {
			t = t + 100000;
		}
		String s = String.valueOf(t).substring(0, 6);
		return s;
	}

	public Object findUserByUniqueField(String uniqueField, String fieldValue) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uniqueField", uniqueField);
		map.put("fieldValue", fieldValue);
		Object object = this.getSqlMapClientTemplate().queryForObject(
				"User.selUserByUniqueField", map);
		return object;
	}

	public Object findUserCountByUniqueField(String uniqueField,
			String fieldValue) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uniqueField", uniqueField);
		map.put("fieldValue", fieldValue);
		Object object = this.getSqlMapClientTemplate().queryForObject(
				"User.selUserCountByUniqueField", map);
		return object;
	}

	public Long registerUser(String phonenum, String email, String nickname,
			String password) {
		User user = new User();
		user.setPhone(phonenum);
		user.setEmail(email);
		user.setNickName(nickname);
		user.setPassword(password);
		user.setIsVerify("T");
		user.setRegisterTime(new Date());
		Object object = this.getSqlMapClientTemplate().insert(
				"User.insertUser", user);
		return (Long) object;
	}

	public Object checkPhoneCode(String phonenum, String code) {
		VerifyMessage verifyMessage = new VerifyMessage(phonenum, code,
				new Date());

		VerifyMessage verage = (VerifyMessage) this
				.getSqlMapClientTemplate()
				.queryForObject("VerifyMessage.selVerifyMessage", verifyMessage);
		if (verage != null) {
			verage.setStatus("T");
			int t = this.getSqlMapClientTemplate().update(
					"VerifyMessage.updVerifyMessage", verage);
			if (t > 0) {
				return "T";
			}
		}
		return "F";
	}

	public User weblogin(User user1) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"User.selUserByAccountPassword", user1);
		return (User) obj;
	}

	public void updateUserInfo(User userParam) {

		this.getSqlMapClientTemplate().update("User.updateUserInfo", userParam);
	}

	public void updateUserHeadImg(User user1) {

		this.getSqlMapClientTemplate().update("User.updateUserHeadImg", user1);
	}

	public void updateUserPassword(User user1) {
		this.getSqlMapClientTemplate().update("User.updateUserPassword", user1);
	}

	public void updateUserLableType(User user1) {
		this.getSqlMapClientTemplate()
				.update("User.updateUserLableType", user1);
	}

	/**
	 * 二级标签列表
	 * 
	 * @param user1
	 * @return
	 */
	public List<HashMap> findLableSecondeList(User user1) {

		Object obj = null;
		if (user1 == null || user1.getLableType().equals("0")
				|| user1.getLableType() == null
				|| user1.getLableType().trim().length() == 0) {
			obj = this.getSqlMapClientTemplate().queryForList(
					"Tag.selAllSecondLable");
		} else {
			obj = this.getSqlMapClientTemplate().queryForList(
					"Tag.selUserSecondLable",
					Long.valueOf(user1.getLableType()));
		}
		if (obj == null)
			return Collections.EMPTY_LIST;
		return (List<HashMap>) obj;
	}

	/**
	 * 三级标签列表
	 * 
	 * @param object
	 * @return
	 */
	public Object findLableThirdList(Object parentId) {

		HashMap map = new HashMap();
		map.put("parentId", parentId);

		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Tag.selThirdLable", map);
		if (obj == null)
			return Collections.EMPTY_LIST;
		return obj;
	}

	public void addUserTag(User user1, String tagId) {

		UserTag userTag = new UserTag();
		userTag.setAddTime(new Date());
		userTag.setStatus(StaticConstant.TRUE);
		userTag.setTagId(Long.valueOf(tagId));
		userTag.setUserId(user1.getUserId());
		List usertag = this.getSqlMapClientTemplate().queryForList(
				"UserTag.selUserTagByUserIdTagId", userTag);
		if (usertag.size() == 0) {
			Object obj = this.getSqlMapClientTemplate().insert(
					"UserTag.insertUserTag", userTag);
			System.out.println(userTag);

		}

	}

	public List<HashMap> findUserLableSecondList(User user1, Object parentTagId) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("userId", user1.getUserId());
		param.put("parentId", parentTagId);

		Object obj = this.getSqlMapClientTemplate().queryForList(
				"UserTag.findUserLableSecondList", param);
		return (List<HashMap>) obj;
	}

	public List<Map<String, Object>> findUserLableFirstList(User user1) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"UserTag.findUserLableFirstList", user1.getUserId());
		return (List<Map<String, Object>>) obj;
	}

	public List<Object> findAllLableTypeList() {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"UserTag.selAllLableType");
		return (List<Object>) obj;
	}

	public Object findSecondLableList(Object parentTagId) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"UserTag.selSecondLable", parentTagId);
		return (List<Object>) obj;
	}

	public Object findHotLableList() {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"UserTag.selHotLable");
		return (List<Object>) obj;
	}

	public Object updateUserBasicInfo(User userParam) {
		Object obj = this.getSqlMapClientTemplate().update(
				"User.updateUserBasicInfo", userParam);
		return 1;
	}

	public Object updateUserDetailInfo(User userParam) {
		Object obj = this.getSqlMapClientTemplate().update(
				"User.updateUserDetailInfo", userParam);
		return 1;
	}

	public List<Object> findUserAllLableList(Long userId) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"UserTag.selUserAllLable", userId);
		return (List<Object>) obj;
	}

	public Object delUserTags(Long userId, String tagId) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("tagId", tagId);

		Object obj = this.getSqlMapClientTemplate().delete(
				"UserTag.delUserTag", map);
		return obj;
	}

	public Long insertUserAddress(UserAddress address) {
		Object obj = this.getSqlMapClientTemplate().insert(
				"UserAddress.insertUserAddress", address);
		return (Long) obj;
	}

	public List<Object> loadUserAddress(User user1) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"UserAddress.selUserAddress", user1.getUserId());
		return (List<Object>) obj;
	}

	public int deleteUserAddress(UserAddress userAddress) {
		Object obj = this.getSqlMapClientTemplate().delete(
				"UserAddress.deleteUserAddress", userAddress);
		return 1;
	}

	public int updateShandCardno(User user1) {
		Object obj = this.getSqlMapClientTemplate().update(
				"User.updateShandCardno", user1);
		return (Integer) obj;
	}

	public Object findUserNickNameImage(Object obj) {
		Long ld = (Long) obj;
		Object o = this.getSqlMapClientTemplate().queryForObject(
				"User.findUserNickName", ld);
		return o;
	}

	public Object findUserfriend(HashMap<String, Object> param) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"User.findUserfriend", param);
		return (List<Object>) obj;
	}

	public int saveCollectionUser(UserCollection userCollection) {
		Object obj = this.getSqlMapClientTemplate().insert(
				"UserCollection.insertUserCollection", userCollection);
		return 1;
	}

	public Long findUserfriendCount(HashMap<String, Object> param) {
		Long o = (Long) this.getSqlMapClientTemplate().queryForObject(
				"User.findUserfriendCount", param);
		return o;
	}

	// 用户参与的和用户发表的
	public List<TopicPart> findUserTopic(HashMap<String, Object> param) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Topic.findUserTopic", param);
		return (List<TopicPart>) obj;
	}

	public Long findUserTopicCount(HashMap<String, Object> param) {
		Long o = (Long) this.getSqlMapClientTemplate().queryForObject(
				"Topic.findUserTopicCount", param);
		return o;
	}

	public Object delecteUserTopic(HashMap<String, Object> param) {
		Integer a = this.getSqlMapClientTemplate().update(
				"Topic.delecteUserTopic", param);
		return a;
	}

	public Object findUserName(Object userId) {

		User user = (User) this.getSqlMapClientTemplate().queryForObject(
				"User.selUserByUserId", Long.valueOf(userId.toString()));
		if (user != null) {
			if (user.getNickName() != null
					&& user.getNickName().trim().length() > 0) {
				return user.getNickName();
			}
		}
		return "";
	}

	public Object findUserImage(Object userId) {
		HashMap param = new HashMap();
		param.put("userId", Long.valueOf(userId.toString()));
		param.put("field", "head_picture");

		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"User.findUserField", param);
		return obj;
	}

	public Object addUserFriend(HashMap<String, Object> param) {
		Object obj = this.getSqlMapClientTemplate().insert(
				"User.addUserFriend", param);
		return 1;
	}

	public List<ActivityUserPart> findUserActivityList(
			HashMap<String, Object> param) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Activity.findUserActivityList", param);
		return (List<ActivityUserPart>) obj;
	}

	public Object findUserActivityListCount(HashMap<String, Object> param) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Activity.findUserActivityListCount", param);
		return obj;
	}

	public List<UserCollection> findUserCollectionCircle(HashMap param) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Circle.selectUserCollectionCircle", param);
		return (List<UserCollection>) obj;
	}

	public List<UserCollection> findUserCollectionActivity(HashMap map) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Activity.selectUserCollectionActivity", map);
		return (List<UserCollection>) obj;
	}

	public List<UserCollection> findUserCollectionTopic(HashMap map) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Topic.selectUserCollectionTopic", map);
		return (List<UserCollection>) obj;
	}

	public List<UserCollection> findUserCollectionProduct(HashMap map) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Product.selectUserCollectionProduct", map);
		return (List<UserCollection>) obj;
	}

	public List<ActivityPart> findUserFriendActivityList(HashMap map) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Activity.selectUserFriendActivityList", map);
		return (List<ActivityPart>) obj;
	}

	public List<CirclePart> findUserFriendCircleList(HashMap map) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Circle.selectUserFriendCircleList", map);
		return (List<CirclePart>) obj;
	}

	public List<TopicPart> findUserFriendTopicList(HashMap map) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Topic.selectUserFriendTopicList", map);
		return (List<TopicPart>) obj;
	}

	public List<CirclePart> findMyjoinCircle(HashMap map) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Circle.findMyJionCircle", map);
		return (List<CirclePart>) obj;
	}

	public List<CirclePart> findUserFriendHomeCircleList(HashMap map) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Circle.selectUserFriendHomeCircleList", map);
		return (List<CirclePart>) obj;
	}

	public List<ActivityPart> findUserFriendHomeActivityList(HashMap map) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Activity.selectUserFriendHomeActivityList", map);
		return (List<ActivityPart>) obj;
	}

	public List<TopicPart> findUserFriendHomeTopicList(HashMap map) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Topic.selectUserFriendHomeTopicList", map);
		return (List<TopicPart>) obj;
	}

	public List<HashMap> findUserUserMsgList(HashMap map) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"User.selUserMessageList", map);
		return (List<HashMap>) obj;
	}

	public Integer addUserComment(HashMap map) {
		Object obj = this.getSqlMapClientTemplate().insert(
				"User.addUserComment", map);
		return 1;
	}

	public Object findTheCirclePerple(HashMap map1) {
		List<HashMap> objlist = this.getSqlMapClientTemplate().queryForList(
				"Circle.findTheCirclePerple", map1);
		for (HashMap map : objlist) {
			User user = (User) this.getSqlMapClientTemplate().queryForObject(
					"User.selUserByUserId",
					Long.valueOf(map.get("user_id").toString()));
			map.put("user", user);
		}
		return objlist;
	}

	public List<HashMap> findCircleByKeyword(HashMap map) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Circle.findCircleByKeyword", map);
		return (List<HashMap>) obj;
	}

	public List<HashMap> findTopicByKeyword(HashMap map) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Topic.findTopicByKeyword", map);
		return (List<HashMap>) obj;
	}

	public List<HashMap> findActivityByKeyword(HashMap map) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Activity.findActivityByKeyword", map);
		return (List<HashMap>) obj;
	}

	public Object findAreaThree(Object areaId) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Area.findAreaThree", Long.valueOf(areaId.toString()));
		return (List<HashMap>) obj;
	}

	public List<HashMap> loadAreaListFirst() {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Area.loadAreaListFirst");
		return (List<HashMap>) obj;
	}

	public Object findTheCirclePerpleCount(HashMap map) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Circle.findTheCirclePerpleCount", map);
		return obj;
	}

	public Object updateCirclePerple(HashMap map) {
		Object obj = this.getSqlMapClientTemplate().update(
				"Circle.updateCirclePerple", map);
		return obj;
	}

	public Object selectCircleManager(String circleRole, String circleId) {
		HashMap map1 = new HashMap();
		map1.put("circleRole", circleRole);
		map1.put("circleId", circleId);

		List<HashMap> objlist = this.getSqlMapClientTemplate().queryForList(
				"Circle.selectCircleManager", map1);
		for (HashMap map : objlist) {
			User user = (User) this.getSqlMapClientTemplate().queryForObject(
					"User.selUserByUserId",
					Long.valueOf(map.get("user_id").toString()));
			map.put("user", user);
		}
		return objlist;
	}

	public Object createCircleMessage(HashMap map) {

		List<Long> userIdList = (List<Long>) this.getSqlMapClientTemplate()
				.queryForList("Circle.selectCircleUser", map);
		Long uId = (Long) this.getSqlMapClientTemplate().queryForObject(
				"Circle.CircleCreateUser", map);
		userIdList.add(uId);

		for (Long userId : userIdList) {
			if (!userId.equals(map.get("sendUserId"))) {
				map.put("recieveUserId", userId);
				this.getSqlMapClientTemplate().insert("User.addUserComment",
						map);
			}
		}
		return null;
	}

	public Object examineTheMemberMeth(HashMap map1) {
		List<HashMap> objlist = this.getSqlMapClientTemplate().queryForList(
				"Activity.statusOfMemberMeth", map1);
		for (HashMap map : objlist) {
			User user = (User) this.getSqlMapClientTemplate().queryForObject(
					"User.selUserByUserId",
					Long.valueOf(map.get("user_id").toString()));
			map.put("user", user);
		}
		return objlist;
	}

	public Object examineTheMemberMethCount(HashMap map) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Activity.examineTheMemberMethCount", map);
		return obj;
	}

	public Object signInTheMemberMeth(HashMap map1) {
		List<HashMap> objlist = this.getSqlMapClientTemplate().queryForList(
				"Activity.signInTheMemberMeth", map1);
		for (HashMap map : objlist) {
			User user = (User) this.getSqlMapClientTemplate().queryForObject(
					"User.selUserByUserId",
					Long.valueOf(map.get("user_id").toString()));
			map.put("user", user);
		}
		return objlist;
	}

	public Object signInTheMemberMethCount(HashMap map) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Activity.signInTheMemberMethCount", map);
		return obj;
	}

	public Object updateActivityPeople(HashMap<String, String> map) {
		Object obj = this.getSqlMapClientTemplate().update(
				"Activity.updateActivityPeople", map);
		return obj;

	}

	public Object createActivityMessage(HashMap map) {
		List<Long> userIdList = this.getSqlMapClientTemplate().queryForList(
				"Activity.selectActivityUser", map);
		for (Long userId : userIdList) {
			if (!userId.equals(map.get("sendUserId"))) {
				map.put("recieveUserId", userId);
				this.getSqlMapClientTemplate().insert("User.addUserComment",
						map);
			}
		}
		return null;
	}

	public Object findCredentialsCredentials(HashMap map) {
		return this.getSqlMapClientTemplate().queryForObject(
				"User.findCredentials", map);
	}

	public void cancelAddressSelected(HashMap map) {
		this.getSqlMapClientTemplate().update(
				"UserAddress.cancelAddressSelected", map);
	}

	public void settingAddressSelected(HashMap map) {
		this.getSqlMapClientTemplate().update(
				"UserAddress.settingAddressSelected", map);
	}

	public String findActivityQrcodePath(Long activityId, Long userId) {

		HashMap map = new HashMap();
		map.put("activityId", activityId);
		map.put("userId", userId);
		return (String) this.getSqlMapClientTemplate().queryForObject(
				"Activity.findActivityQrcodePath", map);
	}

	public Long findUserCollectCount(HashMap map) {
		Object object = this.getSqlMapClientTemplate().queryForObject(
				"UserCollection.selectUserCollection", map);
		return (Long) object;
	}

	public HashMap findUserLocation(Long userId) {

		Object object = this.getSqlMapClientTemplate().queryForObject(
				"UserAddress.findUserLocation", userId);
		return (HashMap) object;
	}

	public Object checkUserGetCode(String code) {
		int i = this.getSqlMapClientTemplate().update("User.checkUserGetCode",
				code);
		if (i == 1) {
			return "T";
		}
		return "F";
	}

	public void updateTbCodeTable(HashMap map) {

		this.getSqlMapClientTemplate().update("User.updateTbCodeTable", map);
	}

	public List<String> KeywordFliter(String word) {
		KeywordFliter kf = new KeywordFliter();

		List<String> keywords = new ArrayList<String>();

		List<String> opinionList = this.getSqlMapClientTemplate().queryForList(
				"User.selectkeyWordList");
		Iterator iterator = opinionList.iterator();
		while (iterator.hasNext()) {
			String dd = iterator.next().toString();
			keywords.add(dd);
		}

		kf.addKeywords(keywords);

		HashMap hashMap = kf.getTxtKeyWords(word);
		if (hashMap != null) {
			List<String> result = new LinkedList();
			Iterator iter = hashMap.entrySet().iterator();
			while (iter.hasNext()) {
				Map.Entry entry = (Map.Entry) iter.next();
				Object key = entry.getKey();
				result.add(key.toString());
			}
			return result;
		}
		return Collections.EMPTY_LIST;
	}

	public Object finduserThreelableList(User user1, Object parentId) {
		HashMap map = new HashMap();
		map.put("parentId", parentId);
		map.put("userId", user1.getUserId());
		Object object = this.getSqlMapClientTemplate().queryForList(
				"UserTag.finduserThreelableList", map);
		return object;
	}

	public void updateUserLoginTime(Long userId, String ip) {
		// TODO Auto-generated method stub
		HashMap map = new HashMap();
		map.put("ip", ip);
		map.put("time", new Date());
		map.put("userId", userId);
		this.getSqlMapClientTemplate().update("User.updateUserLoginTime", map);
	}

	public Long findUserAreaShopArea(String companyShopId, Long userId,
			Long areaId) {
		// TODO Auto-generated method stub
		HashMap map = new HashMap();
		map.put("companyShopId", companyShopId);
		map.put("userId", userId);
		map.put("areaId", areaId);
		Object count = this.getSqlMapClientTemplate().queryForObject(
				"User.findUserAreaShopArea", map);
		return (Long) count;
	}

	public User findUserById(Long userId) {
		Object count = this.getSqlMapClientTemplate().queryForObject(
				"User.findUserById", userId);
		return (User) count;
	}

	public Long findIsFriend(HashMap param) {
		Object count = this.getSqlMapClientTemplate().queryForObject(
				"User.findIsFriend", param);
		return (Long) count;
	}

	public Object deleteUserFriend(HashMap<String, Object> param) {
		Object count = this.getSqlMapClientTemplate().update(
				"User.deleteUserFriend", param);
		return count;
	}

	public Long selectUserCard(HashMap<String, Object> param) {

		return (Long) this.getSqlMapClientTemplate().queryForObject(
				"User.selUserCountByUniqueField", param);
	}

	public void resetUserPassword(HashMap param) {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().update(
				"User.resetUserPassword", param);
	}

}
