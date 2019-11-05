<%-- 
    Document   : dettaglioOfferta
    Created on : 30-ott-2019, 19.24.59
    Author     : Davide Simboli
--%>

<%@page import="Business.Model.offertaAzienda"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Internship Tutor</title>
        <link rel="stylesheet" href="css/header.css" type="text/css"/>
        <link rel="stylesheet" href="css/index.css" type="text/css"/>
        <link rel="stylesheet" href="css/dettaglioOfferta.css" type="text/css"/>
    </head>
    <body>
        <%
            HttpSession sessione = request.getSession();
            String str = (String)sessione.getAttribute("username");
            request.setAttribute("name", str);
            String nome = (String)request.getAttribute("name");
            String login = "";
            String linkAccedi = "";
            if(nome == null){
                //nome = "";
                login = "Accedi";
                linkAccedi = "login.jsp";
            }else{
                login = nome;
                linkAccedi = "#profilo";
            }
        %>
    <div class="header">
        <a href="#default" class="logo">InternshipTutor</a>
        <div class="header-right">
          <a href="index.jsp">Home</a>
          <a href="#news">News</a>
          <a href="visualizzaAziende.jsp" >Aziende</a>
          <a href="<%=linkAccedi%>"><%=login%></a>
        </div>
    </div>
        <%
            /*
            String ragioneSociale = (String)request.getAttribute("ragioneSociale");
            String indirizzo = (String)request.getAttribute("indirizzo");
            String titoloOfferta = (String)request.getAttribute("titoloOfferta");
            String Luogo = (String)request.getAttribute("luogo");
            String orari = (String)request.getAttribute("orari");
            String ore = (String)request.getAttribute("ore");
            String obiettivi = (String)request.getAttribute("obiettivi");
            String modalita = (String)request.getAttribute("modalita");
            String rimborsi = (String)request.getAttribute("rimborsi");
            String descrizione = (String)request.getAttribute("descrizione");
            */
            int id = (int)request.getAttribute("id");
            Connection connect = null;
            Statement Statement = null;
            ResultSet resultSet = null;
            offertaAzienda offerta = null;
            try{
                Class.forName("com.mysql.jdbc.Driver");
                connect = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/internshiptutor",
                                            "root", "ciao");
                System.out.println("Connessione Stabilita!");
                Statement = connect.createStatement();
                resultSet = Statement.executeQuery("SELECT * FROM internshiptutor.offerta_azienda where id = "+id);
                while(resultSet.next()){
                    String ragioneSociale = resultSet.getString("ragione_sociale");
                    String titoloOfferta = resultSet.getString("titolo");
                    String Luogo = resultSet.getString("luogo");
                    String orari = resultSet.getString("orari");
                    String ore = resultSet.getString("durata");
                    String obiettivi = resultSet.getString("obiettivi");
                    String modalita = resultSet.getString("modalita");
                    String rimborsi = resultSet.getString("rimborsi");
                    String descrizione = resultSet.getString("descrizione");
                    String indirizzo = resultSet.getString("indirizzo");
                    %>
                    <form action="#" method="post" class="tableform">
          <table class="center">
            <tr class="grey">
              <th colspan="2"><h3><%=titoloOfferta%></h3></th>
            </tr>
            <tr class="whitegrey">
              <td>Azienda</td>
              <td><%=ragioneSociale%></td>
            </tr>
            <tr class="grey">
              <td>Indirizzo</td>
              <td><%=indirizzo%></td>
            </tr>
            <tr class="whitegrey">
              <td>Luogo</td>
              <td><%=Luogo%></td>
            </tr>
            <tr class="grey">
              <td>Orari</td>
              <td><%=orari%></td>
            </tr>
            <tr class="whitegrey">
              <td>Ore</td>
              <td><%=orari%></td>
            </tr>
            <tr class="grey">
              <td>Obiettivi</td>
              <td><%=obiettivi%></td>
            </tr>
            <tr class="whitegrey">
              <td>Modalità</td>
              <td><%=modalita%></td>
            </tr>
            <tr class="grey">
              <td>Rimborsi</td>
              <td><%=rimborsi%></td>
            </tr>
            <tr class="whitegrey">
              <td>Descrizione</td>
              <td><%=descrizione%></td>
            </tr>
            <tr>
              <td colspan="2" class="btnCentre">
                <button type="submit" name="button" id="btnsi"><h3>Aderisci All'Offerta</h3></button>
              </td>
            </tr>
          </table>
        </form>
        <%
                    connect.close();
                    Statement.close();
                    resultSet.close();
                }
            }catch(SQLException e){
                System.out.println("ERRORE DATABASE! " + e.getMessage());
            }catch(Exception e){
                System.out.println("ERRORE GENERICO! " + e.getMessage());
            }finally{
                try{
                    if (connect != null)
                        connect.close();
                    if (Statement != null)
                        Statement.close();
                    if (resultSet != null)
                        resultSet.close();
                } catch(final SQLException e){
                    System.out.println("final - ERRORE DATABASE! " + e.getMessage());
                }
            }
                     %>
        
    </body>
</html>
