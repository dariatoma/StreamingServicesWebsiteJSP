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
        <h1 align="center">Tabela Abonament:</h1>
        <br/>
        <p align="center"><a href="nou_Abonament.jsp"><b>Adauga un nou abonament.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            String nume, prenume, data_nasterii, tara, adresa_mail, nume_serv, tip_abonament, data_inceput, data_expirare;
            int varsta;
            float taxa, taxa_serv;
            String aux = request.getParameter("primarykey");
            if(aux != null){
            ResultSet rs = jb.intoarceAbonamentId(java.lang.Long.parseLong(aux));
            rs.first();
            long id1 = rs.getLong("idabonati");
            long id2 = rs.getLong("idservices");
            
            nume = rs.getString("nume");
            prenume = rs.getString("prenume");
            varsta = rs.getInt("varsta");
            data_nasterii = rs.getString("data_nasterii");
            tara = rs.getString("tara");
            adresa_mail = rs.getString("adresa_mail");
            nume_serv = rs.getString("nume_serv");
            taxa_serv = rs.getFloat("taxa_serv");
            tip_abonament = rs.getString("tip_abonament");
            data_inceput = rs.getString("data_inceput");
            data_expirare = rs.getString("data_expirare");
            taxa = rs.getFloat("taxa");

            ResultSet rs1 = jb.vedeTabela("abonati");
            ResultSet rs2 = jb.vedeTabela("services");
            long idabonati, idservices;
        %>
        <form action="m2_Abonament.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdAbonament:</td>
                    <td> <input type="text" name="idabonament" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">IdAbonat:</td>
                    <td> 
                        <SELECT NAME="idabonati">
                            <%
                                while (rs1.next()) {
                                    idabonati = rs1.getLong("idabonati");
                                    nume = rs1.getString("nume");
                                    prenume = rs1.getString("prenume");
                                    varsta = rs1.getInt("varsta");
                                    data_nasterii = rs.getString("data_nasterii");
                                    tara = rs.getString("tara");
                                    adresa_mail = rs.getString("adresa_mail");
                                    if (idabonati != id1) {
                            %>
                            <OPTION VALUE="<%= idabonati	%>"><%= idabonati%>, <%= nume%>, <%= prenume%>, <%= varsta%>, <%= data_nasterii%>, <%= tara%>, <%= adresa_mail%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idabonati%>"><%= idabonati%>, <%= nume%>, <%= prenume%>, <%= varsta%>, <%= data_nasterii%>, <%= tara%>, <%= adresa_mail%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">IdServices:</td>
                    <td> 
                        <SELECT NAME="idservices">
                            <%
                                while (rs2.next()) {
                                    idservices = rs2.getLong("idservices");
                                    nume_serv = rs2.getString("nume_serv");
                                    taxa_serv = rs2.getFloat("taxa_serv");
                            if (idservices != id2) {
                            %>
                            <OPTION VALUE="<%= idservices%>"><%= idservices%>, <%= nume_serv%>, <%= taxa_serv%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idservices%>"><%= idservices%>, <%= nume_serv%>, <%= taxa_serv%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">TipAbonament:</td>
                    <td> <select id="tip_abonament" name="tip_abonament">
					    <option value="1month">1month</option>
					    <option value="6month">6month</option>
					    <option value="12month">12month</option>
					    <option value="24month">24month</option>
					</select> </td>
                </tr>
                <tr>
                    <td align="right">DataInceput:</td>
                    <td> <input type="text" name="data_inceput" size="30" value="<%= data_inceput%>"/></td>
                </tr>
                <tr>
                    <td align="right">DataExpirare:</td>
                    <td> <input type="text" name="data_expirare" size="30" value="<%= data_expirare%>"/></td>
                </tr>
                <tr>
                    <td align="right">Taxa:</td>
                    <td> <input type="text" name="taxa" size="30" value="<%= taxa%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
    </body>
    <%
        rs.close();
        rs1.close();
        rs2.close();
        jb.disconnect();
    %>
<%} else{ %>
        <p align="center"><a href="tabela_Abonament.jsp"><b>Tabela Abonament</b></a> </p>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            </p>
        <br/>
        <br/>
        <h2 align="center">Selectati o linie pe care doriti sa o modificati inainte sa apasati butonul "Modifica"</h2>
        <%} %>
    </body>
    
</html>