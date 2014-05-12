package com.chj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.chj.entity.ActivityPart;
import com.chj.entity.ActivityUserPart;
import com.chj.entity.CirclePart;
import com.chj.entity.Tag;
import com.chj.entity.TopicPart;
import com.chj.entity.User;
import com.chj.entity.UserAddress;
import com.chj.entity.UserCollection;
import com.chj.entity.UserServer;
import com.json.JsonLableObject;

public interface UserManager {

	public Object findPhoneCode(String phonenum);

	public Object findUserCountByUniqueField(String uniqueField,
			String fieldValue);

	public Object findUserByUniqueField(String uniqueField, String fieldValue);

	public Long registerUser(String phonenum, String email, String nickname,
			String password);

	public Object checkPhoneCode(String phonenum, String code);

	public User weblogin(User user1);

	public void updateUserInfo(User userParam);

	public void updateUserHeadImg(User user1);

	public void updateUserPassword(User user1);

	public void updateUserLableType(User user1);

	public List<JsonLableObject> findLableList(User user1);

	public void addUserTag(User user1, String tagIds);

	public List<HashMap> findUserLableSecondList(User user1, Object parentTagId);

	public List<Map<String, Object>> findUserLableFirstList(User user1);

	public List<Object> findAllLableTypeList();

	public Object findSecondLableList(Object object);

	public Object findHotLableList();

	public void updateUserBasicInfo(User userParam);

	public void updateUserDetailInfo(User userParam);

	public List<Object> findUserAllLableList(Long userId);

	public int delUserTags(User user1, String tagIds);

	public Long insertUserAddress(UserAddress address);

	public List<Object> loadUserAddress(User user1);

	public int deleteUserAddress(UserAddress userAddress);

	public int updateShandCardno(User user1);

	public Object findUserNickNameImage(Object object);

	public Object findUserfriend(HashMap<String, Object> param);

	public int saveCollectionUser(UserCollection userCollection);

	public Long findUserfriendCount(HashMap<String, Object> param);

	public List<TopicPart> findUserTopic(HashMap<String, Object> param);

	public Long findUserTopicCount(HashMap<String, Object> param);

	public Object delecteUserTopic(HashMap<String, Object> param);

	public Object findUserImage(Object object);

	public Object findUserName(Object object);

	public void addUserFriend(HashMap<String, Object> param);

	public List<ActivityUserPart> findUserActivityList(
			HashMap<String, Object> param);

	public Object findUserActivityListCount(HashMap<String, Object> param);

	public List<UserCollection> findUserCollectionCircle(HashMap map);

	public List<UserCollection> findUserCollectionActivity(HashMap map);

	public List<UserCollection> findUserCollectionTopic(HashMap map);

	public List<UserCollection> findUserCollectionProduct(HashMap map);

	public List<ActivityPart> findUserFriendActivityList(HashMap map);

	public List<CirclePart> findUserFriendCircleList(HashMap map);

	public List<TopicPart> findUserFriendTopicList(HashMap map);

	public List<CirclePart> findMyjoinCircle(HashMap map);

	public List<CirclePart> findUserFriendHomeCircleList(HashMap map);

	public List<ActivityPart> findUserFriendHomeActivityList(HashMap map);

	public List<TopicPart> findUserFriendHomeTopicList(HashMap map);

	public List<HashMap> findUserUserMsgList(HashMap map);

	public Integer addUserComment(HashMap map);

	public Object findTheCirclePerple(HashMap map);

	public List<HashMap> findCircleByKeyword(HashMap map);

	public List<HashMap> findTopicByKeyword(HashMap map);

	public List<HashMap> findActivityByKeyword(HashMap map);

	public List<HashMap> loadAreaListFirst();

	public Object findAreaThree(Object areaId);

	public Object findTheCirclePerpleCount(HashMap map);

	public Object updateCirclePerple(String userId, String status,
			String circleId);

	public Object nsetCircleManager(String userId, String circleRole,
			String circleId);

	public Object selectCircleManager(String circleRole, String circleId);

	public Object createCircleMessage(HashMap map);

	public Object examineTheMemberMeth(HashMap map);

	public Object examineTheMemberMethCount(HashMap map);

	public Object signInTheMemberMeth(HashMap map);

	public Object signInTheMemberMethCount(HashMap map);

	public Object updateActivityPerple(String actId, String uId, String tus);

	public Object createActivityMessage(HashMap map);

	public Object findCredentialsCredentials(HashMap map);

	public int settingAddressSelected(HashMap map);

	public String findActivityQrcodePath(Long activityId, Long userId);

	public Long findUserCollectCount(HashMap map);

	public HashMap findUserLocation(Long userId);

	public Object checkUserGetCode(String code);

	public void updateTbCodeTable(String code, Long userId);

	public List<String> KeywordFliter(String word);

	public Object finduserThreelableList(User user1, Object object);

	public void updateUserLoginTime(Long userId, String ip);

	public Long findUserAreaShopArea(String companyShopId, Long userId, Long areaId);

	public User findUserById(Long userId);

	public Long findIsFriend(HashMap param);

	public void deleteUserFriend(HashMap<String, Object> param);

	public Long selectUserCard(String cardNo);

	public void resetUserPassword(HashMap param);

}
