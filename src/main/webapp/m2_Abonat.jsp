<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Abonati</title>
        <link href="css/index.css" rel="stylesheet" type="text/css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela Abonati:</h1>
        <br/>
        <p align="center"><a href="nou_Abonat.jsp"><b>Adauga un nou abonat.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
        	long aux = java.lang.Long.parseLong(request.getParameter("idabonati"));
            String nume = request.getParameter("nume");
            String prenume = request.getParameter("prenume");
            String varsta = request.getParameter("varsta");
            String data_nasterii = request.getParameter("data_nasterii");
            String tara = request.getParameter("tara");
            String adresa_mail = request.getParameter("adresa_mail");

            
            String[] valori = {nume, prenume, varsta, data_nasterii, tara, adresa_mail};
            String[] campuri = {"nume", "prenume", "varsta", "data_nasterii", "tara", "adresa_mail"};
            jb.modificaTabela("abonati", "idabonati", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate !</h1>
        <p align="center">
            <a href="tabela_Abonati.jsp"><b>Tabela Abonati</b></a>
            <br/>
    </body>
</html>