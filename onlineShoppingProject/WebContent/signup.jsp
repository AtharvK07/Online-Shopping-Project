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
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

form {
    width: 400px;
    background-color: #ffffff;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px 0px #0000001f;
}

input[type="text"], input[type="number"], input[type="password"], select {
    width: 100%;
    padding: 15px;
    border-radius: 5px;
    border: 1px solid #ddd;
    margin-bottom: 15px;
    font-size: 14px;
}

input[type="submit"] {
    width: 100%;
    padding: 15px;
    border-radius: 5px;
    border: none;
    color: white;
    font-size: 14px;
    font-weight: bold;
    cursor: pointer;
    background: linear-gradient(90deg, rgba(0,123,255,1) 0%, rgba(0,96,200,1) 100%);
}

input[type="submit"]:hover {
    background: linear-gradient(90deg, rgba(0,96,200,1) 0%, rgba(0,123,255,1) 100%);
}

input[type="submit"]:active {
    background: linear-gradient(90deg, rgba(0,96,200,1) 0%, rgba(0,123,255,1) 100%);
    transform: scale(0.98);
}

h1 {
    text-align: center;
    font-size: 1.2em;
    color: #333;
}

h1.success {
    color: #008000;
}

h1.error {
    color: #FF0000;
}
	
	
	</style>
</head>
<body>

	<form action="signupAction.jsp" method="post">
	<input type = "text", name="name", placeholder="Enter name" required>
	<input type ="text", name="email", placeholder="Enter email", required>
	<input type ="number", name="number", placeholder="Enter mobile number", required>
	<select name="securityQuestion" required>
	<option value="What is your first car?">What is your first car?</option>
	<option value="What is name of your first pet?">What is name of your first pet?</option>
	<option value="What elementry school did you attend?">What elementry school did you attend?</option>
	<option value="What is the name of town where you were born?">What is the name of town where you were born?</option>
	</select>
	<input type ="text", name="answer", placeholder="Enter answer", required>
	<input type ="password", name="password", placeholder="Enter Password", required>
	<input type="submit", value="signUp">
	<h3>for login<a href="login.jsp">click here</a><h3>
	</form>
	
	<%
		String msg = request.getParameter("msg");
		if("valid".equals(msg))
		{
	%>
	<script type="text/javascript">
        alert("Successfully registered!");
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