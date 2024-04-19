<%-- 
    Document   : modifica_Consultatie
    Created on : Nov 14, 2016, 1:36:40 PM
    Author     : vali
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Servicii Streaming</title>
        <link href="css/modifica.css" rel="stylesheet" type="text/css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela Servicii Streaming:</h1>
        <br/>
        <p align="center"><a href="nou_Streaming.jsp"><b>Adauga un nou serviciu de streaming.</b></a> <a href="index.html"><b>Home</b></a></p>
        <form action="m1_Streaming.jsp" method="post">
            <table border="1" align="center">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>Idstreaming:</b></td>
                    <td><b>Nume_serv:</b></td>
                    <td><b>Taxa_serv:</b></td>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("services");
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("idservices");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
                    <td><%= x%></td>
                    <td><%= rs.getString("nume_serv")%></td>
                    <td><%= rs.getFloat("taxa_serv")%></td>
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <%
    jb.disconnect();%>
        <br/>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
        </p>
    </body>
</html>