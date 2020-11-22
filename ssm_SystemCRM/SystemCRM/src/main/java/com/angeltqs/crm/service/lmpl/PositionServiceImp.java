package com.angeltqs.crm.service.lmpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.angeltqs.crm.dao.PositionDao;
import com.angeltqs.crm.entity.PositionEntity;
import com.angeltqs.crm.entity.PositionEntityExample;
import com.angeltqs.crm.service.PositionService;


@Service
@Transactional
public class PositionServiceImp implements PositionService {

	@Autowired
	PositionDao  positionDao;
	
	@Override
	public List<PositionEntity> findList() {
		
		PositionEntityExample example=new PositionEntityExample();
		 List<PositionEntity> result = positionDao.selectByExample(example);		
		
		return result;
	}
	
	

}
