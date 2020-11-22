package com.angeltqs.crm.service;



import com.angeltqs.crm.entity.Customer;
import com.github.pagehelper.PageInfo;

public interface CustomerService {

	PageInfo<Customer> findPageCustomers(Customer cusromer, Integer page, Integer rows);

}
