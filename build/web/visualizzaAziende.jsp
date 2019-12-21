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
                linkDoc = "#";
            }else{
                login = nome;
                linkAccedi = "#profilo";
                linkDoc = "documentiStud.jsp";
                documenti = "Documenti";
            }
    %> 
    <div class="header">
        <a href="#default" class="logo">InternshipTutor</a>
        <div class="header-right">
          <a href="index.jsp">Home</a>
          <%if(nome != null){%>
          <a href="<%=linkDoc%>"><%=documenti%></a>
          <a href="recensioni.jsp">Recensioni</a>
          <%}%>
          <a class="active" href="visualizzaAziende.jsp" >Aziende</a>
          <%if(str==null){%>
          <a href="<%=linkAccedi%>"><%=login%></a>
          <%}else{%>
          <a href="javascript:{}" onclick="document.getElementById('my_form').submit(); return false;">Logout</a>
          <%}%>
          <a>
            <form action="ricerca.jsp">
              <input type="text" placeholder="Search.." name="search"/>
              <button type="submit" name="search" id="not-button"><i class="fa fa-search"></i></button>
            </form>
          </a>
        </div>
    </div>
<form action="logout" method="post" id="my_form"></form>
    <%if(str!=null){%>
    <div class="centra"><img src="icon/user.ico"/><%=str%></div>
    <%}%>
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
                                double voto = resultSet.getDouble("recensione");
        %>

        <form action="#dettaglioOfferta" method="POST">
            <div class="card">
                <div class="cardContainer">
                  <h2><%=ragione_sociale%></h2>
                  <%
                  if(voto<0.5){
              %>
              Nessuna valutazione
              <%
                  }
                  if(voto>=0.5 && voto < 1.5){
              %>
              <img src="icon/star.ico" id="star"/> <%=voto%>
              <%
                  }
                  if(voto>=1.5 && voto < 2.5){
              %>
              <img src="icon/star.ico" id="star"/>
              <img src="icon/star.ico" id="star"/> <%=voto%>
              <%
                  }
                  if(voto>=2.5 && voto < 3.5){
              %>
              <img src="icon/star.ico" id="star"/>
              <img src="icon/star.ico" id="star"/>
              <img src="icon/star.ico" id="star"/> <%=voto%>
              <%
                  }
                  if(voto>=3.5 && voto < 4.5){
              %>
              <img src="icon/star.ico" id="star"/>
              <img src="icon/star.ico" id="star"/>
              <img src="icon/star.ico" id="star"/>
              <img src="icon/star.ico" id="star"/> <%=voto%>
              <%
                  }
                  if(voto>=4.5){
              %>
              <img src="icon/star.ico" id="star"/>
              <img src="icon/star.ico" id="star"/>
              <img src="icon/star.ico" id="star"/>
              <img src="icon/star.ico" id="star"/>
              <img src="icon/star.ico" id="star"/> <%=voto%>
              <%
                  }
              %>
                  <p>Indirizzo: <%=indirizzo%></p>
                  <p>Riferimenti: <%=riferimenti%></p>
                  <!--<button type="submit" name="moreInformation" class="button button4" value="">Visualizza l'azienda</button>-->
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
