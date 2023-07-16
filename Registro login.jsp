<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
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
	Connection dbconect = DriverManager. getConnection("jdbc:mysql://localhost:3306/Proyecto final","root","");
	try{
		PreparedStatement ConsultaP = dbconect.prepareStatement("SELECT * FROM usuarios WHERE Nombre=? AND Contrasena=?");
		
		ConsultaP.setString(1,Nombre);
		ConsultaP.setString(2,Contrasena);
		
		ResultSet resultado = ConsultaP.executeQuery();
		
		if(resultado.next()){
			response.setHeader("Refresh", "0;URL=Home.html");
		}
		else{
			response.setHeader("Refresh", "2;URL=Login.html");
			out.println("Usuario o contrase�a invalida");
		}
	}
	catch(Exception e){
		
		out.println("--ERROR--<br>");
		out.println("--Usuario o contrase�a invalida");
	}
	%>
</body>
</html>
