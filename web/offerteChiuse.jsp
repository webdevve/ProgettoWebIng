<%-- 
    Document   : offerteChiuse
    Created on : 1-ott-2019, 22.05.05
    Author     : Davide Simboli
--%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Offerte Chiuse</title>
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
              <a href="azienda.jsp">Home</a>
              <a href="tirocini.jsp">Tirocini</a>
              <a href="leMieOfferte.jsp">Le Mie Offerte</a>
              <a class="active" href="offerteChiuse.jsp">Offerte Chiuse</a>
              <a href="#profilo.jsp"><%=str%></a>
            </div>
        </div>
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
                         <h3>Le Mie Offerte Chiuse</h3>
                     </th>
                  </tr>
                  <tr style="background-color: whitesmoke;">
                     <th>ID</th>
                     <th>Titolo</th>
                     <th>Luogo</th>
                     <th>Durata</th>
                     <th>Modalità</th>
                     <th>Rimborsi</th>
                     <th>Dettaglio</th>
                     <th>Apri Offerta</th>
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
                             resultSet = Statement.executeQuery("SELECT * FROM internshiptutor.offerta join internshiptutor.azienda ON azienda.id = offerta.id_azienda where azienda.email_azienda = '"+str+"'"
                                     + "AND offerta.stato = 'chiusa'");
                             while(resultSet.next()){
                     %>
                  <form action="leMieOfferte" method="post">
                      <%
                          int id = resultSet.getInt("ID");
                          String titolo = resultSet.getString("titolo");
                          String luogo = resultSet.getString("luogo");
                          String durata = resultSet.getString("durata");
                          String modalita = resultSet.getString("modalita");
                          String rimborsi = resultSet.getString("rimborsi");
                      %>
                      <input type="hidden" value="<%=id%>" name="id"/>
                      <input type="hidden" value="<%=titolo%>" name="titolo"/>
                      <input type="hidden" value="<%=luogo%>" name="luogo"/>
                      <input type="hidden" value="<%=durata%>" name="durata"/>
                      <input type="hidden" value="<%=modalita%>" name="modalita"/>
                      <input type="hidden" value="<%=rimborsi%>" name="rimborsi"/>
                     <tr>
                        <td><%=id%></td>
                        <td><%=titolo%></td>
                        <td><%=luogo%></td>
                        <td><%=durata%></td>
                        <td><%=modalita%></td>
                        <td><%=rimborsi%></td>
                        <td>
                            <button type="submit" name="stato" value="dettaglio" id='btnsi'>Vedi</button>
                        </td>
                        <td>
                            <button type="submit" name="stato" value="apri" id='btnsi' >Apri</button>
                        </td>
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
