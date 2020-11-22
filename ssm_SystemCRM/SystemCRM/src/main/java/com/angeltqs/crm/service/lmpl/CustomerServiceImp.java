package com.angeltqs.crm.service.lmpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.angeltqs.crm.dao.CustomerMapper;
import com.angeltqs.crm.entity.Customer;
import com.angeltqs.crm.entity.CustomerExample;
import com.angeltqs.crm.entity.CustomerExample.Criteria;
import com.angeltqs.crm.service.CustomerService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
@Transactional
public class CustomerServiceImp implements CustomerService {
	@Autowired CustomerMapper customerMapper;

	@Override
	public PageInfo<Customer> findPageCustomers(Customer cusromer, Integer page, Integer rows) {
	        PageHelper.startPage(page, rows);
	        CustomerExample example = new CustomerExample();
			/* Criteria createCriteria = example.createCriteria(); */
	        List<Customer> list = customerMapper.selectByExample(example);
	        System.out.println(list);
	        PageInfo<Customer> pageInfo = new PageInfo<>(list);

	        return pageInfo;
	}
	
}
