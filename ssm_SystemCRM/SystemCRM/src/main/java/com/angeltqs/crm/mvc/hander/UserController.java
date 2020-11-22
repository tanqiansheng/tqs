package com.angeltqs.crm.mvc.hander;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.angeltqs.crm.common.util.ResultEntity;
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
@Controller
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
	public  ResultEntity<User> addUser( User user){
		 try {
				userService.addUser(user);
			} catch (Exception e) {
				return ResultEntity.failedWithDataAndMessage(e.getMessage(),user);
			}
		return  ResultEntity.successWithoutData();
	}
	
	@RequestMapping("/user/deleteUser")
	@ResponseBody
	public ResultEntity<Integer[]> deleteeUser(@RequestParam("ids[]") Integer[] ids){
		
		 try {
			userService.deleteUsers(ids);
		} catch (Exception e) {
			return ResultEntity.failedWithDataAndMessage(e.getMessage(),ids);
		}
		return ResultEntity.successWithoutData();
	}
	@RequestMapping("/user/updateUser")
	public ResultEntity<User> updateUser( User user){
		 try {
			 userService.Update(user);
			} catch (Exception e) {
				return ResultEntity.failedWithDataAndMessage(e.getMessage(),user);
			}
			return ResultEntity.successWithoutData();
	}
	//PageBean<Book> pb=bookService.findByCombination(criteria, pc);
	//@RequestParam(value="pageNum", defaultValue="1") Integer pageNum,
	
	@RequestMapping("/user/findByCombination")
	@ResponseBody
	public UserDto findByCombination( @RequestParam("page") Integer page, @RequestParam("rows") Integer rows,@RequestParam(value="keyWord", defaultValue="") String keyWord){
		return  userService.findByCombination((page-1)*rows,rows,keyWord);
	}
	
	//登录
	@RequestMapping("/user/login")
	public String login(@RequestParam("user_name")String user_name,@RequestParam("user_pwd")String user_pwd ,HttpSession session) {
		//ModelAndView modelAndView= new ModelAndView("/admin.html");
		User user=null;
		user=userService.login(user_name,user_pwd);
		if(user==null) {
			//return modelAndView.addObject("ResultEntity",ResultEntity.failedWithDataAndMessage("账号或者密码错误", user));
			return "redirect:/login.html";
		}
		session.setAttribute("user", user);
		System.out.println("登录成功");
		return "admin.html";
	
		//return modelAndView.addObject("ResultEntity",ResultEntity.successWithData(user));
	}
	
	
}
