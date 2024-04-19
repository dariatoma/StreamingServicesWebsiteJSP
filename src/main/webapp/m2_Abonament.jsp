<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Abonament</title>
        <link href="css/index.css" rel="stylesheet" type="text/css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela Abonament:</h1>
        <br/>
        <p align="center"><a href="nou_Abonament.jsp"><b>Adauga un nou abonament.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
        	long aux = java.lang.Long.parseLong(request.getParameter("idabonament"));
            String idabonati = request.getParameter("idabonati");
            String idservices = request.getParameter("idservices");
            String tip_abonament = request.getParameter("tip_abonament");
            String data_inceput = request.getParameter("data_inceput");
            String data_expirare = request.getParameter("data_expirare");
            String taxa = request.getParameter("taxa");
            
            String[] valori = {idabonati, idservices, tip_abonament, data_inceput, data_expirare, taxa};
            String[] campuri = {"idabonati", "idservices", "tip_abonament", "data_inceput", "data_expirare", "taxa"};
            jb.modificaTabela("abonament", "idabonament", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate !</h1>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
    </body>
</html>