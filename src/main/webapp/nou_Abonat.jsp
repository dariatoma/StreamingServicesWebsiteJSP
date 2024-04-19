<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga abonat</title>
        <link href="css/restul.css" rel="stylesheet" type="text/css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            String nume = request.getParameter("nume");
            String prenume = request.getParameter("prenume");
            String varsta = request.getParameter("varsta");
            String data_nasterii = request.getParameter("data_nasterii");
            String tara = request.getParameter("tara");
            String adresa_mail = request.getParameter("adresa_mail");
            if (nume != null) {
                jb.connect();
                jb.adaugaAbonat(nume, prenume, java.lang.Integer.parseInt(varsta), data_nasterii, tara, adresa_mail);
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p><%
        } else {
        %>
        <h1> Suntem in tabela Abonati.</h1>
        <form action="nou_Abonat.jsp" method="post">
            <table>
                <tr>
                    <td align="right">Nume Abonat:</td>
                    <td> <input type="text" name="nume" size="40" /></td>
                </tr>
                <tr>
                    <td align="right">Prenume Abonat:</td>
                    <td> <input type="text" name="prenume" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Varsta:</td>
                    <td> <input type="text" name="varsta" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Data nasterii:</td>
                    <td> <input type="text" name="data_nasterii" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Tara:</td>
                    <td> <input type="text" name="tara" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Adresa Mail:</td>
                    <td> <input type="text" name="adresa_mail" size="30" /></td>
                </tr>
            </table>
            <input type="submit" value="Adauga abonatul" />
        </form>
        <%
            }
        %>
        <br/>
        <a href="index.html"><b>Home</b></a>
        <br/>
    </body>
</html>