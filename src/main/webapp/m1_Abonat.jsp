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
        <h1 align="center">Tabela Abonati:</h1>
        <br/>
        <p align="center"><a href="nou_Abonat.jsp"><b>Adauga un nou abonat.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            String aux = request.getParameter("primarykey");
            if(aux != null){
            ResultSet rs = jb.intoarceLinieDupaId("abonati", "idabonati", java.lang.Long.parseLong(aux));
            rs.first();
            String nume = rs.getString("nume");
            String prenume = rs.getString("prenume");
            int varsta = rs.getInt("varsta");
            String data_nasterii = rs.getString("data_nasterii");
            String tara = rs.getString("tara");
            String adresa_mail = rs.getString("adresa_mail");
            rs.close();
            jb.disconnect();
       
        %>
        <form action="m2_Abonat.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdAbonat:</td>
                    <td> <input type="text" name="idabonati" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Nume:</td>
                    <td> <input type="text" name="nume" size="30" value="<%= nume%>"/></td>
                </tr>
                <tr>
                    <td align="right">Prenume:</td>
                    <td> <input type="text" name="prenume" size="30" value="<%= prenume%>"/></td>
                </tr>
                <tr>
                    <td align="right">Varsta:</td>
                    <td> <input type="text" name="varsta" size="30" value="<%= varsta%>"/></td>
                </tr>
                <tr>
                    <td align="right">DataNasterii:</td>
                    <td> <input type="text" name="data_nasterii" size="30" value="<%= data_nasterii%>"/></td>
                </tr>
                <tr>
                    <td align="right">Tara:</td>
                    <td> <input type="text" name="tara" size="30" value="<%= tara%>"/></td>
                </tr>
                <tr>
                    <td align="right">AdresaMail:</td>
                    <td> <input type="text" name="adresa_mail" size="30" value="<%= adresa_mail%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <br/>
        <p align="center"><a href="tabela_Abonati.jsp"><b>Tabela Abonati</b></a> </p>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
            <% } else { %>
        <p align="center"><a href="tabela_Abonati.jsp"><b>Tabela Abonati</b></a> </p>
        <p align="center">
        <br/>
        <br/>
        <br/>
        <h2 align="center">Selectati o linie pe care doriti sa o modificati inainte sa apasati butonul "Modifica" !</h2>
        <%} %>
    </body>
</html>