<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga abonament</title>
         <link href="css/restul.css" rel="stylesheet" type="text/css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            long idabonati, idservices;
            String  id1, id2, nume, prenume, data_nasterii, tara, adresa_mail, nume_serv, tip_abonament, data_inceput, data_expirare, taxa;
            int varsta;
            float taxa_serv;
            id1 = request.getParameter("idabonati");
            id2 = request.getParameter("idservices");
            tip_abonament = request.getParameter("tip_abonament");
            data_inceput = request.getParameter("data_inceput");
            data_expirare = request.getParameter("data_expirare");
            taxa = request.getParameter("taxa");
            if (id1 != null) {
                jb.connect();
                jb.adaugaAbonament(java.lang.Long.parseLong(id1), java.lang.Long.parseLong(id2), tip_abonament, data_inceput, data_expirare, java.lang.Float.parseFloat(taxa));
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p><%
        } else {
        jb.connect();
        ResultSet rs1 = jb.vedeTabela("abonati");
        ResultSet rs2 = jb.vedeTabela("services");
        %>
        <h1> Suntem in tabela abonament.</h1>
        <form action="nou_Abonament.jsp" method="post">
            <table>
                <tr>
                    <td align="right">IdAbonat:</td>
                    <td> 
                        Selectati abonatul:
			<SELECT NAME="idabonati">
                                <%
                                    while(rs1.next()){
                                        idabonati = rs1.getLong("idabonati");
                                        nume = rs1.getString("nume");
                                        prenume = rs1.getString("prenume");
                                        varsta = rs1.getInt("varsta");
                                        data_nasterii = rs1.getString("data_nasterii");
                                        adresa_mail = rs1.getString("adresa_mail");
                                %>
                                    <OPTION VALUE="<%= idabonati%>"><%= idabonati%>,<%= nume%>, <%= prenume%>, <%= varsta%>, <%= data_nasterii%>, <%= adresa_mail%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                    
                    </td>
                </tr>
                <tr>
                    <td align="right">Serviciul de streaming dorit:</td>
                    <td> 
                        Selectati serviciul de streaming:
			<SELECT NAME="idservices">
				<!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION -->
                                <%
                                    while(rs2.next()){
                                        idservices = rs2.getLong("idservices");
                                        nume_serv = rs2.getString("nume_serv");
                                        taxa_serv = rs2.getFloat("taxa_serv");
                                %>
                                    <OPTION VALUE="<%= idservices%>"><%= idservices%>, <%= nume_serv%>, <%= taxa_serv%>$/month</OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                     </td>
                </tr>
                <tr>
                    <td align="right"> Tip abonament:</td>
                    <td> <select id="tip_abonament" name="tip_abonament">
					    <option value="1month">1month</option>
					    <option value="6month">6month</option>
					    <option value="12month">12month</option>
					    <option value="24month">24month</option>
					</select> </td>
                </tr>
                <tr>
                    <td align="right">Data inceput:</td>
                    <td> <input type="text" name="data_inceput" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Data expirare:</td>
                    <td> <input type="text" name="data_expirare" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Taxa:</td>
                    <td> <input type="text" name="taxa" size="30" /></td>
                </tr>
            </table>
            <input type="submit" value="Adauga abonamentul" />
        </form>
        <%
            }
        %>
        <br/>
        <a href="tabela_Abonament.jsp"><b>Tabela Abonamente</b></a>
        <a href="index.html"><b>Home</b></a>
        <br/>
    </body>
</html>