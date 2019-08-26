<%-- 
    Document   : profilo
    Created on : 26-ago-2019, 13.00.36
    Author     : Davide Simboli
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profilo</title>
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
        %>
    <div class="header">
        <a href="#default" class="logo">InternshipTutor</a>
        <div class="header-right">
          <a class="active" href="index.jsp">Home</a>
          <a href="#news">News</a>
          <a href="visualizzaAziende.jsp" >Aziende</a>
          <a href="#profilo"><%=str%></a>
        </div>
    </div>
    </body>
</html>
