package com.angeltqs.crm.mvc.hander;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.angeltqs.crm.entity.DepartmentEntity;
import com.angeltqs.crm.service.DepartmentService;

@Controller
@RequestMapping(value = "/department")
public class DepartmentController {

	@Autowired
	DepartmentService departmentService;

	@RequestMapping(value = "list")
	@ResponseBody
	public List<DepartmentEntity> findDepartmentList() {

		List<DepartmentEntity> list = departmentService.findList();
		return list;
	}
}
