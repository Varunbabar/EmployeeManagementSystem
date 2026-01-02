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

</head>
<body class="bg-light">

<%
String msg=(String)session.getAttribute("msg");
if(msg == null)
{
	msg ="";
}
	
%>



    <div class="container w-50 border rounded-3 shadow-lg" style="margin-top: 7rem;">
        <div class="row rounded-top-3 bg-primary text-white p-3">
            <div class="col-md-12">
                <h1>Please login....</h1>
                <p class="text-white text-center"><%=msg %></p>
            </div>
        </div>
        <form action="login" method="post">
        <div class="row p-3 bg-white">
                <div class="col-md-6">
                    <div>
                            <label for="username" class="form-label">Enter Username</label>
                            <input type="text" name="username" id="username" class="form-control">
                    </div>
                </div>
                <div class="col-md-6">
                    <div>
                            <label for="password" class="form-label">Enter Password</label>
                            <input type="password" name="password" id="password" class="form-control">
                    </div>
                </div>
                <div class="col-md-4 offset-md-5 mt-3 ">
                    <div>
                            <button class="btn btn-success btn-sm">Login</button>
                    </div>
                </div>
            </div>
        </form>
    </div>

  <%
  session.removeAttribute("msg");
  %>  
</body>
</html>