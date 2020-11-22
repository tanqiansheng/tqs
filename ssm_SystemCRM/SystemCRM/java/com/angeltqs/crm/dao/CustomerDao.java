package com.angeltqs.crm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.angeltqs.crm.entity.Customer;

/*
 * 
* <p>Title: CustomerDao</p>  
* <p>Description: </p>  
* @author tqs
* @date 2020-11-8
 */
public interface CustomerDao {
	
	//@Select("select * from tb_customer")
	public List<Customer>  findAll();

	
	/*@Options(useGeneratedKeys=true,keyProperty="customer.cid")
	@Insert("insert into tb_customer (name,country,url,email,fax,other,comment1,comment2,comment3,lastTime)"
			+"values ( #{customer.name},#{customer.country},#{customer.url},#{customer.email},#{customer.fax},#{customer.other},#{customer.comment1},#{customer.comment2}"
			+ ",#{customer.comment3},#{customer.lastTime})")*/
	//public boolean addCustomer(@Param("customer" ) Customer  customer);
	
	public boolean addCustomer(@Param("customer")Customer  customer);
	//修改
	public  boolean updateCustomer(@Param("customer") Customer customer);
	//删除
	public boolean  deleteCustomer(@Param("cid") Integer cid);
	//按id查询
	public Customer findById(@Param("cid") Integer cid);
	//批量添加
	public Integer addCustomers(@Param("customers") List<Customer> customers);
}
