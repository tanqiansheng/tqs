package cn.angeltqs.crm.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.angeltqs.crm.common.util.TqsUtil;
import com.angeltqs.crm.dao.UserDao;
import com.angeltqs.crm.entity.User;

public class TestUserDao extends BaseTest {
	
	@Autowired
	UserDao userDao;
	
	@Test
	public void testFindAll(){
		 List<User> users = userDao.findAll();
		 for(User u:users){
			 System.out.println(u);
		 }
	}
	
	
	
	@Test
	public void testInsert(){
		User user=new User();

		System.out.println(userDao.addUser(user));
		
		
	}
	
	@Test
	public void testUpdateUser(){
		User u=new User();
		u.setUid(1);

		userDao.updateUser(u);
	}
	
	@Test
	public void testDeleteUser(){
		System.out.println(userDao.deleteUser(7));
	}
	@Test
	public void testSeleceById(){
		System.err.println(userDao.selecteByID(6));
	}
	
	@Test
	public void testAddUsers(){
		List<User> users=new ArrayList<>();
		for(int i =0;i<200;i++){
			User u=new User();
			if(i%2==0){
				
				u.setDepId(1);
				u.setEmployeeId(1);
				u.setUserName("马尔扎哈"+i);
				u.setUserPwd("123456");
				u.setStatus(Byte.valueOf("1"));
			
				users.add(u);
				u.setCreateDate(TqsUtil.nowDate());
				
			}
			if(i%3==0){	
				u.setDepId(1);
				u.setEmployeeId(1);
				u.setUserName("古力娜扎"+i);
				u.setUserPwd("123456");
				u.setStatus(Byte.valueOf("1"));
				u.setCreateDate(TqsUtil.nowDate());
				users.add(u);
				
				
			}else{
				u.setDepId(1);
				u.setEmployeeId(1);
				u.setUserName("迪丽热巴"+i);
				u.setUserPwd("123456");
				u.setStatus(Byte.valueOf("1"));
				u.setCreateDate(TqsUtil.nowDate());
				users.add(u);
				
			}
			
		}
		System.out.println(userDao.addUsers(users));
		
	}
	@Test
	public void testpage(){
		//System.out.println(userDao.selectPageList(0, 10));
		//System.out.println(userDao.countBySize());
		System.out.println(TqsUtil.nowDate());
		
		System.out.println(TqsUtil.stringToLongList("1,2,3"));
		User us=new User();
		us.setStatus(Byte.valueOf("1"));
	}
	@Test
	public  void aa() {
		System.out.println(userDao.findByuser_nameaAnduser_pwd("谭茜升", "123"));
	
	}
	
}
