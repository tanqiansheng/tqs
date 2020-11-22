package com.angeltqs.crm.service.lmpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.angeltqs.crm.dao.DepartmentDao;
import com.angeltqs.crm.entity.DepartmentEntity;
import com.angeltqs.crm.entity.DepartmentEntityExample;
import com.angeltqs.crm.service.DepartmentService;

@Service
@Transactional
public class DepartmentServiceImp  implements DepartmentService{

	@Autowired
	DepartmentDao departmentDao ;
	
	@Override
	public List<DepartmentEntity> findList() {
		
		DepartmentEntityExample example=new DepartmentEntityExample();
		 List<DepartmentEntity> list = departmentDao.selectByExample(example);
		
		return list;
	}

}
