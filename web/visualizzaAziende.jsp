<%-- 
    Document   : visualizzaAziende
    Created on : 27-lug-2019, 11.31.45
    Author     : alesi
--%>

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
            for(int i = 0; i < 12; i++){
        %>

        <form action="#dettaglioOfferta" method="POST">
            <div class="card">
                <div class="cardContainer">
                  <h2>Nome Azienda <%=i%> s.r.l.</h2>
                  <p>Indirizzo: </p>
                  <button type="submit" name="moreInformation" class="button button4" value="">Visualizza l'azienda</button>
                </div>
            </div>
        </form>
        <%
            }
        %>

    </div>
  </body>
</html>
