package com.chj.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chj.dao.CommonDao;
import com.chj.dao.CommunityDao;
import com.chj.dao.UserDao;
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
import com.chj.entity.UserServer;
import com.chj.service.CommonManager;
import com.chj.service.CommunityManager;
import com.chj.service.UserManager;
import com.chj.util.StaticConstant;
import com.json.JsonLableObject;

@Service
@Transactional
public class CommunityManagerImpl implements CommunityManager {
	@Autowired
	CommunityDao communityDao;

	@Override
	public List<JsonLableObject> findLableList(User user1) {
		// TODO Auto-generated method stub
		// 获取所有二级标签和三级标签
		List<JsonLableObject> rt = new ArrayList<JsonLableObject>();

		List<HashMap> tagSecond = (List<HashMap>) communityDao
				.findLableSecondeList(null);
		for (HashMap lableSec : tagSecond) {
			JsonLableObject temp = new JsonLableObject();
			temp.setTagId((Long) lableSec.get("tagId"));
			temp.setTagName(lableSec.get("tagName").toString());
			temp.setChild(communityDao.findLableThirdList(lableSec.get("tagId"),null));

			rt.add(temp);
		}
		return rt;
	}

	@Override
	public List<CirclePart> findCircleList(HashMap<String, Object> param) {
		// TODO Auto-generated method stub
		return communityDao.findCircleList(param);
	}

	@Override
	public Object findCircleListCount(HashMap<String, Object> param) {
		// TODO Auto-generated method stub
		return communityDao.findCircleListCount(param);
	}

	@Override
	public int addUserCircle(HashMap map) {
		return communityDao.addUserCircle(map);
	}

	@Override
	public Long findCircleUserCount(Long circleId, Long userId) {
		return communityDao.findCircleUserCount(circleId, userId);
	}

	@Override
	public Circle findCircleById(String circleId) {

		return communityDao.findCircleById(circleId);
	}

	@Override
	public Object findCircleUserList(HashMap param) {
		return communityDao.findCircleUserList(param);
	}

	@Override
	public Object findTopicList(HashMap param) {
		return communityDao.findTopicList(param);
	}

	@Override
	public Object findCircleActivityImage(Long circleId) {
		return communityDao.findCircleActivityImage(circleId);
	}

	@Override
	public Long insertCircle(Circle circle, String cardImage
			,String imgChanged) {
		
		Long circleId = null;
		if(circle.getCircleId()!=null){
			circleId = 	circle.getCircleId();
			communityDao.updateCircle(circle);
			if(circle.getParam()!=null && circle.getParam().trim().length()>0 && circle.getParam().split(",").length>0){
				communityDao.deleteCircleTags(circleId);
			} 
			if(imgChanged!=null && imgChanged.equals("1")){
				communityDao.deleteCardImages(circleId);
			}
		}
		else{
			circleId = communityDao.insertCircle(circle);
		}
//		
//		HashMap map = new HashMap();
//		map.put("userId", circle.getUserId());
//		map.put("circleId", circleId);
//		map.put("createTime", new Date());
//		map.put("status", StaticConstant.TRUE);
//		communityDao.insertCircleUser(map);
		
		for (String tagId : circle.getParam().split(",")) {
			if(tagId.trim().length()>0){
				HashMap circletag = new HashMap();
				circletag.put("tagId", Long.valueOf(tagId));
				circletag.put("circleId", circleId);
				circletag.put("addTime", new Date());
				circletag.put("status", StaticConstant.TRUE);
				communityDao.insertCircleTag(circletag);
			}
			
		}
		
		if(imgChanged!=null && imgChanged.equals("1")){
		 JSONArray array = JSONArray.fromObject(cardImage);
			for (int i=0;i<array.size();i++) {
				JSONObject obj = array.getJSONObject(i);
				if(obj.getString("path").trim().length()>0){
					HashMap circletag = new HashMap();
					circletag.put("userId", circle.getUserId());
					circletag.put("circleId", circleId);
					circletag.put("createTime", new Date());
					circletag.put("cardPath", obj.getString("path"));
					communityDao.insertCircleCardImage(circletag);
				}
			}
		}
		
		return circleId;
	}

