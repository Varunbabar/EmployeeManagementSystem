
<%@page import="com.MainApp.Entity.Employee"%>
<%@page import="java.util.List"%>
<%@page import="com.MainApp.Service.EmployeeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.0/css/all.min.css"
	integrity="sha512-DxV+EoADOkOygM4IR9yXP8Sb2qwgidEmeqAEmDKIOfPRQZOWbXCzLC6vjbZyy0vPisbH2SyW27+ddLVCN+OMzQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

	<%
	String token = (String) session.getAttribute("token");
	if (token != null) {
	%>



	<!-- start of navbar -->

	<nav class="navbar navbar-expand-lg bg-success">
		<div class="container-fluid">
			<h1 class="text-white"><%=token%></h1>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a
						class="ms-5 btn btn-outline-light btn-sm" aria-current="page"
						href="logout">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!--  end of navbar -->







	<div class="container mt-5">
		<div class="row">
			<div class="col-md-3">
				<div>
					<button class="btn btn-success rounded-0" data-bs-toggle="modal" data-bs-target="#add">
						<i class="fa-solid fa-plus" style="color: #ffffff;"></i>
						Add Employee
					</button>
				</div>
			</div>
			<div class="col-md-3">
				<div>
					<button class="btn btn-success rounded-0">
						<i class="fa-solid fa-pen-to-square" style="color: #ffffff;"></i>
						Update Employee
					</button>
				</div>
			</div>
			<div class="col-md-3">
				<div>
					<button class="btn btn-success rounded-0" data-bs-toggle="modal" data-bs-target="#delete">
						<i class="fa-solid fa-trash" style="color: #ffffff;"></i>
						Delete Employee
					</button>
				</div>
			</div>
			<div class="col-md-3">
				<div>
					<button class="btn btn-success rounded-0" data-bs-toggle="modal" data-bs-target="#deleteall">
						<i class="fa-solid fa-trash" style="color: #ffffff;"></i>
						Delete All Employees
					</button>
				</div>
			</div>
		</div>
	</div>




<%

List<Employee> l=(List<Employee>) request.getAttribute("le");
%>




<div class="mt-5 text-center">
	<table class="table table-bordered table-striped">
		<thead class="table-success">
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Email</th>
				<th>Phone</th>
				<th>Gender</th>
				<th>Designation</th>
				<th>Department</th>
				<th>Image</th>
				<th>Salary</th>
				<th>Date of Joining</th>
				<th>Current Project</th>
			</tr>
		</thead>
		<tbody>
		<%
		if(l  != null)
		{
			for(Employee e:l)
			{
				%>
				<tr>
					<td><%=e.getId() %></td>
					<td><%=e.getName() %></td>
					<td><%=e.getEmail() %></td>
					<td><%=e.getPhone() %></td>
					<td><%=e.getGender() %></td>
					<td><%=e.getDesignation() %></td>
					<td><%=e.getDepartment() %></td>
					<td>	
						<img class="w-100 rounded-3" alt="loading.." src="/images/<%=e.getImageName() %>">
					</td>
					<td><%=e.getSalary() %></td>
					<td><%=e.getDate()%></td>
					<td><%=e.getProject() %></td>
				</tr>
				<% 
			}
		}
		else
		{
			%>
				<tr>
					<td class="text-center" colspan="11">Information not found</td>
				</tr>
			<% 
		}
		%>
		</tbody>
	</table>
</div>







<script type="text/javascript">

const myModal = document.getElementById('myModal')
const myInput = document.getElementById('myInput')

myModal.addEventListener('shown.bs.modal', () => {
  myInput.focus()
})

</script>



<!-- Modal for add employee -->
<div class="modal fade" id="add" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5 text-success" id="exampleModalLabel">Add Employee Information</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        	 <div class="container p-3">
		        <form action="add" method="post" enctype="multipart/form-data">
		            <div class="row g-3">
		            <div class="col-md-6">
		                <div>
		                    <label for="name" class="form-label form-label-sm">Employee Name</label>
		                    <input type="text" name="name" id="name" class="form-control form-control-sm">
		                </div>
		            </div>
		            <div class="col-md-6">
		                <div>
		                    <label for="email" class="form-label form-label-sm">Email</label>
		                    <input type="email" name="email" id="email" class="form-control form-control-sm">
		                </div>
		            </div>
		            <div class="col-md-6">
		                <div>
		                    <label for="phone" class="form-label form-label-sm">Phone</label>
		                    <input type="text" name="phone" id="phone" class="form-control form-control-sm">
		                </div>
		            </div>
		            <div class="col-md-6">
		                <div>
		                    <label for="gender" class="form-label form-label-sm">Select Gender</label>
		                    <select name="gender" id="gender" class="form-select">
		                        <option value="male">Male</option>
		                        <option value="female">Female</option>
		                    </select> 
		                </div>
		            </div>
		            <div class="col-md-6">
		                <div>
		                    <label for="designation" class="form-label form-label-sm">Designation</label>
		                    <input type="text" name="designation" id="designation" class="form-control form-control-sm">
		                </div>
		            </div>
		            <div class="col-md-6">
		                <div>
		                    <label for="department" class="form-label form-label-sm">Department</label>
		                    <input type="text" name="department" id="department" class="form-control form-control-sm">
		                </div>
		            </div>
		            <div class="col-md-6">
		                <div>
		                    <label for="image" class="form-label form-label-sm">Image</label>
		                    <input type="file" name="image" id="image" class="form-control form-control-sm">
		                </div>
		            </div>
		            <div class="col-md-6">
		                <div>
		                    <label for="salary" class="form-label form-label-sm">Salary</label>
		                    <input type="text" name="salary" id="salary" class="form-control form-control-sm">
		                </div>
		            </div>
		            <div class="col-md-6">
		                <div>
		                    <label for="date" class="form-label form-label-sm">Date Of Joining</label>
		                    <input type="date" name="date" id="date" class="form-control form-control-sm">
		                </div>
		            </div>
		            <div class="col-md-6">
		                <div>
		                    <label for="project" class="form-label form-label-sm">Current Project</label>
		                    <input type="text" name="project" id="project" class="form-control form-control-sm">
		                </div>
		            </div>
		            <div class="col-md-6 offset-md-5">
		                <div>
		                    <button class="btn btn-success btn-sm" data-bs-dismiss="modal">Add</button>
		                </div>
		            </div>
		        </div>
		        </form>
   		 </div>
    
      </div>
    </div>
  </div>
</div>



<!-- Modal for delete employee -->
<div class="modal fade" id="delete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5 text-danger" id="exampleModalLabel">Delete Employee Information</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        	 <div class="container p-3">
		        <form action="delete" method="post">
		            <div class="row g-3">
		            <div class="col-md-6">
		                <div>
		                    <label for="id" class="form-label form-label-sm">Employee ID</label>
		                    <input type="text" name="id" id="id" class="form-control form-control-sm">
		                </div>
		            </div>
		            
		            <div class="col-md-6 offset-md-5">
		                <div>
		                    <button class="btn btn-danger" data-bs-dismiss="modal">Delete</button>
		                </div>
		            </div>
		        </div>
		        </form>
   		 </div>
    
      </div>
    </div>
  </div>
</div>




<!-- Modal for delete All employee -->
<div class="modal fade" id="deleteall" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5 text-danger" id="exampleModalLabel">Delete All Employee Information</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        	 <div class="container p-3">
		        <form action="deleteall" method="post">
		            <div class="row g-3">
		            <div class="col-md-6">
		                <div>
		                    <label for="flag" class="form-label form-label-sm">Type "Yes" For Confirmation</label>
		                    <input type="text" name="flag" id="flag" class="form-control form-control-sm">
		                </div>
		            </div>
		            
		            <div class="col-md-2 offset-md-5">
		                <div>
		                    <button class="btn btn-danger" data-bs-dismiss="modal">Delete All Employees</button>
		                </div>
		            </div>
		        </div>
		        </form>
   		 </div>
    
      </div>
    </div>
  </div>
</div>



































	<%
	} else {
	session.setAttribute("msg", "First Login Then try to Access Home page..");
	response.sendRedirect("Login.jsp");
	}
	%>

</body>
</html>