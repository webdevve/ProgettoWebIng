<%-- 
    Document   : index
    Created on : 5-lug-2019, 11.31.45
    Author     : Davide Simboli
--%>

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
        String nome = (String)request.getAttribute("name");
        if(nome == null){
            nome = "";
        }
    %>
    <header id="header">
      <nav id="navbar">
        <ul class="nav_header">
          <li class="li_header">
            <a class="selected" href="index.jsp">Home</a>
          </li>
          <li>
            <a href="registrazione.jsp">News</a>
          </li>
          <li>
            <a href="#aziende">Aziende</a>
          </li>
            <li>
            <a href="aggiungiOfferta.jsp">Aggiungi Offerta</a>
          </li>
          <li>
            <a href="login.jsp">Accedi</a>
          </li>
            <li><a href="#"><%=nome%></a></li>
        </ul>
      </nav>
    </header>

    <div class="container">
      <ul class="post">
        <%
            for(int i = 0; i < 12; i++){
        %>
        <li class="item">
            <div class="content">
                <form action="informazioni" method="POST">
                    <section>
                        <h2>Nome Azienda s.r.l.</h2>
                        <h3>Titolo tirocinio</h3>
                    </section>
                    <article>
                        <p>
                            Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione
                            Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione
                            Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione
                            Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione
                            Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione
                        </p>
                    </article>
                    <button type="submit" name="moreInformation" class="button button4" value="">More Informatio</button>
                    
                </form>
            </div>
        </li>
        <%
            }
        %>
      </ul>
    </div>
  </body>
</html>
