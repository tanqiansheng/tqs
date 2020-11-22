package com.angeltqs.crm.mvc.hander;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.angeltqs.crm.entity.Customer;
import com.angeltqs.crm.service.CustomerService;
import com.github.pagehelper.PageInfo;

@RestController
@RequestMapping("/customer")

public class CustomerHander {
	@Autowired CustomerService customerService;
	
	
	@RequestMapping("/list")
    public Map<String, Object> bookList(Customer cusromer, Integer page, Integer rows) {

        PageInfo<Customer> pageInfo = customerService.findPageCustomers(cusromer, page, rows);

        Map<String, Object> result = new HashMap<>();

        result.put("total", pageInfo.getTotal());//总条数

        result.put("rows", pageInfo.getList());//返回的list数据

        return result;

    }
	
	
	
	
}
