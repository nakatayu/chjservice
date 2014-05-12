package com.chj.dao;

import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;


@Repository
public class ShareDao extends BaseDao {
	public List<HashMap> findServiceTagListByServiceId(HashMap<String, Object> param1) {
		Object object = this.getSqlMapClientTemplate()
				.queryForList("Tag.selServiceTagByServiceId",
						param1);

		return (List<HashMap>) object;
	}

	public HashMap findServiceDetailByServiceId(Long serviceId) {
		Object object = this.getSqlMapClientTemplate()
				.queryForObject("Service.selServiceDetailByServiceId",
						serviceId);

		return (HashMap) object;
	}

	public List<HashMap> findServiceMoreList(HashMap<String, Object> param) {
		Object object = this.getSqlMapClientTemplate()
				.queryForList("Service.selServiceMoreListByserviceType",
						param);

		return (List<HashMap>) object;
	}
	public Object findServiceMoreListCount(HashMap<String, Object> param) {
		Object object = this.getSqlMapClientTemplate().queryForObject(
				"Service.selServiceMoreListCountByserviceType",param);
		return  object;
	}
	public void updateServcieSeeCount(Long serviceId) {
		this.getSqlMapClientTemplate()
				.update("Service.updateServcieSeeCount", serviceId);
	}

	public List<HashMap> findCooperatorList(Object param) {
		Object object = this.getSqlMapClientTemplate()
				.queryForList("Company.selCooperatorList", param);

		return (List<HashMap>) object;
	}

	public HashMap findCooperatorDetailByCompanyId(Long companyId) {
		Object object = this.getSqlMapClientTemplate()
				.queryForObject("Company.selCooperatorDetail",
						companyId);

		return (HashMap) object;
	}

	public List<HashMap> findCompanyTagList(Long companyId) {
		Object object = this.getSqlMapClientTemplate()
				.queryForList("Tag.selCompanyLabel", companyId);

		return (List<HashMap>) object;
	}

	public List<HashMap> findCompanyServiceList(Object param) {
		Object object = this.getSqlMapClientTemplate()
				.queryForList("Service.selServiceTop6ListByCompanyId",
						param);

		return (List<HashMap>) object;
	}

	public void updateCompanyBrowseCount(Long companyId) {
		this.getSqlMapClientTemplate()
				.update("Company.updateCompanyBrowseCount", companyId);
	}

	public List<HashMap> findServiceMoreListByUserId(HashMap<String, Object> param) {
		Object object = this.getSqlMapClientTemplate()
				.queryForList("Service.selServiceMoreListByUserId",
						param);

		return (List<HashMap>) object;
	}

	public List<HashMap> findServiceByKeyword(HashMap param) {
		Object object = this.getSqlMapClientTemplate()
				.queryForList("Service.findServiceByKeyword",
						param);

		return (List<HashMap>) object;
	}

	public List<HashMap> findCompanyByKeyword(HashMap param) {
		Object object = this.getSqlMapClientTemplate()
				.queryForList("Service.findCompanyByKeyword",
						param);

		return (List<HashMap>) object;
	}

	public List<HashMap> findRankByServiceType(Long serviceType) {
		Object object=this.getSqlMapClientTemplate().queryForList("Service.findRankByServiceType",serviceType);

		return  (List<HashMap>)object;
	}

	public List<HashMap> findUserServiceList(HashMap<String, Object> param) {
		Object object=this.getSqlMapClientTemplate().queryForList("Service.findUserServiceList",param);
		return  (List<HashMap>)object;
	}

	
}
