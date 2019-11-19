<%-- 
    Document   : listastudentiofferta
    Created on : 19-nov-2019, 10.45.51
    Author     : anton
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <link rel="stylesheet" href="css/header.css" type="text/css"/>
    <link rel="stylesheet" href="css/listastudentiofferta.css" type="text/css"/>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista Studenti</title>
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
              <a class="active" href="#news">Le Mie Offerte</a>
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
                         <h3>Studenti Candidati all'Offerta</h3>
                     </th>
                  </tr>
                   
                   <body>

                                              
<table id="customers">
    <tr coolspan="3">
        <br></br>
        Titolo Offerta
        <br></br>
    </tr>
  <tr>
    <th>Nome</th>
    <th>Cognome</th>
    <th>Codice Fiscale</th>
  </tr>
  <tr>
    <td>Alfreds Futterkiste</td>
    <td>Maria Anders</td>
    <td>Germany</td>
  </tr>
</table>

</body>
