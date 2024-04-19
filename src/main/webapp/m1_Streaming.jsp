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
        <h1 align="center">Tabela Servicii Streaming:</h1>
        <br/>
        <p align="center"><a href="nou_Streaming.jsp"><b>Adauga un nou serviciu de streaming.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            String aux = request.getParameter("primarykey");
            if(aux != null){
            ResultSet rs = jb.intoarceLinieDupaId("services", "idservices", java.lang.Long.parseLong(aux));
            rs.first();
            String nume_serv = rs.getString("nume_serv");
            float taxa_serv = rs.getFloat("taxa_serv");
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_Streaming.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdServices:</td>
                    <td> <input type="text" name="idservices" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Nume Serviciu streaming:</td>
                    <td> <input type="text" name="nume_serv" size="30" value="<%= nume_serv%>"/></td>
                </tr>
                <tr>
                    <td align="right">TaxaServiciu streaming:</td>
                    <td> <input type="text" name="taxa_serv" size="30" value="<%= taxa_serv%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
    <p align="center"><a href="tabela_Streaming.jsp"><b>Tabela Servicii de Streaming</b></a> </p>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
            <% } else { %>
        <p align="center"><a href="tabela_Streaming.jsp"><b>Tabela Servicii de Streaming</b></a> </p>
        <p align="center">
        <br/>
        <br/>
        <br/>
        <h2 align="center">Selectati o linie pe care doriti sa o modificati inainte sa apasati butonul "Modifica" !</h2>
        <%} %>
    </div>
    </body>
</html>