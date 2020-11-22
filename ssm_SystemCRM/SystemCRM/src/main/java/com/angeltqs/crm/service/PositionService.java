package com.angeltqs.crm.service;

import java.util.List;

import com.angeltqs.crm.entity.PositionEntity;

public interface PositionService {
	
	 //查找所有记录
	  List<PositionEntity> findList();
}
