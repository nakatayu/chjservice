package com.chj.service;

import java.util.HashMap;
import java.util.List;

public interface ShareManager {


	List<HashMap> findServiceTagListByServiceId(HashMap<String, Object> param1);

	HashMap findServiceDetailByServiceId(Long serviceId);

	List<HashMap> findServiceMoreList(HashMap<String,Object> param);

	void updateServcieSeeCount(Long serviceId);

	List<HashMap> findCooperatorList(Object param);

	HashMap findCooperatorDetailByCompanyId(Long companyId);

	List<HashMap> findCompanyTagList(Long companyId);

	List<HashMap> findCompanyServiceList(Object param);

	void updateCompanyBrowseCount(Long companyId);

	List<HashMap> findServiceMoreListByUserId(HashMap<String,Object> param);

	List<HashMap> findServiceByKeyword(HashMap map);

	List<HashMap> findCompanyByKeyword(HashMap map);

	List<HashMap> findRankByServiceType(Long serviceType);

	List<HashMap> findUserServiceList(HashMap<String, Object> param);

	Object findServiceMoreListCount(HashMap<String, Object> param);
}
