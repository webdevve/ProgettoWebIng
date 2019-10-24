<%--
    Document   : index
    Created on : 5-lug-2019, 11.31.45
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
        <title>Internship Tutor</title>
        <link rel="stylesheet" href="css/header.css" type="text/css"/>
        <link rel="stylesheet" href="css/index.css" type="text/css"/>
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
          <a class="active" href="index.jsp">Home</a>
          <a href="#news">News</a>
          <a href="visualizzaAziende.jsp" >Aziende</a>
          <a href="<%=linkAccedi%>"><%=login%></a>
        </div>
    </div>

    <div class="container">

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
                             resultSet = Statement.executeQuery("SELECT * FROM internshiptutor.offerta join internshiptutor.azienda ON azienda.id = offerta.id_azienda where offerta.stato = 'aperta'");
                             if(!resultSet.next()){
                                 %>
                                 <h1>Al Momento non ci sono offerte disponibili.</h1>
                                 <%
                             }
                             while(resultSet.next()){
                                String titolo = resultSet.getString("titolo");
                                String ragione_sociale = resultSet.getString("ragione_sociale");
                                String descrizione = resultSet.getString("descrizione");
        %>

        <form action="#dettaglioOfferta" method="POST">
        <div class="card">
            <div class="cardContainer">
              <h2><%=ragione_sociale%></h2>
              <h3><%=titolo%></h3>
              <p>
                  <%=descrizione%>
              </p>
              <button type="submit" name="moreInformation" class="button button4" value="">Visualizza l'offerta</button>
            </div>
        </div>
        </form>
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

    </div>
  </body>
</html>
