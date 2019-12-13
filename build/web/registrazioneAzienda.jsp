<%-- 
   Document   : registrazioneAzienda
   Created on : 4-lug-2019, 19.53.38
   Author     : Davide Simboli
   --%>
<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
      <meta charset="utf-8">
      <title>Registrazione Azienda</title>
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
         String notifica = (String)request.getAttribute("notify");
         if(notifica == null){
           notifica="";
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
               <font color="green">
                <p><%=notifica%></p>
               </font>
               <form class="login100-form flex-sb flex-w" action="registrazioneAzienda" method="post">
                  <span class="login100-form-title">Registrazione Azienda</span>
                  <div class="wrap-input100 m-b-16">
                     <input class="input100" size="30" type="text" name="ragione_sociale" placeholder="Ragione Sociale" maxlength="200" required/>
                     <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 m-b-16">
                     <input class="input100" size="30" type="text" name="via" placeholder="Via" maxlength="100" required/>
                     <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 m-b-16">
                     <input class="input100" size="30" type="text" name="citta" placeholder="Città" maxlength="92" required/>
                     <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 m-b-16">
                     <select class="input100" name="provincia">
                        <option value="--">Provincia</option>
                        <option value="AG">Agrigento</option>
                        <option value="AL">Alessandria</option>
                        <option value="AN">Ancona</option>
                        <option value="AO">Aosta</option>
                        <option value="AQ">L'Aquila</option>
                        <option value="AR">Arezzo</option>
                        <option value="AP">Ascoli-Piceno</option>
                        <option value="AT">Asti</option>
                        <option value="AV">Avellino</option>
                        <option value="BA">Bari</option>
                        <option value="BT">Barletta-Andria-Trani</option>
                        <option value="BL">Belluno</option>
                        <option value="BN">Benevento</option>
                        <option value="BG">Bergamo</option>
                        <option value="BI">Biella</option>
                        <option value="BO">Bologna</option>
                        <option value="BZ">Bolzano</option>
                        <option value="BS">Brescia</option>
                        <option value="BR">Brindisi</option>
                        <option value="CA">Cagliari</option>
                        <option value="CL">Caltanissetta</option>
                        <option value="CB">Campobasso</option>
                        <option value="CI">Carbonia Iglesias</option>
                        <option value="CE">Caserta</option>
                        <option value="CT">Catania</option>
                        <option value="CZ">Catanzaro</option>
                        <option value="CH">Chieti</option>
                        <option value="CO">Como</option>
                        <option value="CS">Cosenza</option>
                        <option value="CR">Cremona</option>
                        <option value="KR">Crotone</option>
                        <option value="CN">Cuneo</option>
                        <option value="EN">Enna</option>
                        <option value="FM">Fermo</option>
                        <option value="FE">Ferrara</option>
                        <option value="FI">Firenze</option>
                        <option value="FG">Foggia</option>
                        <option value="FC">Forlì-Cesena</option>
                        <option value="FR">Frosinone</option>
                        <option value="GE">Genova</option>
                        <option value="GO">Gorizia</option>
                        <option value="GR">Grosseto</option>
                        <option value="IM">Imperia</option>
                        <option value="IS">Isernia</option>
                        <option value="SP">La-spezia</option>
                        <option value="LT">Latina</option>
                        <option value="LE">Lecce</option>
                        <option value="LC">Lecco</option>
                        <option value="LI">Livorno</option>
                        <option value="LO">Lodi</option>
                        <option value="LU">Lucca</option>
                        <option value="MC">Macerata</option>
                        <option value="MN">Mantova</option>
                        <option value="MS">Massa-Carrara</option>
                        <option value="MT">Matera</option>
                        <option value="VS">Medio Campidano</option>
                        <option value="ME">Messina</option>
                        <option value="MI">Milano</option>
                        <option value="MO">Modena</option>
                        <option value="MB">Monza-Brianza</option>
                        <option value="NA">Napoli</option>
                        <option value="NO">Novara</option>
                        <option value="NU">Nuoro</option>
                        <option value="OG">Ogliastra</option>
                        <option value="OT">Olvia Tempio</option>
                        <option value="OR">Oristano</option>
                        <option value="PD">Padova</option>
                        <option value="PA">Palermo</option>
                        <option value="PR">Parma</option>
                        <option value="PV">Pavia</option>
                        <option value="PG">Perugia</option>
                        <option value="PU">Pesaro-Urbino</option>
                        <option value="PE">Pescara</option>
                        <option value="PC">Piacenza</option>
                        <option value="PI">Pisa</option>
                        <option value="PT">Pistoia</option>
                        <option value="PN">Pordenone</option>
                        <option value="PZ">Potenza</option>
                        <option value="PO">Prato</option>
                        <option value="RG">Ragusa</option>
                        <option value="RA">Ravenna</option>
                        <option value="RC">Reggio-Calabria</option>
                        <option value="RE">Reggio-Emilia</option>
                        <option value="RI">Rieti</option>
                        <option value="RN">Rimini</option>
                        <option value="RM">Roma</option>
                        <option value="RO">Rovigo</option>
                        <option value="SA">Salerno</option>
                        <option value="SS">Sassari</option>
                        <option value="SV">Savona</option>
                        <option value="SI">Siena</option>
                        <option value="SR">Siragusa</option>
                        <option value="SO">Sondrio</option>
                        <option value="TA">Taranto</option>
                        <option value="TE">Teramo</option>
                        <option value="TR">Terni</option>
                        <option value="TO">Torino</option>
                        <option value="TP">Trapani</option>
                        <option value="TN">Trento</option>
                        <option value="TV">Treviso</option>
                        <option value="TS">Trieste</option>
                        <option value="UD">Udine</option>
                        <option value="VA">Varese</option>
                        <option value="VE">Venezia</option>
                        <option value="VB">Verbania</option>
                        <option value="VC">Vercelli</option>
                        <option value="VR">Verona</option>
                        <option value="VV">Vibo-Valentia</option>
                        <option value="VI">Vicenza</option>
                        <option value="VT">Viterbo</option>
                     </select>
                     <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 m-b-16">
                     <input class="input100" size="30" type="text" name="cap" placeholder="CAP" minlength="5" maxlength="5" required/>
                     <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 m-b-16">
                     <input class="input100" size="30" type="text" name="partita_iva" placeholder="Partita IVA" minlength="11" maxlength="11" required/>
                     <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 m-b-16">
                     <input class="input100" size="30" type="text" name="codice_fiscale" placeholder="CF" minlength="16" maxlength="16" required style="text-transform: uppercase;"/>
                     <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 m-b-16">
                     <input class="input100" size="30" type="text" name="nome_legale_rappr" placeholder="Nome Legale Rapp." maxlength="100" required/>
                     <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 m-b-16">
                     <input class="input100" size="30" type="text" name="cognome_legale_rappr" placeholder="Cognome Legale Rapp." maxlength="100" required/>
                     <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 m-b-16">
                     <input class="input100" size="30" type="text" name="nome_responsabile" placeholder="Nome Responsabile" maxlength="100" required/>
                     <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 m-b-16">
                     <input class="input100" size="30" type="text" name="cognome_responsabile" placeholder="Cognome Responsabile" maxlength="100" required/>
                     <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 m-b-16">
                     <input class="input100" size="30" type="tel" name="telefono_responsabile" placeholder="Telefono Responsabile" maxlength="15" required/>
                     <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 m-b-16">
                     <input class="input100" size="30" type="email" name="email_responsabile" placeholder="Email Responsabile" maxlength="100" required/>
                     <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 m-b-16">
                     <input class="input100" size="30" type="text" name="foro" placeholder="Foro Competente" maxlength="150" required/>
                     <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 m-b-16">
                     <input class="input100" size="30" type="email" name="email_azienda" placeholder="Email Azienda" maxlength="100" required/>
                     <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 m-b-16">
                     <input class="input100" size="30" type="password" name="pwd" placeholder="Password" minlength="8" maxlength="50" required/>
                     <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 m-b-16">
                     <input class="input100" size="30" type="password" name="pwd_azienda" placeholder="Conferma Password" minlength="8" maxlength="50" required/>
                     <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 m-b-16">
                      <textarea rows="4" cols="50" name="descrizione" class="input100" placeholder="Breve descrizione di alto livello dei progetti formativi di interesse"></textarea>
                     <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 m-b-16">
                     <input class="input100" size="30" type="text" name="ambito" placeholder="Ambito di Interesse" maxlength="150" required/>
                     <span class="focus-input100"></span>
                  </div>
                  <div class="container-login100-form-btn m-t-17">
                      <input type="submit" name="Registrati" value="Registrati" class="login100-form-btn"/>
                  </div>
               </form>
               <br>
            </div>
         </div>
      </div>
   </body>
</html>