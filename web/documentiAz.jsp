<%-- 
    Document   : documentiAz
    Created on : 6-dic-2019, 10.16.03
    Author     : Davide Simboli
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Internetship Tutor</title>
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
              <a class="active" href="documentiAz.jsp">Documenti</a>
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
                         <h3>Documenti</h3>
                     </th>
                  </tr>
                  <tr style="background-color: whitesmoke;">
                     <th>Titolo</th>
                     <th>Nome</th>
                     <th>Cognome</th>
                     <th>Action</th>
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
                             resultSet = Statement.executeQuery("select * from documenti_azienda_studente where email_azienda = '"+str+"'");
                             while(resultSet.next()){
                     %>
                  <form action="scaricaDoc" method="post">
                      <%
                          int id_documento = resultSet.getInt("id_documento");
                          String titolo = resultSet.getString("titolo");
                          String nomeStud = resultSet.getString("nome");
                          String cognomeStud = resultSet.getString("cognome");
                          String doc = resultSet.getString("doc");
                      %>
                      <input type="hidden" name="id_documento" value="<%=id_documento%>"/>
                      <input type="hidden" name="nomeStud" value="<%=nomeStud%>"/>
                      <input type="hidden" name="cognomeStud" value="<%=cognomeStud%>"/>
                      <input type="hidden" name="doc" value="<%=doc%>"/>
                     <tr>
                        <td><%=titolo%></td>
                        <td><%=nomeStud%></td>
                        <td><%=cognomeStud%></td>
                        <td>
                            <button type="submit" name="stato" value="scaricaAz" id='btnsi' style="width: 100px;">Scarica</button>
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