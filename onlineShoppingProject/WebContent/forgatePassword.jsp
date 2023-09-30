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
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #e0e0e0;
            margin: 0;
        }
        form {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        input[type="email"],
        input[type="number"],
        input[type="text"],
        input[type="password"],
        select {
            display: block;
            width: 100%;
            padding: 10px;
            font-size: 18px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-bottom: 10px;
        }
        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px;
            width: 100%;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        h3 {
            text-align: center;
        }
        h3 a {
            color: #007BFF;
            text-decoration: none;
        }
        h3 a:hover {
            color: #0056b3;
        }

	
	</style>
</head>
<body>
	
		<form action = "forgotPasswordAction.jsp" method="post">
		
		<input type ="email" name="email" placeholder="Enter email" required>
		<input type="number" name="number" placeholder="Enter Mobile number" required>
		
		<select name="securtyQuestion">
		<option value="What is your first car?">What is your first car?</option>
		<option value="What is name of your first pet?">What is name of your first pet?</option>
		<option value="What elementry school did you attend?">What elementry school did you attend?</option>
		<option value="What is the name of town where you were born?">What is the name of town where you were born?</option>
		</select> 
		
		<input type="text" name="answer" placeholder="Enter answer" required>
		<input type="password" name="password" placeholder="Enter your new password to set" required>
		
		<input type="submit" value="save" >
		
		<h3><a href="login.jsp">login</a> again</h3>
		</form>
		
		<%
		String msg = request.getParameter("msg");
		if("done".equals(msg)){
		%>
		<script type="text/javascript">
	        alert("password change succefully...");
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