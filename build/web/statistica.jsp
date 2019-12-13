<%-- 
    Document   : statistica
    Created on : 11-dic-2019, 12.03.36
    Author     : Davide Simboli
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="Business.Model.Recensione"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Intership Tutor</title>
        <link rel="stylesheet" href="css/header.css" type="text/css"/>
        <link rel="stylesheet" href="css/index.css" type="text/css"/>
        <link rel="stylesheet" href="css/admin.css" type="text/css"/>
    </head>
    <body onload="draw()">
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
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>
                   
        <script type="text/javascript">
            function draw() {
            let myCanvas = document.getElementById('myCanvas').getContext('2d');
            let myLabels = [];
            let myData = [];
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
                             resultSet = Statement.executeQuery("SELECT azienda.ragione_sociale, azienda.recensione "
                                     + "FROM internshiptutor.azienda "
                                     + "where azienda.stato = 'convenzionata' "
                                     + "order by recensione desc");
                             while(resultSet.next()){
                                 String ragioneSoc = resultSet.getString("ragione_sociale");
                                 double val = resultSet.getDouble("recensione");
                                 %>
                   myLabels.push("<%=ragioneSoc%>");
                   myData.push(<%=val%>);
                                <%
                                count += 1;
                                if(count>4){break;}
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
            

            let chart = new Chart(myCanvas, {
              type: 'bar',
              data: {
                labels: myLabels,
                datasets: [{
                  label: "Valutazione",
                  data: myData,
                  backgroundColor: [
                    '#3399ff',
                    '#4da6ff',
                    '#66b3ff',
                    '#80bfff',
                    '#99ccff'
                  ]
                }]
              },
              options: {
                title: {
                  display: true,
                  text: "Aziende con migliori valutazioni",
                  fontSize: 25
                },
                legend: {
                  display: true,
                  position: 'right'
                }
              }
            });
          }

        </script>
        
         
      <div class="header">
         <a href="#default" class="logo">InternshipTutor</a>
         <div class="header-right">
            <a href="admin.jsp">Home</a>
            <a href="confermaConvenzione.jsp">Convenzioni da Confermare</a>
            <a href="aziendeConvenzionate.jsp" >Convenzioni</a>
            <a class="active" href="statistica.jsp">Statistiche</a>
            <a href="javascript:{}" onclick="document.getElementById('my_form').submit(); return false;">Logout</a>
         </div>
      </div>
        <form action="logout" method="post" id="my_form"></form>
        <%if(str!=null){%>
        <div class="centra"><img src="icon/user.ico"/><%=str%></div>
        <%}%>
         <font color="red" id="err">
            <p><%=errore%></p>
          </font>
          <font color="green">
            <p><%=notifica%></p>
          </font>
       <div class="container">
         <div class="cardAdmin" style="overflow-x:auto;">
            <div class="cardContainer">
              <canvas id="myCanvas"></canvas>
            </div>
         </div>
      </div>
    </body>
</html>
