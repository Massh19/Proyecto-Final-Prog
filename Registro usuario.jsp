<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<META HTTP-EQUIV="REFRESH" CONTENT="0;URL=Home.html">
	<title>Registro Usuario</title>
	<link rel="stylesheet" href="Styles.css">
</head>
<body>
	<%String Nombre = request.getParameter("nombre");
	String  Apellido = request.getParameter("apellido");

	String Edad = request.getParameter("edad");
	String Contrasena = request.getParameter("contrasena");
	%>
	
	<%@page import="java.sql.*" %>
	<%
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection dbconect = DriverManager. getConnection("jdbc:mysql://localhost:33065/Proyecto final","root","");
	Statement dbstatement = dbconect.createStatement();
	String insertarsql = "INSERT INTO usuarios (Nombre, Apellido, Edad, Contrasena) VALUES ('" +Nombre+ "','" +Apellido+ "','" +Edad+ "','" +Contrasena+ "')";
	dbstatement.executeUpdate(insertarsql);%>
	<h1>REGISTRO COMPLEADO EXITOSAMENTE!!</h1>
</body>
</html>
