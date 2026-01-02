package com.MainApp.Service;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.MainApp.Entity.Employee;
import com.MainApp.Repository.EmployeeRepository;

@Service
public class EmployeeService
{

	@Autowired
	EmployeeRepository eRepo;

	public void addEmployee(Employee e, MultipartFile file)
	{
		String imageName = file.getOriginalFilename();
		e.setImageName(imageName);
		eRepo.save(e);

		FileOutputStream fos=null;
		InputStream is=null;
		try 
		{
			String path = "C:\\Users\\Satyajit\\Desktop\\spring boot\\EmployeeManagementSystem\\src\\main\\webapp\\images\\"+imageName;
			fos = new FileOutputStream(path);
			
			is = file.getInputStream();
			
			byte[] b = is.readAllBytes();
			
			fos.write(b);
			
		}
		catch (Exception ex) 
		{
			System.out.println(ex);
		} 
		finally
		{
			try
			{
				fos.close();
				is.close();
			}
			catch (Exception ex) 
			{
				System.out.println(ex);
			}
		}
	}

	
	
	
	public List<Employee> readAll()
	{
		return eRepo.findAll();
	}
	
	
	
	
	public void deleteByid(int id)
	{
		eRepo.deleteById(id);
	}
	
	
	
	public void deleteAll()
	{
		eRepo.deleteAll();
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
