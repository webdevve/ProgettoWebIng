<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Internship Tutor</title>
        <link rel="stylesheet" href="css/header.css" type="text/css"/>
        <link rel="stylesheet" href="css/index.css" type="text/css"/>
        <link rel="stylesheet" href="css/azienda.css" type="text/css"/>
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
              <a href="documentiAz.jsp">Documenti</a>
              <a class="active" href="tirocini.jsp">Tirocini</a>
              <a href="leMieOfferte.jsp">Le Mie Offerte</a>
              <a href="offerteChiuse.jsp">Offerte Chiuse</a>
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
                         <h3>Lista del tirocini terminati</h3>
                     </th>
                  </tr>
                  <tr style="background-color: whitesmoke;">
                     <th>ID</th>
                     <th>Titolo Tirocinio</th>
                     <th>Nome</th>
                     <th>Cognome</th>
                     <th>Email Tirocinante</th>
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
                             resultSet = Statement.executeQuery("SELECT * FROM internshiptutor.documento_formativo WHERE email_azienda = '"+str+"' "
                                     + "and approvazione = 'chiusa'");
                             while(resultSet.next()){
                                int id_candidatura = resultSet.getInt("id");
                                String nome = resultSet.getString("nome");
                                String cognome = resultSet.getString("cognome");
                                String titolo = resultSet.getString("titolo");
                                String email_studente = resultSet.getString("email_studente");
                      %>
                      <form action="terminaTirocinio" method="post">
                      <tr>
                        <td><%=id_candidatura%></td>
                        <td><%=titolo%></td>
                        <td><%=nome%></td>
                        <td><%=cognome%></td>
                        <td><%=email_studente%></td>
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
      <div class="setCenter">
        <p><a href="tirocini.jsp">Lista dei tirocini da confermare</a></p>
        <p><a href="tirociniInCorso.jsp">Lista dei tirocini in corso</a></p>
      </div>
        
    </body>
</html>