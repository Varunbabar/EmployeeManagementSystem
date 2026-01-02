package com.MainApp.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.MainApp.Entity.Employee;
import com.MainApp.Service.EmployeeService;

import jakarta.servlet.annotation.MultipartConfig;

@Controller
@MultipartConfig
public class EmployeeCrud {
	
	@Autowired
	EmployeeService eService;
	
	@RequestMapping(value = "/Dashboard")
	public String showHome(Model model)
	{
		List<Employee> l = eService.readAll();
		model.addAttribute("le", l);
		return "Home";
	}
	
	@RequestMapping(value = "/add")
	public String processAdd(
	@ModelAttribute Employee e,
	@RequestPart("image") MultipartFile file
	)
	{
		eService.addEmployee(e, file);
		return "redirect:/Dashboard";
	}
	
	
	@RequestMapping(value = "/delete")
	public String processDelete(
	@RequestParam("id") int id
	)
	{
		eService.deleteByid(id);
		return "redirect:/Dashboard";
	}
	
	
	@RequestMapping(value = "/deleteall")
	public String processDeleteAll(@RequestParam("flag") String flag)
	{
		if(flag.equals("Yes"))
		{
			eService.deleteAll();
		}
		return "redirect:/Dashboard";
	}

}
