package com.chj.dao;

import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

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
import com.chj.util.StaticConstant;
import com.json.JsonLableObject;

@Repository
public class CommunityDao extends BaseDao {

	public List<HashMap> findLableSecondeList(Object parentId) {
		// TODO Auto-generated method stub
		HashMap param = new HashMap();
		if (parentId != null)
			param.put("parentId", Long.valueOf(parentId.toString()));

		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Tag.selAllSecondLable", param);
		return (List<HashMap>) obj;
	}

	public Object findLableThirdList(Object parentId, Long userId) {
		// TODO Auto-generated method stub
		HashMap map = new HashMap();
		map.put("parentId", parentId);
		if(userId!=null)
			map.put("userId", userId);
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Tag.selThirdLable", map);
		return obj;
	}

	public List<CirclePart> findCircleList(HashMap<String, Object> param) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Circle.findCircleList", param);
		return (List<CirclePart>) obj;
	}

	public Object findCircleListCount(HashMap<String, Object> param) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Circle.findCircleListCount", param);
		return obj;
	}

	public int addUserCircle(HashMap param) {
		Object obj = this.getSqlMapClientTemplate().insert(
				"Circle.insertUserCircle", param);
		return 1;
	}

	public Long findCircleUserCount(Long circleId, Long userId) {
		HashMap map = new HashMap();
		map.put("circleId", circleId);
		map.put("userId", userId);

		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Circle.findCircleUserCount", map);
		return (Long) obj;
	}

	public Circle findCircleById(String circleId) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Circle.findCircleById", Long.valueOf(circleId));
		return (Circle) obj;
	}

	public Object findCircleUserList(HashMap param) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Circle.findCircleUserList", param);
		return obj;
	}

	public Object findTopicList(HashMap param) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Topic.findTopicList", param);
		return obj;
	}

	public Object findCircleActivityImage(Long circleId) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Activity.selectCircleActivityImage", circleId);
		return obj;
	}

	public Long insertCircle(Circle circle) {
		Object obj = this.getSqlMapClientTemplate().insert(
				"Circle.insertCircle", circle);
		return (Long) obj;
	}

	public void insertCircleUser(HashMap map) {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().insert("Circle.insertCircleUser", map);

	}

	public void insertCircleTag(HashMap circletag) {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().insert("Circle.insertCircleTag",
				circletag);

	}

	public void insertCircleCardImage(HashMap circletag) {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().insert("Circle.insertCircleCardImage",
				circletag);

	}

	public Long insertTopic(Topic topic) {
		// TODO Auto-generated method stub
		Object obj = this.getSqlMapClientTemplate().insert("Topic.insertTopic",
				topic);
		return (Long) obj;
	}

	public void insertTopicTag(HashMap topictag) {
		this.getSqlMapClientTemplate().insert("Topic.insertTopicTag", topictag);

	}

	public void insertTopicImage(HashMap topicImage) {
		this.getSqlMapClientTemplate().insert("Topic.insertTopicImage",
				topicImage);
	}

	public Topic findTopicById(String topicId) {
		// TODO Auto-generated method stub
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Topic.findTopicById", Long.valueOf(topicId));
		return (Topic) obj;
	}

	public List<TopicComment> findTopicComment(HashMap param) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"TopicComment.findTopicCommentByTopicId", param);
		return (List<TopicComment>) obj;
	}

	public Object findTopicCommentCount(HashMap param) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"TopicComment.findTopicCommentCountByTopicId", param);
		return obj;
	}

	public Long addTopicComment(TopicComment map) {
		Object obj = this.getSqlMapClientTemplate().insert(
				"TopicComment.insertTopicComment", map);
		return (Long) obj;
	}

	public Object findUserInfoById(Long userId) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Topic.findUserInfoById", userId);
		return obj;
	}

	public Object findTopicImageList(String topicId) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Topic.findTopicImageList", Long.valueOf(topicId));
		return obj;
	}

	public CirclePart findCircleRelative(Long circleId) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Circle.findCircleRelative", Long.valueOf(circleId));
		return (CirclePart) obj;
	}

	public CircleCreateUser findCircleCreateUser(Long userId) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Circle.selectCircleCreateUser", userId);
		return (CircleCreateUser) obj;
	}

	/**
	 * 是否已加为好友
	 * 
	 * @param friendUserId
	 * @param userId
	 * @return
	 */
	public Long findCircleCreateUser(Long friendUserId, Long userId) {
		HashMap map = new HashMap();
		map.put("friendId", friendUserId);
		map.put("userId", userId);

		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Circle.selectHasUser", map);
		return (Long) obj;
	}

	public CirclePart findCircleRecommend(Long circleId, Long userId) {
		HashMap map = new HashMap();
		map.put("circleId", circleId);
		map.put("userId", userId);

		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Circle.findCircleRecommend", map);
		return (CirclePart) obj;
	}

	public Object findTopicListCount(HashMap<String, Object> param) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Topic.findTopicListCount", param);
		return obj;
	}

	public Object findHotTopicList(HashMap<String, Object> param) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Topic.findHotTopicList", param);
		return obj;
	}

	public Long createActivityData(Activity activity) {
		Object obj = this.getSqlMapClientTemplate().insert(
				"Activity.insertActivity", activity);
		return (Long) obj;
	}

	public void insertActivityTag(HashMap activitytag) {
		this.getSqlMapClientTemplate().insert("Activity.insertActivityTag",
				activitytag);

	}

	public List<ActivityPart> findTopActivityList(HashMap<String, Object> param) {
		// TODO Auto-generated method stub
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Activity.selectHotActivityList", param);
		return (List<ActivityPart>) obj;
	}

	public Object findTopActivityListCount(HashMap<String, Object> param) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Activity.selectHotActivityListCount", param);
		return obj;
	}

	public Long findHasQrcodeCount(Long activityId, Long userId) {
		HashMap param = new HashMap();
		param.put("activityId", activityId);
		param.put("userId", userId);

		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Activity.findHasQrcodeCount", param);
		return (Long) obj;
	}

	public Long findActivityUserCount(Long activityId, Long userId) {
		HashMap param = new HashMap();
		param.put("activityId", activityId);
		param.put("userId", userId);

		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Activity.findHasAddActivityUser", param);
		return (Long) obj;
	}

	public void insertActivityUser(HashMap activityUser) {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().insert("Activity.insertActivityUser",
				activityUser);
	}

	public Integer generActivityQrcode(HashMap activityUser) {
		int rt = this.getSqlMapClientTemplate().update(
				"Activity.updateActivityUserQrcodePath", activityUser);
		return rt;
	}

	public Activity findActivityById(String activityId) {
		// TODO Auto-generated method stub
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Activity.findActivityById", Long.valueOf(activityId));
		return (Activity) obj;
	}

	public Object findActivityUserList(HashMap param) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Activity.findActivityUserList", param);
		return obj;
	}

	public Object findActivityImage(HashMap param) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Activity.findActivityImageList", param);
		return obj;
	}

	public Object addProductComment(HashMap param) {
		param.put("commentTime", new Date());
		Long id = (Long) this.getSqlMapClientTemplate().insert(
				"Product.addProductComment", param);
		return id;
	}

	public Object selectProductComments(HashMap param) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Product.selectProductComments", param);
		return (List<HashMap>) obj;
	}

	public Object findActivityCircleRelative(Long circleId) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Circle.findCirclePartById", circleId);
		return obj;
	}
	/**
	 * 用户标签关联的活动
	 * @param activityId
	 * @param userId
	 * @param size
	 * @return
	 */
	public Object findActivityRecommend(HashMap param) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Activity.findActivityRecommend", param);
		return obj;
	}

	public Object findActivityComment(HashMap param1) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"ActivityComment.findActivityCommentByActivityId", param1);
		return obj;
	}

	public java.lang.Object addActivityComment(ActivityComment map) {
		Object obj = this.getSqlMapClientTemplate().insert(
				"ActivityComment.addActivityComment", map);
		return obj;
	}

	public Object queryCommentCreatTime(HashMap param) {

		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Product.queryCommentCreatTime", param);
		return obj;
	}

	public HashMap findActivityUserQrcode(Long activityId, Long userId) {
		HashMap map = new HashMap();
		map.put("activityId", activityId);
		map.put("userId", userId);

		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Activity.findActivityUserQrcode", map);
		return (HashMap) obj;
	}

	public int userSignInActivity(HashMap map) {
		Integer rt = this.getSqlMapClientTemplate().update(
				"Activity.userSignInActivity", map);
		return rt;
	}

	public String findActivityUserIsSignIn(Long activityId, Long userId) {
		HashMap map = new HashMap();
		map.put("activityId", activityId);
		map.put("userId", userId);

		Object rt = this.getSqlMapClientTemplate().queryForObject(
				"Activity.findActivityUserIsSignIn", map);
		return (String) rt;
	}

	public ProductCollection findProductCollectionPartById(Long objectId) {
		Object rt = this.getSqlMapClientTemplate().queryForObject(
				"Product.findProductCollectionPartById", objectId);
		return (ProductCollection) rt;
	}

	public List<CirclePart> findCircleRecommendList(
			HashMap<String, Object> param) {
		Object rt = this.getSqlMapClientTemplate().queryForList(
				"Circle.findCircleRecommendList");
		return (List<CirclePart>) rt;
	}

	public List<HashMap> findHeadPageActivity() {
		Object object = this.getSqlMapClientTemplate().queryForList(
				"Activity.findHeadPageActivity");
		return (List<HashMap>) object;
	}

	public Long insertActivityUserAlbum(HashMap param) {
		Object object = this.getSqlMapClientTemplate().insert(
				"Activity.insertActivityUserAlbum", param);
		return (Long) object;
	}

	public void insertUserAlbumPhoto(HashMap map) {
		this.getSqlMapClientTemplate().insert("Activity.insertUserAlbumPhoto",
				map);

	}

	public Long findIsActivityUser(HashMap map) {
		// TODO Auto-generated method stub
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Activity.findIsActivityUser", map);
		return (Long) obj;
	}

	public Object findActivityUserAlbumCount(HashMap map) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Activity.findActivityUserAlbumCount", map);
		return (Long) obj;
	}

	public ActivityPart findActivityPartById(Long objectId) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Activity.findActivityPartById", objectId);
		return (ActivityPart) obj;
	}

	public CirclePart findCirclePartById(Long objectId) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Circle.findCirclePartById", objectId);
		return (CirclePart) obj;
	}

	public List<HashMap> findFirstTagList() {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Tag.findFirstTagList");
		return (List<HashMap>) obj;
	}

	public HashMap findActivityEnrollTime(Long activityId) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Activity.findActivityEnrollTime", activityId);
		return (HashMap) obj;
	}

	public int applyCloseActivity(HashMap activityUser) {
		this.getSqlMapClientTemplate().update("Activity.applyCloseActivity",
				activityUser);
		return 1;
	}

	// company_id as companyId,name,logo,star_score as starScore,company_info as
	// companyInfo
	public HashMap findCommunityCompanyInfo(Long companyId) {
		HashMap obj = (HashMap) this.getSqlMapClientTemplate().queryForObject(
				"Company.findCommunityCompanyInfo", companyId);
		return obj;
	}

	public String findActivityUserStatus(Long userId, Long activityId) {
		HashMap param = new HashMap();
		param.put("userId", userId);
		param.put("activityId", activityId);

		String obj = (String) this.getSqlMapClientTemplate().queryForObject(
				"Activity.findActivityUserStatus", param);
		return obj;
	}

	public Object updateActivityUserStatus(HashMap param) {
		int obj = this.getSqlMapClientTemplate().update(
				"Activity.updateActivityUserStatus", param);
		return obj;
	}

	public Object findActivityImageCount(String activityId) {
		return this.getSqlMapClientTemplate().queryForObject(
				"Activity.findActivityImageCount", activityId);
	}

	public void deletefromactImg(HashMap map) {
		this.getSqlMapClientTemplate().delete("Activity.deleteActivityImage",
				map);
	}

	public Object queryPictureComment(HashMap param) {
		return this.getSqlMapClientTemplate().queryForList(
				"ActivityComment.findActPictureComment", param);
	}

	public String findCircleUserStatus(Long userId, Long circleId) {
		HashMap map = new HashMap();
		map.put("userId", userId);
		map.put("circleId", circleId);

		String obj = (String) this.getSqlMapClientTemplate().queryForObject(
				"Circle.findCircleUserStatus", map);
		return obj;
	}

	public Object updateCircleUserStatus(HashMap activityUser) {
		Object obj = this.getSqlMapClientTemplate().update(
				"Circle.updateCircleUserStatus", activityUser);
		return obj;
	}

	public int applyCloseCircle(HashMap activityUser) {
		Object obj = this.getSqlMapClientTemplate().update(
				"Circle.applyCloseCircle", activityUser);
		return (Integer) obj;
	}

	public Object queryOnePictureComment(String pictComId) {
		Long pid=Long.valueOf(pictComId);
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"ActivityComment.ActivityPictComment",pid);				
		return obj;
	}

	public void addPictureOfActComment(ActivityComment param) {
		this.getSqlMapClientTemplate().insert(
				"ActivityComment.addPictOfActComment",param);
	}

	public List<CirclePart> findCircleRecommendForUser(HashMap map) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Circle.findCircleRecommendForUser", map);
		return (List<CirclePart>) obj;
	}

	public Integer findCircleUserRole(Long userId, Long circleId) {
		HashMap map = new HashMap();
		map.put("userId", userId);
		map.put("circleId", circleId);
		
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Circle.findCircleUserRole", map);
		return (Integer) obj;
	}

	public Object findActCreUserById(String activityId) {
		return this.getSqlMapClientTemplate().queryForObject(
				"Activity.findActCreUserById", activityId);
	}

	public int updateTopicDelete(HashMap param) {
		Object obj= this.getSqlMapClientTemplate().update(
				"Topic.updateTopicDelete", param);
		return (Integer) obj;
	}


	public Long findCircleUserIdByCircleId(Long circleId) {
		Object obj= this.getSqlMapClientTemplate().queryForObject(
				"Circle.findCircleUserIdByCircleId", circleId);
		return (Long) obj;
	}

	public Long findActivityUserId(Long activityId) {
		Object obj= this.getSqlMapClientTemplate().queryForObject(
				"Activity.findActivityUserId", activityId);
		return (Long) obj;
	}

	public int uploadActivityImage(HashMap map) {
		this.getSqlMapClientTemplate().insert(
				"Activity.uploadActivityImage", map);
		return 1;
	}

	public Object finDelectTopicArean(HashMap map) {
		// TODO Auto-generated method stub
		return this.getSqlMapClientTemplate().queryForList(
				"Topic.finDelectTopicArean", map);
	}

	public void insertApplyInfo(HashMap map) {
		// TODO Auto-generated method stub
		 this.getSqlMapClientTemplate().insert(
					"Activity.insertApplyInfo", map);
	}

	public void updateCircleStatus(int status, Object circleId) {
		// TODO Auto-generated method stub
		HashMap map = new HashMap();
		map.put("circleId", circleId);
		map.put("status", status);
		map.put("examineResult", StaticConstant.EXAMINE_RESULT[2]);
		this.getSqlMapClientTemplate().update(
					"Circle.updateCircleStatus", map);
	}

	public int updateTopicTop(HashMap param) {
		int rt = this.getSqlMapClientTemplate().update(
				"Topic.updateTopicTop", param);
		return rt;
	}

	public void updateTopic(Topic topic) {
		// TODO Auto-generated method stub
		 this.getSqlMapClientTemplate().update(
					"Topic.updateTopic", topic);
	}

	public void deleteTopicTags(Long topicId) {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().delete(
				"Topic.deleteTopicTags", topicId);
	}

	public void deleteTopicImages(Long topicId) {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().update(
				"Topic.deleteTopicImages", topicId);
	}

	public List<String> findCircleUserCardImage(Long circleId) {
		return this.getSqlMapClientTemplate().queryForList(
				"Circle.findCircleUserCardImage", circleId);
	}

	public void updateCircle(Circle circle) {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().update(
				"Circle.updateCircle", circle);
	}

	public void deleteCircleTags(Long circleId) {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().delete(
				"Circle.deleteCircleTags", circleId);
	}

	public void deleteCardImages(Long circleId) {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().update(
				"Circle.deleteCardImages", circleId);
	}

	public void updateActivity(Activity activity) {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().update(
				"Activity.updateActivity", activity);
	}

	public void deleteActivityTags(Long activityId) {
		// TODO Auto-generated method stub
		this.getSqlMapClientTemplate().delete(
				"Activity.deleteActivityTags", activityId);
	}

	public Integer findCircleHotNum() {
		return (Integer) this.getSqlMapClientTemplate().queryForObject(
				"Circle.findCircleHotNum");
	}

	public List<CirclePart> findHomeCircleList(HashMap<String, Object> param) {
		List<CirclePart> lsit =  this.getSqlMapClientTemplate().queryForList(
				"Circle.findHomeCircleList",param);
		return (List<CirclePart>)lsit;
	}

	public Object findActivityMapListCount(HashMap<String, Object> param) {
		Object obj =  this.getSqlMapClientTemplate().queryForObject(
				"Activity.findActivityMapListCount",param);
		return obj;
	}

	public List<HashMap> findActivityMapList(HashMap<String, Object> param) {
		List<HashMap> lsit =  this.getSqlMapClientTemplate().queryForList(
				"Activity.findActivityMapList",param);
		return lsit;
	}

	public long findActivityUserImageCount(HashMap map) {
		Long obj =  (Long) this.getSqlMapClientTemplate().queryForObject(
				"Activity.findActivityUserImageCount",map);
		return obj;
	}

	public long findActivityUserRemainUser(Long activityId) {
		// TODO Auto-generated method stub
		Long obj =  (Long) this.getSqlMapClientTemplate().queryForObject(
				"Activity.findActivityUserRemainCount",activityId);
		return obj;

	}

	public Long findCircleUserRemain(Long circleId) {
		
		Object obj =   this.getSqlMapClientTemplate().queryForObject(
						"Circle.findCircleUserRemain",circleId);
		return (Long) obj;
	}

	public List<HashMap> findCircleLevelList() {
		Object obj =   this.getSqlMapClientTemplate().queryForList(
				"Circle.findCircleLevelList");
		return (List<HashMap>) obj;
	}

	public List<TopicPart> findClassicTopTopicList() {
		Object obj =   this.getSqlMapClientTemplate().queryForList(
				"Topic.findClassicTopTopicList");
		return (List<TopicPart>) obj;
	}

	public List<TopicPart> findClassicTopicList(HashMap<String, Object> param1) {
		Object obj =   this.getSqlMapClientTemplate().queryForList(
				"Topic.findClassicTopicList",param1);
		return (List<TopicPart>) obj;
	}

	public List<HashMap> findActivityAndUserTagList(
			HashMap<String, Object> param1) {
		Object obj =   this.getSqlMapClientTemplate().queryForList(
				"Activity.findActivityAndUserTagList",param1);
		return (List<HashMap>) obj;
	}
	
	public List<CirclePart> findCircleRecommend(HashMap<String, Object> param) {
			Object obj =   this.getSqlMapClientTemplate().queryForList(
					"Circle.findCircleRecommendIndex",param);
			return (List<CirclePart>) obj;
	}
	/**
	 * 获取用户相同的标签
	 * @param param1
	 * @return
	 */
	public List<HashMap>  findCircleAndUserTagList(HashMap<String, Object> param1) {
			Object obj =   this.getSqlMapClientTemplate().queryForList(
					"Circle.findCircleAndUserTagList",param1);
			return (List<HashMap>) obj;
	}

	public List<HashMap> findTopicAndUserTagList(HashMap<String, Object> param1) {
		Object obj =   this.getSqlMapClientTemplate().queryForList(
				"Topic.findTopicAndUserTagList",param1);
		return (List<HashMap>) obj;
	}

	public List<TopicPart> findTopicRecommend(HashMap<String, Object> param) {
		Object obj =   this.getSqlMapClientTemplate().queryForList(
				"Topic.findTopicRecommend",param);
		return (List<TopicPart>) obj;
	}

}
