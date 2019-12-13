<%-- 
   Document   : login
   Created on : 4-lug-2019, 19.53.38
   Author     : Davide Simboli
   --%>
<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
      <meta charset="utf-8">
      <title>Registrazione Studente</title>
      <link rel="stylesheet" href="css/header.css" type="text/css"/>
      <link rel="stylesheet" type="text/css" href="css/loginUtil.css">
      <link rel="stylesheet" type="text/css" href="css/loginMain.css">
   </head>
   <body>
      <%
         String errore = (String)request.getAttribute("err");
         if(errore == null){
           errore="";
         }
         HttpSession sessione = request.getSession();
        if(sessione!=null){
            sessione.invalidate();
        }
         %>
      <div class="header" id="header">
         <a href="#default" class="logo">InternshipTutor</a>
         <div class="header-right">
            <a href="index.jsp">Home</a>
            <a href="visualizzaAziende.jsp" >Aziende</a>
            <a href="login.jsp">Accedi</a>
         </div>
      </div>
      <div class="limiter">
         <div class="container-login100">
            <div class="wrap-login100 p-b-90 p-t-50">
               <font color="red" id="err">
                  <p><%=errore%></p>
               </font>
               <form class="login100-form flex-sb flex-w" action="registrazioneStudente" method="post">
                  <span class="login100-form-title">Registrazione Studente</span>
                  <div class="wrap-input100 m-b-16">
                     <input class="input100" size="30" type="text" name="nome" placeholder="Nome" maxlength="200" required/>
                     <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 m-b-16">
                     <input class="input100" size="30" type="text" name="cognome" placeholder="Cognome" maxlength="100" required/>
                     <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 m-b-16">
                     <input class="input100" size="30" type="text" name="luogo_nascita" placeholder="Luogo di nascita" maxlength="92" required/>
                     <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 m-b-16">
                     <input class="input100" size="2" type="number" name="giorno" placeholder="Giorno (gg)" required min="1" max="31"/>
                     <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 m-b-16">
                     <input class="input100" size="2" type="number" name="mese" placeholder="Mese (mm)" required min="1" max="12"/> 
                     <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 m-b-16">
                     <input class="input100" size="4" type="number" name="anno" placeholder="Anno (aaaa)" required min="1900"/>
                     <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 m-b-16">
                     <input class="input100" size="30" type="text" name="codice_fiscale" placeholder="CF" minlength="16" maxlength="16" required style="text-transform: uppercase;"/>
                     <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 m-b-16">
                     <input class="input100" size="30" type="text" name="residenza" placeholder="Residenza" maxlength="100" required/>
                     <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 m-b-16">
                     <input class="input100" size="30" type="tel" name="telefono" placeholder="Telefono" maxlength="100" required/>
                     <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 m-b-16">
                     <input class="input100" size="30" type="text" name="corso_laurea" placeholder="Corso di laurea" maxlength="100" required/>
                     <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 m-b-16">
                     <table id="tableStudent">
                        <tr>
                           <td>
                              <p style="font-family: 'Ubuntu-Bold'; color: '#403866';">Handicap </p>
                           </td>
                           <td>
                              <input size="30" type="radio" value="si" name="handicap"  required/>Si
                              <br>
                              <input size="30" type="radio" value="no" name="handicap"  required/>No
                           </td>
                        </tr>
                     </table>
                     <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 m-b-16">
                     <input class="input100" size="30" type="email" name="email" placeholder="Email" maxlength="50" required/>
                     <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 m-b-16">
                     <input class="input100" size="30" type="password" name="password" placeholder="Password" minlength="6" maxlength="100" required/>
                     <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 m-b-16">
                     <input class="input100" size="30" type="password" name="conf_passw" placeholder="Conferma Password" minlength="8" maxlength="50" required/>
                     <span class="focus-input100"></span>
                  </div>
                  <div class="container-login100-form-btn m-t-17">
                     <input type="submit" name="Registrati" value="Registrati" class="login100-form-btn"/>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </body>
</html>