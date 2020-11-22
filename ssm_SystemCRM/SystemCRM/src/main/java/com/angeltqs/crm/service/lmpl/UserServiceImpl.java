package com.angeltqs.crm.service.lmpl;

import java.sql.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.angeltqs.crm.common.util.TqsUtil;
import com.angeltqs.crm.dao.UserDao;
import com.angeltqs.crm.dto.UserDto;
import com.angeltqs.crm.entity.User;
import com.angeltqs.crm.service.UserService;

/*
 * 
* <p>Title: UserServiceImpl</p>  
* <p>Description: </p>  
* @author tqs
* @date 2020年10月12日
 */
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private  UserDao userDao;

	@Override
	public UserDto getPageListUsers(Integer page, Integer rows) {
		List<User> users = userDao.selectPageList(page, rows);

		long countSize = userDao.countBySize();
		UserDto userDto = new UserDto();

		userDto.setTotal(countSize);
		userDto.setRows(users);
		return userDto;

	}

	@Override
	public Boolean addUser(User user) {
		user.setCreateDate(new java.util.Date().toLocaleString());
		return userDao.addUser(user);
	}

	@Override
	public Boolean Update(User user) {
		String createDate = TqsUtil.nowDate();
		user.setCreateDate(createDate);
		return userDao.updateUser(user);
	}

	@Override
	public Boolean deleteUser(Integer uid) {

		return userDao.deleteUser(uid);
	}

	@Override
	public void deleteUsers(Integer[] ids) {
		/* List<Long> idList = NowDate.stringToLongList(ids); */
		userDao.deleteUsers(ids);

	}

	@Override
	public UserDto findByCombination(int i, Integer rows, String keyWord) {
		List<User> users = userDao.findByCombination(i, rows, keyWord);
		Integer total = userDao.countFindByCombination(i, rows, keyWord);
		UserDto userDto = new UserDto();
		userDto.setTotal(total);
		userDto.setRows(users);

		return userDto;
	}

	@Override
	public User login(String user_name, String user_pwd) {

		return userDao.findByuser_nameaAnduser_pwd(user_name, user_pwd);
	}

	/*
	 * List<User> users = userDao.selectPageList(page, rows);
	 * 
	 * long countSize=userDao.countBySize(); UserDto userDto=new UserDto();
	 * 
	 * userDto.setTotal(countSize); userDto.setRows(users); return userDto;
	 */

}
