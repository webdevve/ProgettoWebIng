<%-- 
    Document   : azienda
    Created on : 22-ago-2019, 16.22.51
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
        <title>Azienda</title>
        <link rel="stylesheet" href="css/header.css" type="text/css"/>
        <link rel="stylesheet" href="css/index.css" type="text/css"/>
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
              <a class="active" href="azienda.jsp">Home</a>
              <a href="#news">Le Mie Offerte</a>
              <a href="#offerteChiuse">Offerte Chiuse</a>
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
            <div class="card">
                <div class="cardContainer">
                    <form action="addOfferta" method="post">
                        <%
                     Connection connect = null;
                     Statement Statement = null;
                     ResultSet resultSet = null;
                         try{
                             Class.forName("com.mysql.jdbc.Driver");
                             connect = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/internshiptutor",
                     "root", "ciao");
                             System.out.println("Connessione Stabilita!");
                             Statement = connect.createStatement();
                             resultSet = Statement.executeQuery("SELECT * FROM internshiptutor.azienda where email_azienda = '"+str+"'");
                             while(resultSet.next()){
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
                  <%
                     }
                     connect.close();
                     Statement.close();
                     resultSet.close();
                     
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
                    <h2>Inserisci una nuova Offerta di Tirocinio</h2>
                    <table>
                        <tr>
                            <td>Titolo Tirocinio: </td>
                            <td><input type="text" name="titoloTirocinio" placeholder="Titolo Tirocinio" required/></td>
                        </tr>
                        <tr>
                            <td>Descrizione Tirocinio: </td>
                            <td><textarea name="descrizioneTirocinio" placeholder="Descrizione..." required></textarea></td>
                        </tr>
                        <tr>
                            <td>Luogo: </td>
                            <td><input type="text" name="luogo" placeholder="Luogo" required/></td>
                        </tr>
                        <tr>
                            <td>Orari: </td>
                            <td><input type="text" name="orari" placeholder="Orari" required/></td>
                        </tr>
                        <tr>
                            <td>Durata: </td>
                            <td><input type="text" name="durata" placeholder="Durata" required/></td>
                        </tr>
                        <tr>
                            <td>Obiettivi: </td>
                            <td><textarea name="obiettivi" placeholder="Obiettivi" required></textarea></td>
                        </tr>
                        <tr>
                            <td>Modalità: </td>
                            <td>
                                <select name="modalita">
                                    <option value="team aziendale">Team Aziendale</option>
                                    <option value="in remoto">Remoto</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Rimborsi: </td>
                            <td>
                                <select name="rimborsi">
                                    <option value="si">Si</option>
                                    <option value="no">No</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                    <button type="submit" name="addOfferta" class="button button4" value="" style="background-color: greenyellow;">Conferma</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
