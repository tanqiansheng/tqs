package com.angeltqs.crm.mvc.hander;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.angeltqs.crm.common.util.ResultEntity;
import com.angeltqs.crm.dto.EmployeeDto;
import com.angeltqs.crm.dto.UserDto;
import com.angeltqs.crm.entity.EmployeeEntity;
import com.angeltqs.crm.service.EmployeeService;

@RestController
@RequestMapping("/employee")
public class EmployeeController {
	@Autowired
	EmployeeService employeeService;

	@RequestMapping("list")
	public EmployeeDto findEmployeeAll(int page, int rows,EmployeeEntity employeeEntity) {
		return employeeService.findPageList(page, rows, employeeEntity);
		//list?&page=1&rows=10
	}

	@RequestMapping("add")
	public ResultEntity<EmployeeEntity> addEmployee(EmployeeEntity employee) {
		System.out.println(employee.toString());
		if (employeeService.addEmployee(employee) == 1) {
			return ResultEntity.successWithMessage("添加员工操作 成功！");

		} else {

			return ResultEntity.failedWithDataAndMessage("添加员工操作 失败！", employee);
		}
	}

	@RequestMapping("update")
	public ResultEntity<EmployeeEntity> updateEmployee(EmployeeEntity employee) {

		if (employeeService.updateEmployee(employee) == 1) {

			return ResultEntity.successWithMessage("修改员工操作 成功失败！");
		} else {
			
			return ResultEntity.failedWithDataAndMessage("修改员工操作 失败！", employee);
		}
	}

	@RequestMapping("delete")
	public ResultEntity<String> deleteEmployee(@RequestParam("ids") List<Integer> ids) {
		int employee = employeeService.deleteEmployee(ids);
		if (!(employee == 0)) {
			return ResultEntity.successWithMessage("删除员工操作 成功！");
		} else {
			return ResultEntity.failedWithMeaage("删除员工操作 失败！");
		}
	}
	

}
