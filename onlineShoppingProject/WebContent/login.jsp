<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
	<style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      margin: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    form {
      background-color: #fff;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      width: 300px;
    }

    h2 {
      text-align: center;
      margin-bottom: 20px;
    }

    input {
      display: block;
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    input[type="submit"] {
      background-color: #4CAF50;
      color: white;
      cursor: pointer;
    }

    input[type="submit"]:hover {
      background-color: #45a049;
    }
  </style>
	
</head>
<body>
 
 	<form action="loginAction.jsp" method="post">
	 	<input type="email" name="email" placeholder="Enter email ID" required>
	 	<input type ="password" name="password" placeholder="Enter password" required>
	 	<input type="submit" value="Login">
	 <h3>if not register<a href="signup.jsp">Click here</a></h3>
	  <h3>for forgot password<a href="forgatePassword.jsp">Click here</a></h3>
	</form>
	<%
		String msg = request.getParameter("msg");
		if("notexist".equals(msg)){
	%>
	<script type="text/javascript">
        alert("incorrect username and password");
    </script>
   <%
		}
	%>
	<%
		if("invalid".equals(msg))
		{
	%>
	<h1>Something went wrong! try again...</h1>
	<% 
		}
	%>
</body>
</html>