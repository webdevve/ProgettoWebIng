<%-- 
    Document   : aziendeConvenzionate
    Created on : 26-ago-2019, 12.18.03
    Author     : Davide Simboli
--%>
<%@page import="java.sql.SQLException"%>
<%@page import="Business.Model.Azienda"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aziende Convenzionate</title>
        <link rel="stylesheet" href="css/header.css" type="text/css"/>
        <link rel="stylesheet" href="css/index.css" type="text/css"/>
        <link rel="stylesheet" href="css/admin.css" type="text/css"/>
    </head>
    <body>
        <%
         HttpSession sessione = request.getSession();
         String str = (String)sessione.getAttribute("username");
         request.setAttribute("name", str);
         if(str == null){
             response.sendRedirect("login.jsp");
         }
         String errore = (String)request.getAttribute("err");
        if(errore == null){
          errore="";
        }
        String notifica = (String)request.getAttribute("notify");
         if(notifica == null){
           notifica="";
         }
         %>
      <div class="header">
         <a href="#default" class="logo">InternshipTutor</a>
         <div class="header-right">
            <a href="admin.jsp">Home</a>
            <a href="confermaConvenzione.jsp">Convenzioni da Confermare</a>
            <a href="aziendeConvenzionate.jsp" class="active">Convenzioni</a>
            <a href="statistica.jsp">Statistiche</a>
            <a href="javascript:{}" onclick="document.getElementById('my_form').submit(); return false;">Logout</a>
         </div>
      </div>
      <form action="logout" method="post" id="my_form"></form>
        <%if(str!=null){%>
        <div class="centra"><img src="icon/user.ico"/><%=str%></div>
        <%}%>
         <font color="red" id="err">
            <p><%=errore%></p>
          </font>
          <font color="green">
            <p><%=notifica%></p>
          </font>
      <div class="container">
         <div class="cardAdmin" style="overflow-x:auto;">
            <div class="cardContainer">
               <table style="width:100%">
                  <tr>
                     <th colspan="14" style="background-color: whitesmoke;">
                         <h3>Aziende Convenzionate</h3>
                     </th>
                  </tr>
                  <tr style="background-color: whitesmoke;">
                     <th>ID</th>
                     <th>Ragione Sociale</th>
                     <th>Indirizzo</th>
                     <th>Partita IVA</th>
                     <th>Nome Responsabile</th>
                     <th>Cognome Responsabile</th>
                     <th>Telefono Responsabile</th>
                     <th>Email Responsabile</th>
                     <th>Email Azienda</th>
                  </tr>
                  <%
                     Connection connect = null;
                     Statement Statement = null;
                     ResultSet resultSet = null;
                     int count = 0;
                         try{
                             Class.forName("com.mysql.jdbc.Driver");
                             connect = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/internshiptutor",
                     "root", "ciao");
                             System.out.println("Connessione Stabilita!");
                             Statement = connect.createStatement();
                             resultSet = Statement.executeQuery("SELECT * FROM internshiptutor.azienda where stato = 'convenzionata'");
                             while(resultSet.next()){
                     %>
                  <form action="admin" method="post">
                      <%
                          int id = resultSet.getInt("ID");
                          String ragioneSociale = resultSet.getString("ragione_sociale");
                          String partita_iva = resultSet.getString("partita_iva");
                          String nomeResponsabile = resultSet.getString("nome_responsabile");
                          String cognomeResponsabile = resultSet.getString("cognome_responsabile");
                          String sedeLegale = resultSet.getString("foro");
                          String descrizione = resultSet.getString("descrizione");
                          String ambito = resultSet.getString("ambito");
                          String nome_legale_rappr = resultSet.getString("nome_legale_rappr");
                          String cognome_legale_rappr = resultSet.getString("cognome_legale_rappr");
                          String email_azienda = resultSet.getString("email_azienda");
                      %>
                      <input type="hidden" value="<%=id%>" name="id"/>
                      <input type="hidden" value="<%=ragioneSociale%>" name="ragioneSociale"/>
                      <input type="hidden" value="<%=nomeResponsabile%>" name="nomeResponsabile"/>
                      <input type="hidden" value="<%=cognomeResponsabile%>" name="cognomeResponsabile"/>
                      <input type="hidden" value="<%=partita_iva%>" name="partita_iva"/>
                      <input type="hidden" value="<%=sedeLegale%>" name="sedeLegale"/>
                      <input type="hidden" value="<%=descrizione%>" name="descrizione"/>
                      <input type="hidden" value="<%=ambito%>" name="ambito"/>
                      <input type="hidden" value="<%=nome_legale_rappr%>" name="nome_legale_rappr"/>
                      <input type="hidden" value="<%=cognome_legale_rappr%>" name="cognome_legale_rappr"/>
                      <input type="hidden" value="<%=email_azienda%>" name="email_azienda"/>
                     <tr>
                        <td><%=id%></td>
                        <td><%=ragioneSociale%></td>
                        <td><%=resultSet.getString("indirizzo")%></td>
                        <td><%=partita_iva%></td>
                        <td><%=nomeResponsabile%></td>
                        <td><%=cognomeResponsabile%></td>
                        <td><%=resultSet.getString("telefono_responsabile")%></td>
                        <td><%=resultSet.getString("email_responsabile")%></td>
                        <td><%=email_azienda%></td>
                     </tr>
                  </form>
                  <%
                     count += 1;
                     }
                     connect.close();
                     Statement.close();
                     resultSet.close();
                     if(count == 0){
                     %>
                  <td>-</td>
                  <td>-</td>
                  <td>-</td>
                  <td>-</td>
                  <td>-</td>
                  <td>-</td>
                  <td>-</td>
                  <td>-</td>
                  <td>-</td>
                  <%
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
                     }catch(final SQLException e){
                     System.out.println("final - ERRORE DATABASE! " + e.getMessage());
                     }
                     }
                     %>
               </table>
            </div>
         </div>
      </div>
    </body>
</html>
