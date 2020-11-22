package com.angeltqs.crm.service;
import com.angeltqs.crm.dto.UserDto;
import com.angeltqs.crm.entity.User;
/*
 * 
* <p>Title: UserService</p>  
* <p>Description: </p>  
* @author tqs
* @date 2020年10月12日
 */
public interface UserService {

	UserDto getPageListUsers(Integer page, Integer rows);

	Boolean addUser(User user);

	Boolean Update(User user);

	Boolean deleteUser(Integer uid);

	void deleteUsers(Integer[] ids);

	UserDto findByCombination(int i, Integer rows, String keyWord);

	User login(String user_name, String user_pwd);

}