	@Override
	public Long insertTopic(Topic topic, String tagList, String topicImageList,String imgChanged,
			HttpServletRequest request) {
		Long topicId =null;
		
		if(topic.getTopicId()!=null){
			topicId = topic.getTopicId();
			communityDao.updateTopic(topic);
			if(tagList!=null && tagList.trim().length()>0 && tagList.split(",").length>0){
				communityDao.deleteTopicTags(topicId);
			} 
			if(imgChanged!=null && imgChanged.equals("1")){
				communityDao.deleteTopicImages(topicId);
			}
		}
		else{
			topicId =  communityDao.insertTopic(topic);
		}
		
		for(String tagId : tagList.split(",")){
			if(tagId.trim().length()>0){
			HashMap topictag = new HashMap();
			topictag.put("tagId", Long.valueOf(tagId));
			topictag.put("topicId", topicId);
			topictag.put("createTime", new Date());
			communityDao.insertTopicTag(topictag);
			}
		}
		if(topicImageList!=null){
			for(String path : topicImageList.split("####")){
				if(path.trim().length()>0){
					HashMap topicImage = new HashMap();
					topicImage.put("topicId", topicId);
					topicImage.put("createTime", new Date());
					topicImage.put("filePath", path);
					topicImage.put("fileName", "");
					communityDao.insertTopicImage(topicImage);
				}
				
			}
		}
		
		
		
		return topicId;
	}

	@Override
	public Topic findTopicById(String topicId) {
		// TODO Auto-generated method stub
		return communityDao.findTopicById(topicId);
	}

	@Override
	public List<TopicComment> findTopicComment(HashMap param) {
		return communityDao.findTopicComment(param);
	}

	@Override
	public Object findTopicCommentCount(HashMap param) {
		return communityDao.findTopicCommentCount(param);
	}

	@Override
	public Long addTopicComment(TopicComment map) {
		return communityDao.addTopicComment(map);
	}

	@Override
	public Object findUserInfoById(Long userId) {
		return communityDao.findUserInfoById(userId);
	}

	@Override
	public Object findTopicImageList(String topicId) {
		return communityDao.findTopicImageList(topicId);
	}

	@Override
	public CirclePart findCircleRelative(Long circleId) {
		return communityDao.findCircleRelative(circleId);
	}

	@Override
	public CircleCreateUser findCircleCreateUser(Long userId) {
		return communityDao.findCircleCreateUser(userId);
	}

	@Override
	public Long findCircleCreateUser(Long friendUserId, Long userId) {
		return communityDao.findCircleCreateUser(friendUserId, userId);
	}

	@Override
	public CirclePart findCircleRecommend(Long circleId, Long userId) {
		return communityDao.findCircleRecommend(circleId, userId);
	}

	@Override
	public Object findTopicListCount(HashMap<String, Object> param) {
		return communityDao.findTopicListCount(param);
	}

	@Override
	public Object findHotTopicList(HashMap<String, Object> param) {
		return communityDao.findHotTopicList(param);
	}

	@Override
	public Long createActivityData(Activity activity) {
		Long activityId = null;
		if(activity.getActivityId()!=null){
			activityId=activity.getActivityId();
			communityDao.updateActivity(activity);
			if(activity.getParam()!=null && activity.getParam().trim().length()>0){
				communityDao.deleteActivityTags(activity.getActivityId());
			}
		}
		else{
			activityId = communityDao.createActivityData(activity);
		}
		if(activity.getParam()!=null && activity.getParam().trim().length()>0){
			for (String tagId : activity.getParam().split(",")) {
				if(tagId.trim().length()>0){
					HashMap activitytag = new HashMap();
					activitytag.put("tagId", Long.valueOf(tagId));
					activitytag.put("activityId", activityId);
					activitytag.put("createTime", new Date());
					communityDao.insertActivityTag(activitytag);
				}
				
			}
		}
//		
//		HashMap activityUser = new HashMap();
//		activityUser.put("userId", activity.getCreateUserId());
//		activityUser.put("activityId", activityId);
//		activityUser.put("status", StaticConstant.ACTIVITY_USER_STATUS[1]);
//		activityUser.put("createTime", new Date());
//		communityDao.insertActivityUser(activityUser);
		
		return activityId;
	}

