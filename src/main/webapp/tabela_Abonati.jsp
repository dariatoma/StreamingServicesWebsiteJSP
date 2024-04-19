<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Abonati</title>
<link href="css/abonati.css" rel="stylesheet" type="text/css">
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1 align="center">Tabela Abonati:</h1>
	<br />
	<p align="center">
		<a href="nou_Abonat.jsp"><b>Adauga un nou abonat.</b></a> <a
			href="index.html"><b>Home</b></a>
	</p>
	<form action="sterge_Abonat.jsp" method="post">
		<table border="1" align="center">
			<tr>
				<td><b>Mark:</b></td>
				<td><b>IdAbonat:</b></td>
				<td><b>Nume:</b></td>
				<td><b>Prenume:</b></td>
				<td><b>Varsta:</b></td>
				<td><b>Data_nasterii:</b></td>
				<td><b>Tara:</b></td>
				<td><b>Adresa_Mail:</b></td>
			</tr>
			<%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("abonati");
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("idabonati");
                %>
			<tr>
				<td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
				<td><%= x%></td>
				<td><%= rs.getString("nume")%></td>
				<td><%= rs.getString("prenume")%></td>
				<td><%= rs.getInt("varsta")%></td>
				<td><%= rs.getString("data_nasterii")%></td>
				<td><%= rs.getString("tara")%></td>
				<td><%= rs.getString("adresa_mail")%></td>
				<%
                        }
                    %>
			</tr>
		</table>
		<br />
		<p align="center">
			<input type="submit" value="Sterge liniile marcate">
		</p>
	</form>
	<%
            rs.close();
            jb.disconnect();
        %>
	<br />
	<p align="center">
		<a href="index.html"><b>Home</b></a> <br />
	</p>
</body>
</html>