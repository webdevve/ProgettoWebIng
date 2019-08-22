<%-- 
   Document   : admin
   Created on : 19-ago-2019, 16.52.55
   Author     : Aesys
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
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
      <title>Admin</title>
      <link rel="stylesheet" href="css/header.css" type="text/css"/>
      <link rel="stylesheet" href="css/index.css" type="text/css"/>
      <link rel="stylesheet" href="css/admin.css" type="text/css"/>
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
            <a class="active" href="admin.jsp">Home</a>
            <a href="#news">News</a>
            <a href="#convenzioni" >Convenzioni</a>
            <a href="<%=linkAccedi%>"><%=login%></a>
         </div>
      </div>
      <div class="container">
         <div class="cardAdmin" style="overflow-x:auto;">
            <div class="cardContainer">
               <table style="width:100%">
                  <tr>
                     <th colspan="14" style="background-color: whitesmoke;">
                         <h3>Aziende in attesa di convenzione</h3>
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
                     <th>Convenzionare</th>
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
                             resultSet = Statement.executeQuery("SELECT * FROM internshiptutor.azienda where stato = 'inAttesa'");
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
                      %>
                      <input type="hidden" value="<%=id%>" name="id"/>
                      <input type="hidden" value="<%=ragioneSociale%>" name="ragioneSociale"/>
                      <input type="hidden" value="<%=nomeResponsabile%>" name="nomeResponsabile"/>
                      <input type="hidden" value="<%=cognomeResponsabile%>" name="cognomeResponsabile"/>
                      <input type="hidden" value="<%=partita_iva%>" name="partita_iva"/>
                      <input type="hidden" value="<%=sedeLegale%>" name="sedeLegale"/>
                      <input type="hidden" value="<%=descrizione%>" name="descrizione"/>
                      <input type="hidden" value="<%=ambito%>" name="ambito"/>
                     <tr>
                        <td><%=id%></td>
                        <td><%=ragioneSociale%></td>
                        <td><%=resultSet.getString("indirizzo")%></td>
                        <td><%=resultSet.getString("partita_iva")%></td>
                        <td><%=resultSet.getString("nome_responsabile")%></td>
                        <td><%=resultSet.getString("cognome_responsabile")%></td>
                        <td><%=resultSet.getString("telefono_responsabile")%></td>
                        <td><%=resultSet.getString("email_responsabile")%></td>
                        <td><%=resultSet.getString("email_azienda")%></td>
                        <td>
                           <button type="submit" name="stato" value="approvato" id='btnsi'>Si</button>
                           <button type="submit" name="stato" value="disapprovato" id='btnno'>No</button>
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