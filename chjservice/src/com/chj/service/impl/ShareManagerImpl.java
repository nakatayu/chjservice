package com.chj.service.impl;

import com.chj.dao.ShareDao;
import com.chj.service.ShareManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.util.HashMap;
import java.util.List;

@Service
@Transactional
public class ShareManagerImpl implements ShareManager {
	@Autowired
	ShareDao shareDao;

	@Override
	public void updateCompanyBrowseCount(Long companyId){
		shareDao.updateCompanyBrowseCount(companyId);
	}

	@Override
	public List<HashMap> findServiceMoreList(HashMap<String,Object> param){
		return shareDao.findServiceMoreList(param);
	}
	@Override
	public List<HashMap> findServiceMoreListByUserId(HashMap<String,Object> param){
		return shareDao.findServiceMoreListByUserId(param);
	}

	@Override
	public List<HashMap> findServiceTagListByServiceId(HashMap<String, Object> param1){
		return shareDao.findServiceTagListByServiceId(param1);
	}
	@Override
	public HashMap findServiceDetailByServiceId(Long serviceId){
		return shareDao.findServiceDetailByServiceId(serviceId);
	}

	@Override
	public  void updateServcieSeeCount(Long serviceId){
		 shareDao.updateServcieSeeCount(serviceId);
	}

	@Override
	public List<HashMap> findCooperatorList(Object param){
		return shareDao.findCooperatorList(param);
	}


	@Override
	public HashMap findCooperatorDetailByCompanyId(Long companyId){
		return shareDao.findCooperatorDetailByCompanyId(companyId);
	}



	@Override
	public List<HashMap> findCompanyTagList(Long companyId){
		return shareDao.findCompanyTagList(companyId);
	}

	@Override
	public List<HashMap> findCompanyServiceList(Object param){
		return shareDao.findCompanyServiceList(param);
	}

	@Override
	public List<HashMap> findServiceByKeyword(HashMap map) {
		return shareDao.findServiceByKeyword(map);
	}

	@Override
	public List<HashMap> findCompanyByKeyword(HashMap map) {
		return shareDao.findCompanyByKeyword(map);
	}

	@Override
	public List<HashMap> findRankByServiceType(Long serviceType){
		return shareDao.findRankByServiceType(serviceType);
	}
	@Override
	public List<HashMap> findUserServiceList(HashMap<String, Object> param) {
		// TODO Auto-generated method stub
		return shareDao.findUserServiceList(param);
	}

	@Override
	public Object findServiceMoreListCount(HashMap<String, Object> param) {
		// TODO Auto-generated method stub
		return shareDao.findServiceMoreListCount(param);
	}

}
