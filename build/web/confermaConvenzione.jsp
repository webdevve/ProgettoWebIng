<%-- 
    Document   : confermaConvenzione
    Created on : 24-ago-2019, 1.08.24
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
            <a href="admin.jsp">Home</a>
            <a href="confermaConvenzione.jsp" class="active">Convenzioni da Confermare</a>
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
                     <th>Email Azienda</th>
                     <th>Documento</th>
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
                             resultSet = Statement.executeQuery("SELECT * FROM internshiptutor.azienda where stato = 'approvata'");
                             while(resultSet.next()){
                     %>
                  <form action="confermaConvenzione" method="post">
                      <%
                          int id = resultSet.getInt("ID");
                          String ragioneSociale = resultSet.getString("ragione_sociale");
                          String email_azienda = resultSet.getString("email_azienda");
                      %>
                      <input type="hidden" value="<%=id%>" name="id"/>
                      <input type="hidden" value="<%=ragioneSociale%>" name="ragioneSociale"/>
                      <input type="hidden" value="<%=email_azienda%>" name="email_azienda"/>
                     <tr>
                        <td><%=id%></td>
                        <td><%=ragioneSociale%></td>
                        <td><%=email_azienda%></td>
                        <td>
                           <button type="submit" name="stato" value="caricaDocumento" id='btncarica'>Carica Documento</button>
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
