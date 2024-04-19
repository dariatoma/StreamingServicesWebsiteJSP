<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga Serviciu Streaming</title>
        <link href="css/restul.css" rel="stylesheet" type="text/css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            String nume_serv = request.getParameter("nume_serv");
            String taxa_serv = request.getParameter("taxa_serv");
            if (nume_serv != null) {
                jb.connect();
                jb.adaugaStreamingService(nume_serv, java.lang.Float.parseFloat(taxa_serv));
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p><%
        } else {
        %>
        <h1> Suntem in tabela Servicii Streaming.</h1>
        <form action="nou_Streaming.jsp" method="post">
            <table>
                <tr>
                    <td align="right">Nume Serviciu de Streaming:</td>
                    <td> <input type="text" name="nume_serv" size="40" /></td>
                </tr>
                <tr>
                    <td align="right">Taxa Serviciu de Streaming:</td>
                    <td> <input type="text" name="taxa_serv" size="30" /></td>
                </tr>
            </table>
            <input type="submit" value="Adauga serviciul de streaming" />
        </form>
        <%
            }
        %>
        <br/>
        <a href="index.html"><b>Home</b></a>
        <br/>
    </body>
</html>