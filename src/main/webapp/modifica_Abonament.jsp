<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Abonament</title>
        <link href="css/modifica.css" rel="stylesheet" type="text/css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela Abonament:</h1>
        <br/>
        <p align="center"><a href="nou_Abonament.jsp"><b>Adauga un nou abonament.</b></a> <a href="index.html"><b>Home</b></a></p>
        <form action="m1_Abonament.jsp" method="post">
            <table border="1" align="center">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>IdAbonament:</b></td>
                    <td><b>IdAbonat:</b></td>
                    <td><b>NumeAbonat:</b></td>
                    <td><b>PrenumeAbonat:</b></td>
                    <td><b>Varsta:</b></td>
                    <td><b>DataNasterii:</b></td>
                    <td><b>Tara:</b></td>
                    <td><b>Adresa_Mail:</b></td>
                    <td><b>IdServices:</b></td>
                    <td><b>NumeServStreaming:</b></td>
                    <td><b>TaxaServStreaming:</b></td>
                    <td><b>Tip_abonament:</b></td>
                    <td><b>Data_inceput:</b></td>
                    <td><b>Data_expirare:</b></td>
                    <td><b>Taxa:</b></td>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeAbonament();
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("idabonament");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td><td><%= x%></td>
                    <td><%= rs.getLong("idabonati")%></td>
                    <td><%= rs.getString("nume")%></td>
                    <td><%= rs.getString("prenume")%></td>
                    <td><%= rs.getInt("varsta")%></td>
                    <td><%= rs.getString("data_nasterii")%></td>
                    <td><%= rs.getString("tara")%></td>
                    <td><%= rs.getString("adresa_mail")%></td>
                    <td><%= rs.getLong("idservices")%></td>
                    <td><%= rs.getString("nume_serv")%></td>
                    <td><%= rs.getFloat("taxa_serv")%></td>
                    <td><%= rs.getString("tip_abonament")%></td>
                    <td><%= rs.getString("data_inceput")%></td>
                    <td><%= rs.getString("data_expirare")%></td>
                    <td><%= rs.getFloat("taxa")%></td>
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
        <p align="center"><a href="tabela_Abonament.jsp"><b>Tabela Abonament</b></a> </p>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
        </p>
    </body>
</html>