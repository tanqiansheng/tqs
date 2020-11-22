
 package cn.angeltqs.crm.dao;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.angeltqs.crm.dao.CustomerMapper;
import com.angeltqs.crm.entity.Customer;
import com.angeltqs.crm.service.CustomerService;
import com.angeltqs.crm.service.EmployeeService;
import com.angeltqs.crm.service.lmpl.CustomerServiceImp;
import com.github.pagehelper.PageInfo;

public class TestCustomerDao extends BaseTest{
  
  @Autowired CustomerService customerService;
  @Autowired EmployeeService employeeService;
  
  @Test
  public void test() {
	   PageInfo<Customer> findPageCustomers = customerService.findPageCustomers(null, 1, 5);
	  //employeeService.findPageList(1, 5, null);
	  
		 
  }
  
 }
  
 