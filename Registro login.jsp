<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Validar login</title>
	<link rel="stylesheet" href="Styles.css">
</head>
<body>	
	<%
	String Nombre= request.getParameter("usuario");
	String Contrasena = request.getParameter("contrasena");
	%>
	<%@page import="java.sql.*"%>
	<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection dbconect = DriverManager. getConnection("jdbc:mysql://localhost:33065/Proyecto final","root","");
	try{
		PreparedStatement ConsultaP = dbconect.prepareStatement("SELECT * FROM usuarios WHERE Nombre=? AND Contrasena=?");
		
		ConsultaP.setString(1,Nombre);
		ConsultaP.setString(2,Contrasena);
		
		ResultSet resultado = ConsultaP.executeQuery();
		
		if(resultado.next()){
			response.setHeader("Refresh", "0;URL=index.html");
		}
		else{
			response.setHeader("Refresh", "0;URL=Login.html");
		}
	}
	catch(Exception e){
		response.setHeader("Refresh", "0;URL=Login.html");
		out.println("--ERROR--<br>");
		out.println("--Usuario o contraseña invalida");
	}
	%>
</body>
</html>