	@Override
	public  List<ActivityPart> findTopActivityList(HashMap<String, Object> param) {
		// TODO Auto-generated method stub
		return communityDao.findTopActivityList(param);
	}

	@Override
	public Object addProductComment(HashMap param) {
		return communityDao.addProductComment(param);
	}

	@Override
	public Object findTopActivityListCount(HashMap<String, Object> param) {
		// TODO Auto-generated method stub
		return communityDao.findTopActivityListCount(param);
	}

	@Override
	public Object selectProductComments(HashMap param) {

		return communityDao.selectProductComments(param);
	}

	@Override
	public Long findHasQrcodeCount(Long activityId, Long userId) {
		// TODO Auto-generated method stub
		return communityDao.findHasQrcodeCount(activityId, userId);
	}

	@Override
	public Long findActivityUserCount(Long activityId, Long userId) {
		// TODO Auto-generated method stub
		return communityDao.findActivityUserCount(activityId, userId);
	}

	@Override
	public void addActivityUser(HashMap<String, Object> param, HashMap cardParam) {

		communityDao.insertActivityUser(param);
		if (cardParam != null && cardParam.get("reason").toString().trim().length()>0) {
			communityDao.insertApplyInfo(cardParam);
		}
	}

	@Override
	public int generActivityQrcode(HashMap activityUser) {
		// TODO Auto-generated method stub
		return communityDao.generActivityQrcode(activityUser);

	}

	@Override
	public Activity findActivityById(String activityId) {
		Activity activity = communityDao.findActivityById(activityId);
		return activity;
	}

	@Override
	public Object findActivityUserList(HashMap param) {
		Object Object = communityDao.findActivityUserList(param);
		return Object;
	}

	@Override
	public Object findActivityImage(HashMap param) {
		Object Object = communityDao.findActivityImage(param);
		return Object;
	}

	@Override
	public CirclePart findActivityCircleRelative(Long circleId) {
		Object Object = communityDao.findActivityCircleRelative(circleId);
		return (CirclePart) Object;
	}

	@Override
	public List<ActivityPart> findActivityRecommend(HashMap param) {
		Object Object = communityDao.findActivityRecommend(param);
		return (List<ActivityPart>) Object;
	}

	@Override
	public List<ActivityComment> findActivityComment(HashMap param1) {
		Object Object = communityDao.findActivityComment(param1);
		return (List<ActivityComment>) Object;
	}

	@Override
	public Long addActivityComment(ActivityComment map) {
		Object Object = communityDao.addActivityComment(map);
		return (Long) Object;
	}

	@Override
	public Object queryCommentCreatTime(HashMap param) {

		return communityDao.queryCommentCreatTime(param);
	}

	@Override
	public HashMap findActivityUserQrcode(Long activityId, Long userId) {
		return communityDao.findActivityUserQrcode(activityId, userId);
	}

	@Override
	public int userSignInActivity(HashMap map) {
		return communityDao.userSignInActivity(map);
	}

	@Override
	public String findActivityUserIsSignIn(Long activityId, Long userId) {
		return communityDao.findActivityUserIsSignIn(activityId, userId);
	}

	@Override
	public ProductCollection findProductCollectionPartById(Long objectId) {
		return communityDao.findProductCollectionPartById(objectId);
	}

	@Override
	public List<CirclePart> findCircleRecommendList(
			HashMap<String, Object> param) {
		return communityDao.findCircleRecommendList(param);
	}

	@Override
	public List<HashMap> findHeadPageActivity() {
		return communityDao.findHeadPageActivity();
	}

	@Override
	public void uploadActivityUserAlbum(HashMap param, String imgList) {
		// TODO Auto-generated method stub
		JSONArray imgArray = JSONArray.fromObject(imgList);
		param.put("filePath", imgArray.getJSONObject(0).getString("path"));
		param.put("fileName", imgArray.getJSONObject(0).getString("name"));

		Long albumId = communityDao.insertActivityUserAlbum(param);
		for (int i = 0; i < imgArray.size(); i++) {
			JSONObject obj = imgArray.getJSONObject(i);
			HashMap map = new HashMap();
			map.put("activityAlbumId", albumId);
			map.put("uploadUserId", param.get("userId"));
			map.put("uploadTime", new Date());
			map.put("fileName", obj.getString("name"));
			map.put("filePath", obj.getString("path"));

			communityDao.insertUserAlbumPhoto(map);
		}
	}

