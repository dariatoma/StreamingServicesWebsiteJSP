<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Servicii Streaming</title>
        <link href="css/index.css" rel="stylesheet" type="text/css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela Servicii Streaming:</h1>
        <br/>
        <p align="center"><a href="nou_Streaming.jsp"><b>Adauga un nou serviciu de streaming.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
        	long aux = java.lang.Long.parseLong(request.getParameter("idservices"));
            String nume_serv = request.getParameter("nume_serv");
            String taxa_serv = request.getParameter("taxa_serv");
            
          
            String[] valori = {nume_serv, taxa_serv};
            String[] campuri = {"nume_serv", "taxa_serv"};
            jb.modificaTabela("services", "idservices", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate !</h1>
        <p align="center">
            <a href="tabela_Streaming.jsp"><b>Tabela Servicii de Streaming</b></a>
            <br/>
    </body>
</html>