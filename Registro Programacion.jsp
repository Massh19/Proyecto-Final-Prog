<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<META HTTP-EQUIV="REFRESH" CONTENT="0;URL=Home.html">
<title>Registro Curso Programacion</title>
<link rel="stylesheet" href="Styles.css">
</head>
<body>
	<%String Nombre = request.getParameter("nombre");
	String  Apellido = request.getParameter("apellido");
	String Cedula = request.getParameter("cedula");
	String Fecha = request.getParameter("fecha");
	%>
	
	<%@page import="java.sql.*" %>
	<%
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection dbconect = DriverManager. getConnection("jdbc:mysql://localhost:33065/proyecto final","root","");
	Statement dbstatement = dbconect.createStatement();
	String insertarsql = "INSERT INTO programacion (Nombre, Apellido, Cedula, Fecha) VALUES ('" +Nombre+ "','" +Apellido+ "','" +Cedula+ "','" +Fecha+ "')";
	dbstatement.executeUpdate(insertarsql);%>
	<h1>REGISTRO COMPLEADO EXITOSAMENTE!!</h1>
</body>
</html>
