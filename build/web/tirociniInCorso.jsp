<%-- 
    Document   : tirociniInCorso
    Created on : 5-dic-2019, 14.22.57
    Author     : Davide Simboli
--%>

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
              <a class="active" href="tirocini.jsp">Tirocini</a>
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
                         <h3>Lista dei tirocini in corso</h3>
                     </th>
                  </tr>
                  <tr style="background-color: whitesmoke;">
                     <th>ID</th>
                     <th>Titolo Tirocinio</th>
                     <th>Nome</th>
                     <th>Cognome</th>
                     <th>Documento fine Tir.</th>
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
                                     + "and approvazione = 'in corso'");
                             while(resultSet.next()){
                                int id_candidatura = resultSet.getInt("id");
                                String nome = resultSet.getString("nome");
                                String cognome = resultSet.getString("cognome");
                                String titolo = resultSet.getString("titolo");
                                String email_studente = resultSet.getString("email_studente");
                                String ragione_soc = resultSet.getString("ragione_sociale");
                                String partita_iva = resultSet.getString("partita_iva");
                                String condizione = resultSet.getString("condizione");
                                String data_inizio = resultSet.getString("data_inizio");
                                String data_fine = resultSet.getString("data_fine");
                                String durata = resultSet.getString("durata");
                                String luogo = resultSet.getString("luogo");
                                String obiettivi = resultSet.getString("obiettivi");
                                String nome_responsabile = resultSet.getString("nome_responsabile");
                                String cognome_responsabile = resultSet.getString("cognome_responsabile");
                                String id_studente = resultSet.getString("id_studente");
                                String id_azienda = resultSet.getString("id_azienda");
                      %>
                      <form action="terminaTirocinio" method="post">
                      <input type="hidden" value="<%=id_candidatura%>" name="id"/>
                      <input type="hidden" value="<%=nome%>" name="nome"/>
                      <input type="hidden" value="<%=cognome%>" name="cognome"/>
                      <input type="hidden" value="<%=titolo%>" name="titolo"/>
                      <input type="hidden" value="<%=email_studente%>" name="email_studente"/>
                      <input type="hidden" value="<%=ragione_soc%>" name="ragione_soc"/>  
                      <input type="hidden" value="<%=partita_iva%>" name="partita_iva"/>
                      <input type="hidden" value="<%=condizione%>" name="condizione"/>
                      <input type="hidden" value="<%=data_inizio%>" name="data_inizio"/>
                      <input type="hidden" value="<%=data_fine%>" name="data_fine"/>
                      <input type="hidden" value="<%=durata%>" name="durata"/>
                      <input type="hidden" value="<%=luogo%>" name="luogo"/>
                      <input type="hidden" value="<%=obiettivi%>" name="obiettivi"/>
                      <input type="hidden" value="<%=nome_responsabile%>" name="nome_responsabile"/>
                      <input type="hidden" value="<%=cognome_responsabile%>" name="cognome_responsabile"/>
                      <input type="hidden" value="<%=id_studente%>" name="id_studente"/>
                      <input type="hidden" value="<%=id_azienda%>" name="id_azienda"/>
                      <tr>
                        <td><%=id_candidatura%></td>
                        <td><%=titolo%></td>
                        <td><%=nome%></td>
                        <td><%=cognome%></td>
                        <td>
                           <button type="submit" name="stato" value="terminaTirocinio" id='btncarica'>Compila</button>
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
        <p><a href="tirociniChiusi.jsp">lista del tirocini terminati</a></p>
      </div>
        
    </body>
</html>
