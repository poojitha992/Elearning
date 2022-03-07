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
try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:Mysql://127.0.0.1:3306/final", "root", "root");
		
		PreparedStatement ps = conn.prepareStatement("insert into userd values(?,?,?)");
		ps.setString(1,request.getParameter("uname"));
		ps.setString(2,request.getParameter("mailid"));
		ps.setString(3,request.getParameter("spass"));
		int x=0;
		x = ps.executeUpdate();
		
		if(x!=0){
%>
			<jsp:forward page="dashboard.html"/>
<%
		}else{
			out.print("<center><h2>Registration Failed :(</h2></center>");
		}
}
catch(Exception e){
	out.print("<center><h2>Insertion Failed :(</h2></center>");
}
%>
</body>
</html>