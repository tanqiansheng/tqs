package com.angeltqs.crm.service;

import java.util.List;

import com.angeltqs.crm.dto.EmployeeDto;
import com.angeltqs.crm.dto.UserDto;
import com.angeltqs.crm.entity.EmployeeEntity;

public interface EmployeeService {

	// 分页查找
	public EmployeeDto findPageList(int pageNum, int pageSize,EmployeeEntity employeeEntity);

	// 添加用户
	public int addEmployee(EmployeeEntity employ);

	// 修改用户
	public int updateEmployee(EmployeeEntity employ);

	public int deleteEmployee(List<Integer> ids);
}
