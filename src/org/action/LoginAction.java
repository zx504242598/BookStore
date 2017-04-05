package org.action;

import java.util.Map;

import org.model.User;
import org.service.UserService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
	private String username;
	private String password;
	private UserService userService;
	private String address;
	private String email;
	public void setEmail(String email) {
		this.email = email;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String execute() throws Exception {
		User u=userService.validateUser(username, password);
		if(u!=null){
			Map session=(Map)ActionContext.getContext().getSession();
			session.put("user", u);
			return SUCCESS;
		}
		return ERROR;
	}
	public String updateUser() throws Exception{
		Map session=(Map) ActionContext.getContext().getSession();
		User user=(User)session.get("user");
		user.setPassword(password);
		user.setAddress(address);
		user.setEmail(email);
		userService.updateUser(user);
		session.put("user", user);
		return SUCCESS;
	}
	public String register() throws	Exception{
		User user=new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setAddress(address);
		user.setEmail(email);
		
		if(!userService.findUser(username)){
			userService.registerUser(user);
			System.out.println("µÿ÷∑£∫"+user.getAddress());
			return SUCCESS;
		}
		return ERROR;
	}
	public String logout() throws Exception{
		Map session=ActionContext.getContext().getSession();
		session.remove("user");
		session.remove("cart");
		return SUCCESS;
	}

	
}
