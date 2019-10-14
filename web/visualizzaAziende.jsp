<%-- 
    Document   : visualizzaAziende
    Created on : 27-lug-2019, 11.31.45
    Author     : alesi
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <title>Aziende</title>
    <link rel="stylesheet" href="css/index.css" type="text/css"/>
    <link rel="stylesheet" href="css/header.css" type="text/css"/>
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
          <a href="index.jsp">Home</a>
          <a href="#news">News</a>
          <a class="active" href="visualizzaAziende.jsp" >Aziende</a>
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
                             resultSet = Statement.executeQuery("SELECT * FROM internshiptutor.azienda where stato = 'convenzionata'");
                             while(resultSet.next()){
                                String ragione_sociale = resultSet.getString("ragione_sociale");
                                String indirizzo = resultSet.getString("indirizzo");
                                String email_responsabile = resultSet.getString("email_responsabile");
                                String telefono_responsabile = resultSet.getString("telefono_responsabile");
                                String riferimenti = email_responsabile +" "+ telefono_responsabile;
        %>

        <form action="#dettaglioOfferta" method="POST">
            <div class="card">
                <div class="cardContainer">
                  <h2><%=ragione_sociale%></h2>
                  <p>Indirizzo: <%=indirizzo%></p>
                  <p>Riferimenti: <%=riferimenti%></p>
                  <button type="submit" name="moreInformation" class="button button4" value="">Visualizza l'azienda</button>
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
