package com.MainApp.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.MainApp.Entity.Employee;
import com.MainApp.Entity.User;
import com.MainApp.Repository.UserRepository;
import com.MainApp.Service.EmployeeService;
import com.MainApp.Service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class RegisterLoginLogout {

    
	
	@Autowired
	UserService uService;
	@Autowired
	EmployeeService eService;

    
	
	@RequestMapping(value = "/RegistrationPage")
	public String showRegistrationPage()
	{
		return "Registration";
	}

	
	
	@RequestMapping(value = "/register")
	public String processRegister(@ModelAttribute User u, HttpServletRequest req)
	{
		boolean status = uService.saveUser(u);
		HttpSession s = req.getSession();
		if(status)
		{
			s.setAttribute("msg", "Registration Done..please check email And Activate Your Account");
		}
		else
		{
			s.setAttribute("msg", "Failed.. Something went wring.");
		}
		return "redirect:/RegistrationPage";
	}
	
	
	
	@RequestMapping(value = "/LoginPage")
	public String showLogin()
	{
		return "Login";
	}
	  
	
	@RequestMapping(value = "/login")
	public String processLogin(
	@RequestParam("username") String username,
	@RequestParam("password") String password,
	HttpServletRequest req,
	Model model
	)
	{
		String res=uService.checkUser(username, password); 
		HttpSession s = req.getSession();
		if(res.equals("exists"))
		{
			s.setAttribute("token", username);
			List<Employee> l = eService.readAll();
			model.addAttribute("le", l);
			return "Home";
		}
		else
		{
			s.setAttribute("msg", res);
			return "redirect:/LoginPage";
		}
		
	}
	
	
	
	@RequestMapping(value = "/verify") 
	public String processVerify(
	@Param("code") String code,
	HttpServletRequest req
	)
	{
		boolean status = uService.verify(code);
		HttpSession s = req.getSession();
		if(status)
		{
			s.setAttribute("msg", "Your Account Is Verified, Try to Login..");
		}
		else
		{
			s.setAttribute("msg", "Your Account Is Verification Faailed, Something went wrong..");
		}
		return "redirect:/LoginPage";
	}
	
	
	
	
	@RequestMapping(value = "/logout")
	public String processLogout(HttpServletRequest req)
	{
		req.getSession().removeAttribute("token");
		req.getSession().setAttribute("msg", "You Have Logout Successfully");
		return "redirect:/LoginPage";
	}
	
	
	@RequestMapping("/")
	public String root() {
	    return "redirect:/LoginPage";
	}

	
	
	
	
	
	
	
	
	
	
	
	
}
