<%-- 
    Document   : sterge_Pacient
    Created on : Nov 14, 2016, 1:32:42 PM
    Author     : vali
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Abonati</title>
        <link href="css/restul.css" rel="stylesheet" type="text/css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            String[] s = request.getParameterValues("primarykey");
        	if(s != null){
    		jb.connect();
            jb.stergeDateTabela(s, "abonati", "idabonati");
            jb.disconnect();
        
    %>
    <br/>
    <p align="center"><a href="tabela_Abonati.jsp"><b>Tabela Abonati</b></a> </p>
    <p align="center">
        <a href="index.html"><b>Home</b></a>
        <br/>
    </p>
    <br/>
    <br/>
    <h2 align="center">Liniile au fost sterse cu succes !</h2><%
    } else {
    %>
    <br/>
    <p align="center"><a href="tabela_Abonati.jsp"><b>Tabela Abonati</b></a> </p>
    <p align="center">
        <a href="index.html"><b>Home</b></a>
        <br/>
    </p>
    <br/>
    <br/>
    <h2 align="center">Selectati cel putin o linie pe care doriti sa o stergeti inainte sa apasati butonul "Sterge liniile marcate" !</h2>
    <% } %>
 
</body>
</html>