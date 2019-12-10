<%-- 
    Document   : ricerca
    Created on : 9-dic-2019, 14.55.05
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
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <%
            HttpSession sessione = request.getSession();
            String str = (String)sessione.getAttribute("username");
            request.setAttribute("name", str);
            String nome = (String)request.getAttribute("name");
            String login = "";
            String linkAccedi = "";
            String linkDoc = "";
            String documenti = "";
            if(nome == null){
                //nome = "";
                login = "Accedi";
                linkAccedi = "login.jsp";
                linkDoc = "";
            }else{
                login = nome;
                linkAccedi = "#profilo";
                linkDoc = "documentiStud.jsp";
                documenti = "Documenti";
            }
            String notifica = (String)request.getAttribute("notify");
            if(notifica == null){
              notifica="";
            }
            String errore = (String)request.getAttribute("err");
            if(errore == null){
              errore="";
            }
            String testo = request.getParameter("search");
        %>
    <div class="header">
        <a href="#default" class="logo">InternshipTutor</a>
        <div class="header-right">
          <a class="active" href="index.jsp">Home</a>
          <%if(nome != null){%>
          <a href="<%=linkDoc%>"><%=documenti%></a>
          <%}%>
          <a href="visualizzaAziende.jsp" >Aziende</a>
          <a href="<%=linkAccedi%>"><%=login%></a>
          <a>
            <form action="ricerca.jsp">
              <input type="text" placeholder="Search.." name="search"/>
              <button type="submit" name="search" id="not-button"><i class="fa fa-search"></i></button>
            </form>
          </a>
        </div>
    </div>

    <div class="container">
        <font color="red" id="err">
            <p><%=errore%></p>
          </font>
        <font color="green">
            <p><%=notifica%></p>
          </font>

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
                             resultSet = Statement.executeQuery("select * from internshiptutor.offerta join internshiptutor.azienda on offerta.id_azienda = azienda.id "+
                                "where (luogo like '%"+testo+"%' or durata like '%"+testo+"%' or obiettivi like '%"+testo+"%' or offerta.descrizione like '%"+testo+"%' "
                                        + "or titolo like '%"+testo+"%' or ragione_sociale like '%"+testo+"%') and azienda.stato = 'convenzionata'");
                             
                             while(resultSet.next()){
                                String titolo = resultSet.getString("titolo");
                                String ragione_sociale = resultSet.getString("ragione_sociale");
                                String descrizione = resultSet.getString("descrizione");
                                int id = resultSet.getInt("id");
                                String luogo = resultSet.getString("luogo");
        %>

        <form action="dettaglioOfferta" method="POST">
        <div class="card">
            <div class="cardContainer">
              <h2><%=ragione_sociale%></h2>
              <h3><%=titolo%></h3>
              <p>
                  <%=descrizione%>
              </p>
              <p>Luogo: <%=luogo%></p>
              <input type="hidden" value="<%=id%>" name="moreInformation"/>
              <button type="submit" name="" class="button button4" value="">Visualizza l'offerta</button>
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