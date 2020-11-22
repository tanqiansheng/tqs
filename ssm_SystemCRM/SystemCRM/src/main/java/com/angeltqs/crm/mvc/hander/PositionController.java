package com.angeltqs.crm.mvc.hander;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.angeltqs.crm.entity.PositionEntity;
import com.angeltqs.crm.service.PositionService;

@Controller
@RequestMapping(value = "/position")
public class PositionController {

	@Autowired
	PositionService positionService;

	@RequestMapping(value="list")
	@ResponseBody
	public List<PositionEntity> findList() {
		
		List<PositionEntity> list = positionService.findList();

		return list;
	}

}