	@Override
	public Long findIsActivityUser(Long activityId, Long userId) {
		// TODO Auto-generated method stub
		HashMap map = new HashMap();
		map.put("activityId", activityId);
		map.put("userId", userId);
		return communityDao.findIsActivityUser(map);
	}

	@Override
	public Object findActivityUserAlbumCount(Long activityId, Long userId) {
		// TODO Auto-generated method stub
		HashMap map = new HashMap();
		map.put("activityId", activityId);
		map.put("userId", userId);
		return communityDao.findActivityUserAlbumCount(map);
	}

	@Override
	public ActivityPart findActivityPartById(Long objectId) {

		return communityDao.findActivityPartById(objectId);
	}

	@Override
	public CirclePart findCirclePartById(Long objectId) {
		return communityDao.findCirclePartById(objectId);
	}

	@Override
	public List<HashMap> findAllTagList(User user1) {

		List<HashMap> firstTag = communityDao.findFirstTagList();
		for (HashMap first : firstTag) {
			List<HashMap> secondList = communityDao.findLableSecondeList(first
					.get("tagId"));
			for (HashMap second : secondList) {
				second.put("child",
						communityDao.findLableThirdList(second.get("tagId"),user1==null?null:user1.getUserId()));
			}
			first.put("child", secondList);

		}

		return firstTag;
	}

	@Override
	public HashMap findActivityEnrollTime(Long activityId) {
		// TODO Auto-generated method stub
		return communityDao.findActivityEnrollTime(activityId);
	}

	@Override
	public int applyCloseActivity(HashMap activityUser) {
		return communityDao.applyCloseActivity(activityUser);
	}

	@Override
	public HashMap findCommunityCompanyInfo(Long companyId) {
		return communityDao.findCommunityCompanyInfo(companyId);
	}

	@Override
	public String findActivityUserStatus(Long userId, Long activityId) {
		return communityDao.findActivityUserStatus(userId, activityId);
	}

	@Override
	public void updateActivityUserStatus(HashMap param, HashMap cardParam) {
		communityDao.updateActivityUserStatus(param);
		if (cardParam != null && cardParam.get("reason").toString().trim().length()>0) {
			communityDao.insertApplyInfo(cardParam);
		}
	}

	@Override
	public Object findActivityImageCount(String activityId) {

		return communityDao.findActivityImageCount(activityId);
	}

	@Override
	public void deletefromactImg(String activityImage, Long userId) {
		String[] imageId = activityImage.split(",");
		if (imageId.length > 0) {
			for (String mid : imageId) {
				HashMap map = new HashMap();
				map.put("activityPhotoId", mid);
				if (userId != null) {
					map.put("userId", userId);
				}
				communityDao.deletefromactImg(map);
			}
		}
	}

	@Override
	public Object queryPictureComment(HashMap param) {

		return communityDao.queryPictureComment(param);
	}

	@Override
	public String findCircleUserStatus(Long userId, Long circleId) {
		return communityDao.findCircleUserStatus(userId, circleId);
	}

	@Override
	public void updateCircleUserStatus(HashMap activityUser) {
		communityDao.updateCircleUserStatus(activityUser);
	}

	@Override
	public int applyCloseCircle(HashMap activityUser) {
		// TODO Auto-generated method stub
		return communityDao.applyCloseCircle(activityUser);
	}

	@Override
	public Object queryOnePictureComment(String pictComId) {
		// TODO Auto-generated method stub
		return communityDao.queryOnePictureComment(pictComId);
	}

	@Override
	public void addPictureOfActComment(ActivityComment param) {
		// TODO Auto-generated method stub
		communityDao.addPictureOfActComment(param);
	}

	@Override
	public List<CirclePart> findCircleRecommendForUser(HashMap map) {
		return communityDao.findCircleRecommendForUser(map);
	}

