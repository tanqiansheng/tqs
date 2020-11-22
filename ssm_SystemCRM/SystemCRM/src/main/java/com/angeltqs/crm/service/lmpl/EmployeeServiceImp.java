package com.angeltqs.crm.service.lmpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.angeltqs.crm.dao.EmployeeDao;
import com.angeltqs.crm.dto.EmployeeDto;
import com.angeltqs.crm.entity.EmployeeEntity;
import com.angeltqs.crm.entity.EmployeeEntityExample;
import com.angeltqs.crm.entity.EmployeeEntityExample.Criteria;
import com.angeltqs.crm.service.EmployeeService;
import com.github.pagehelper.PageHelper;

@Service
@Transactional
public class EmployeeServiceImp implements EmployeeService {

	@Autowired
	EmployeeDao employeeDao;

	@Override
	public EmployeeDto findPageList(int pageNum, int pageSize, EmployeeEntity employeeEntity) {
		// 返回的视图层的数据

		EmployeeDto result = null;

		// 分页插件实现
		PageHelper.startPage(pageNum, pageSize);

		// Mybatis自动生成的示例类
		EmployeeEntityExample example = new EmployeeEntityExample();

		// 得到当前页的数据
		List<EmployeeEntity> rows = employeeDao.selectByExample(example);

		// 得到总的记录条数
		Long countNumber = employeeDao.countByExample(example);

		if (rows.size() > 0) {
			result = new EmployeeDto();
			result.setRows(rows);
			result.setTotal(countNumber);
		}

		return result;

	}

	@Override
	public int addEmployee(EmployeeEntity emp) {

		return employeeDao.insert(emp);
	}

	@Override
	public int updateEmployee(EmployeeEntity employ) {

		return employeeDao.updateByPrimaryKey(employ);
	}

	@Override
	public int deleteEmployee(List<Integer> ids) {
		EmployeeEntityExample example = new EmployeeEntityExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmployeeIdIn(ids);
		return employeeDao.deleteByExample(example);

	}

}
