<%-- 
    Document   : listastudentiofferta
    Created on : 19-nov-2019, 10.45.51
    Author     : anton
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
        <title>Le Mie Offerte</title>
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
         String id_offerta = (String)request.getAttribute("id_offerta");
         String titolo = request.getParameter("titolo");
        %>
        <div class="header">
            <a href="#default" class="logo">InternshipTutor</a>
            <div class="header-right">
              <a href="azienda.jsp">Home</a>
              <a href="tirocini.jsp">Tirocini</a>
              <a href="leMieOfferte.jsp">Le Mie Offerte</a>
              <a href="offerteChiuse.jsp">Offerte Chiuse</a>
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
                         <h3>Studenti Candidati all'Offerta</h3>
                         <h4><%=titolo%></h4>
                     </th>
                  </tr>
                  <tr style="background-color: whitesmoke;">
                     <th>ID</th>
                     <th>Nome</th>
                     <th>Cognome</th>
                     <th>Condizione</th>
                     <th>Handicap</th>
                     <th>Approva</th>
                     <th>Respingi</th>
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
                             resultSet = Statement.executeQuery("SELECT canditature.id, canditature.condizione, studente.nome, studente.cognome, studente.handicap FROM internshiptutor.canditature join internshiptutor.studente on studente.id = canditature.id_studente "
                                     + "where approvazione = 'attesa' and id_offerta = '"+id_offerta+"'");
                             while(resultSet.next()){
                     %>
                  <form action="accettaProposta" method="post">
                      <%
                          int id_candidatura = resultSet.getInt("id");
                          String nome = resultSet.getString("nome");
                          String cognome = resultSet.getString("cognome");
                          String condizione = resultSet.getString("condizione");
                          String handicap = resultSet.getString("handicap");
                      %>
                      <input type="hidden" value="<%=id_candidatura%>" name="id"/>
                      <input type="hidden" value="<%=nome%>" name="nome"/>
                      <input type="hidden" value="<%=cognome%>" name="cognome"/>
                      <input type="hidden" value="<%=condizione%>" name="condizione"/>
                      <input type="hidden" value="<%=handicap%>" name="handicap"/>
                      <input type="hidden" value="<%=id_offerta%>" name="id_offerta"/>
                     <tr>
                        <td><%=id_candidatura%></td>
                        <td><%=nome%></td>
                        <td><%=cognome%></td>
                        <td><%=condizione%></td>
                        <td><%=handicap%></td>
                        <td>
                            <button type="submit" name="stato" value="approva" id='btnsi' style="width: 100px;">Approva</button>
                        </td>
                        <td>
                           <button type="submit" name="stato" value="respingi" id='btnchiudi'>Respingi</button>
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