	@Override
	public Integer findCircleUserRole(Long userId, Long circleId) {
		return communityDao.findCircleUserRole(userId, circleId);
	}

	@Override
	public Object findActCreUserById(String activityId) {
		return communityDao.findActCreUserById(activityId);
	}

	@Override
	public int updateTopicDelete(HashMap param) {
		// TODO Auto-generated method stub
		return communityDao.updateTopicDelete(param);
	}

	@Override
	public Long findCircleUserIdByCircleId(Long circleId) {
		return communityDao.findCircleUserIdByCircleId(circleId);
	}

	@Override
	public Long findActivityUserId(Long activityId) {
		return communityDao.findActivityUserId(activityId);
	}

	@Override
	public int uploadActivityImage(HashMap map) {
		return communityDao.uploadActivityImage(map);
	}

	@Override
	public Object finDelectTopicArean(HashMap map) {
		// TODO Auto-generated method stub
		return communityDao.finDelectTopicArean(map);
	}

	@Override
	public int uploadPersonnalApplyCard(HashMap map, String type) {
		if (type.equals("1")) {// 圈子升级
			communityDao.updateCircleStatus(StaticConstant.CIRCLE_STATUS[2],
					map.get("objectId"));
		}

		communityDao.insertApplyInfo(map);
		return 1;
	}

	@Override
	public int updateTopicTop(HashMap param) {
		// TODO Auto-generated method stub
		return communityDao.updateTopicTop(param);
	}

	@Override
	public List<String> findCircleUserCardImage(Long circleId) {
		return communityDao.findCircleUserCardImage(circleId);
	}

	@Override
	public Integer findCircleHotNum() {
		return communityDao.findCircleHotNum();
	}

	@Override
	public List<CirclePart> findHomeCircleList(HashMap<String, Object> param) {
		return communityDao.findHomeCircleList(param);
	}

	@Override
	public List<HashMap> findActivityMapList(HashMap<String, Object> param) {
		// TODO Auto-generated method stub
		return communityDao.findActivityMapList(param);
	}

	@Override
	public Object findActivityMapListCount(HashMap<String, Object> param) {
		// TODO Auto-generated method stub
		return communityDao.findActivityMapListCount(param);
	}

	@Override
	public long findActivityUserImageCount(HashMap map) {
		return communityDao.findActivityUserImageCount(map);
	}

	@Override
	public long findActivityRemainUser(Long activityId) {
		// TODO Auto-generated method stub
		return communityDao.findActivityUserRemainUser(activityId);
	}

	@Override
	public Long findCircleUserRemain(Long circleId) {
		return communityDao.findCircleUserRemain(circleId);
	}

	@Override
	public List<HashMap> findCircleLevelList() {
		return communityDao.findCircleLevelList();
	}

	@Override
	public List<TopicPart> findClassicTopTopicList() {
		// TODO Auto-generated method stub
		return communityDao.findClassicTopTopicList();
	}

	@Override
	public List<TopicPart> findClassicTopicList(HashMap<String, Object> param1) {
		// TODO Auto-generated method stub
		return communityDao.findClassicTopicList(param1);
	}

	@Override
	public List<HashMap> findActivityAndUserTagList(
			HashMap<String, Object> param1) {
		return communityDao.findActivityAndUserTagList(param1);
	}

	@Override
	public List<CirclePart> findCircleRecommend(HashMap<String, Object> param) {
		// TODO Auto-generated method stub
		return communityDao.findCircleRecommend(param);
	}

	@Override
	public List<HashMap>  findCircleAndUserTagList(HashMap<String, Object> param1) {
		// TODO Auto-generated method stub
		return communityDao.findCircleAndUserTagList(param1);
	}

	@Override
	public List<HashMap> findTopicAndUserTagList(HashMap<String, Object> param1) {
		// TODO Auto-generated method stub
		return communityDao.findTopicAndUserTagList(param1);
	}

	@Override
	public List<TopicPart> findTopicRecommend(HashMap<String, Object> param) {
		// TODO Auto-generated method stub
		return communityDao.findTopicRecommend(param);
	}

}
