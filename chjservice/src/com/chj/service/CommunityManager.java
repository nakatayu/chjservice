package com.chj.service;

import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.chj.entity.Activity;
import com.chj.entity.ActivityComment;
import com.chj.entity.ActivityPart;
import com.chj.entity.Circle;
import com.chj.entity.CircleCreateUser;
import com.chj.entity.CirclePart;
import com.chj.entity.ProductCollection;
import com.chj.entity.Topic;
import com.chj.entity.TopicComment;
import com.chj.entity.TopicPart;
import com.chj.entity.User;
import com.json.JsonLableObject;

public interface CommunityManager {

	List<JsonLableObject> findLableList(User user1);

	List<CirclePart> findCircleList(HashMap<String, Object> param);

	Object findCircleListCount(HashMap<String, Object> param);

	int addUserCircle(HashMap map);

	Long findCircleUserCount(Long circleId, Long userId);

	Circle findCircleById(String circleId);

	Object findCircleUserList(HashMap param);

	Object findTopicList(HashMap param);

	Object findCircleActivityImage(Long circleId);

	Long insertCircle(Circle circle, String cardImage, String imgChanged);

	Long insertTopic(Topic circle, String tagList, String topicImage, String imgChanged, HttpServletRequest request);

	Topic findTopicById(String topicId);

	List<TopicComment> findTopicComment(HashMap param);

	Object findTopicCommentCount(HashMap param);

	Long addTopicComment(TopicComment map);

	Object findUserInfoById(Long userId);

	Object findTopicImageList(String topicId);

	CirclePart findCircleRelative(Long circleId);

	CircleCreateUser findCircleCreateUser(Long userId);

	Long findCircleCreateUser(Long friendUserId, Long userId);

	CirclePart findCircleRecommend(Long circleId, Long userId);

	Object findTopicListCount(HashMap<String, Object> param);

	Object findHotTopicList(HashMap<String, Object> param);

	Long createActivityData(Activity circle);

	List<ActivityPart> findTopActivityList(HashMap<String, Object> param);

	Object findTopActivityListCount(HashMap<String, Object> param);

	Long findHasQrcodeCount(Long circleId, Long userId);

	Long findActivityUserCount(Long activityId, Long userId);

	void addActivityUser(HashMap<String, Object> param, HashMap cardParam);

	int generActivityQrcode(HashMap activityUser);

	Activity findActivityById(String activityId);

	Object findActivityUserList(HashMap param);

	Object findActivityImage(HashMap param);

	Object addProductComment(HashMap param);

	Object selectProductComments(HashMap param);

	CirclePart findActivityCircleRelative(Long valueOf);

	List<ActivityPart> findActivityRecommend(HashMap param);

	List<ActivityComment> findActivityComment(HashMap param1);

	Long addActivityComment(ActivityComment map);

	Object queryCommentCreatTime(HashMap param);

	HashMap findActivityUserQrcode(Long valueOf, Long userId);

	int userSignInActivity(HashMap map);

	String findActivityUserIsSignIn(Long activityId, Long userId);

	ProductCollection findProductCollectionPartById(Long objectId);

	List<CirclePart> findCircleRecommendList(HashMap<String, Object> param);

	List<HashMap> findHeadPageActivity();

	void uploadActivityUserAlbum(HashMap param, String imgList);

	Long findIsActivityUser(Long activityId, Long userId);
	//此方法有误，未用
	Object findActivityUserAlbumCount(Long activityId, Long userId);

	ActivityPart findActivityPartById(Long objectId);

	CirclePart findCirclePartById(Long objectId);

	List<HashMap> findAllTagList(User user1);

	HashMap findActivityEnrollTime(Long valueOf);

	int applyCloseActivity(HashMap activityUser);

	HashMap findCommunityCompanyInfo(Long companyId);

	String findActivityUserStatus(Long userId, Long activityId);

	void updateActivityUserStatus(HashMap param, HashMap cardParam);

	Object findActivityImageCount(String activityId);

	void deletefromactImg(String activityImage, Long userId);

	Object queryPictureComment(HashMap param);

	String findCircleUserStatus(Long userId, Long valueOf);

	void updateCircleUserStatus(HashMap activityUser);

	int applyCloseCircle(HashMap activityUser);
 
	Object queryOnePictureComment(String pictComId);

	void addPictureOfActComment(ActivityComment actCom);

	List<CirclePart> findCircleRecommendForUser(HashMap map);

	Integer findCircleUserRole(Long userId, Long valueOf);

	Object findActCreUserById(String activityId);

	int updateTopicDelete(HashMap param );


	Long findCircleUserIdByCircleId(Long valueOf);

	Long findActivityUserId(Long valueOf);

	int uploadActivityImage(HashMap map);


	Object finDelectTopicArean(HashMap map);

	int uploadPersonnalApplyCard(HashMap map, String type);

	int updateTopicTop(HashMap param);

	List<String> findCircleUserCardImage(Long valueOf);

	Integer findCircleHotNum();

	List<CirclePart> findHomeCircleList(HashMap<String, Object> param);

	List<HashMap> findActivityMapList(HashMap<String, Object> param);

	Object findActivityMapListCount(HashMap<String, Object> param);

	long findActivityUserImageCount(HashMap map);

	long findActivityRemainUser(Long activityId);

	Long findCircleUserRemain(Long circleId);

	List<HashMap> findCircleLevelList();

	List<TopicPart> findClassicTopTopicList();

	List<TopicPart> findClassicTopicList(HashMap<String, Object> param1);
	/**
	 * 活动和用户相同的标签
	 * @param param1
	 * @return
	 */
	List<HashMap> findActivityAndUserTagList(HashMap<String, Object> param1);

	List<CirclePart> findCircleRecommend(
			HashMap<String, Object> param);

	List<HashMap>  findCircleAndUserTagList(
			HashMap<String, Object> param1);

	List<HashMap> findTopicAndUserTagList(
			HashMap<String, Object> param1);

	List<TopicPart> findTopicRecommend(
			HashMap<String, Object> param);

 
	
}
