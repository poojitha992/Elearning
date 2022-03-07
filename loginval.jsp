<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>

<%

String mail = request.getParameter("mail");
String pass = request.getParameter("pass");

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:Mysql://127.0.0.1:3306/final", "root", "root");
	
	PreparedStatement ps = conn.prepareStatement("select pass from userd where mail='"+mail+"';");
	ResultSet rs = ps.executeQuery();
	rs.next();
	
	if(pass.equals(rs.getString("pass"))){
%>
		<jsp:forward page="dashboard.html"/>
<%
	}
	else{
		out.print("<center><h2>Login Failed</h2></center>");
		//out.print("New User? <a href='userRegi.html'>Register now</a>");
	}
}
catch(Exception e){
	out.print("<center><h2>Login Failed</h2></center>");
}
%>

</body>
</html>