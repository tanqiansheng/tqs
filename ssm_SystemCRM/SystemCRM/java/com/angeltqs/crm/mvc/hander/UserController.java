package com.angeltqs.crm.mvc.hander;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.angeltqs.crm.dto.UserDto;
import com.angeltqs.crm.entity.User;
import com.angeltqs.crm.service.UserService;
/*
 * 
* <p>Title: UserController</p>  
* <p>Description: </p>  
* @author tqs
* @date 2020年10月12日
 */
@RestController
public class UserController {
	@Autowired
	UserService userService;
	
	@RequestMapping("/getPageUsers")
	@ResponseBody
	public UserDto findPageUsers(@RequestParam("page") Integer page,@RequestParam("rows") Integer rows){
		return  userService.getPageListUsers((page-1)*rows,rows);
	}
	
	@RequestMapping("/user/addUser")
	@ResponseBody
	public  String addUser( User user){
		System.out.println(user);
		userService.addUser(user);
		return  "success";
	}
	
	@RequestMapping("/user/deleteUser")
	@ResponseBody
	public String deleteeUser(@RequestParam("ids[]") Integer[] ids){
		System.out.println(ids);
		 userService.deleteUsers(ids);
		 return  "success";
	}
	@RequestMapping("/user/updateUser")
	public String updateUser( User user){
		  userService.Update(user);
		return  "success";
	}
	//PageBean<Book> pb=bookService.findByCombination(criteria, pc);
	//@RequestParam(value="pageNum", defaultValue="1") Integer pageNum,
	
	@RequestMapping("/user/findByCombination")
	@ResponseBody
	public UserDto findByCombination( @RequestParam("page") Integer page, @RequestParam("rows") Integer rows,@RequestParam(value="keyWord", defaultValue="") String keyWord){
		System.out.println(keyWord);
		return  userService.findByCombination((page-1)*rows,rows,keyWord);
	}
	/*Date date = new Date();
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
	String createTime = format.format(date);*/

}
