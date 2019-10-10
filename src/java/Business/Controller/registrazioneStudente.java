/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Controller;

import static Business.Controller.registrazioneStudente.verificacredenziali;
import framework.result.HTMLResult;
import Business.Model.Studente;
import DAO.StudenteDAO;
import framework.security.Encryption;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author alesi
 */
@WebServlet(name = "registrazioneStudente", urlPatterns = {"/registrazioneStudente"})
public class registrazioneStudente extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String luogo_nascita = request.getParameter("luogo_nascita");
        String giorno = request.getParameter("giorno");
        String mese = request.getParameter("mese");
        String anno = request.getParameter("anno");
        //String data_nascita = request.getParameter("data_nascita");
        String spazio = "-";
        String data_nascita = anno + spazio + mese + spazio + giorno;
        String residenza = request.getParameter("residenza");
        String codice_fiscale = request.getParameter("codice_fiscale");
        String telefono = request.getParameter("telefono");
        String corso_laurea = request.getParameter("corso_laurea");
        String handicap = request.getParameter("handicap");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String conf_passw = request.getParameter("conf_passw");
        
        
       try{
            if(nome.equals("")){
                String errore = "Compilare tutti i campi nome!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
            if(cognome.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
            if(luogo_nascita.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
        
            if(giorno.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
            switch(giorno){
                case "1":
                case "2":
                case "3":
                case "4":
                case "5":
                case "6":
                case "7":
                case "8":
                case "9":
                case "10":
                case "11":
                case "12":
                case "13":
                case "14":
                case "15":
                case "16":
                case "17":
                case "18":
                case "19":
                case "20":
                case "21":
                case "22":
                case "23":
                case "24":
                case "25":
                case "26":
                case "27":
                case "28":
                case "29":
                case "30":
                case "31": 
                    break;
                default :
                {
                    String errore = "Data non corretta!";
                    request.setAttribute("err", errore);
                    errore_compilazione(request, response);
                    return;
                }
            }
            
            if(mese.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
            
            if(anno.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
            
            if(residenza.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
            if(codice_fiscale.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
            if(telefono.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
            if(corso_laurea.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
            if(handicap.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
            if(email.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
            if(password.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
            
            int lenght = password.length();
            if(lenght<8){
                String errore = "Password troppo corta! Inserire almeno 8 caratteri.";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
            
            char c = password.charAt(0);
            if(!checkPassword(c)){
                String errore = "Il primo carattere non può essere un numero!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
            
            if(!password.equals(conf_passw)){
                String errore = "Attenzione! Confermare correttamente la Password!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            } else {
                send_registrazione(request, response);
            }
            
            System.out.println(nome);
            System.out.println(cognome);
            System.out.println(luogo_nascita);
            System.out.println(codice_fiscale);
            System.out.println(data_nascita);
            System.out.println(residenza);
            System.out.println(telefono);
            System.out.println(corso_laurea);
            System.out.println(handicap);
            System.out.println(email);
            System.out.println(password);
            
        
        }catch(IOException ex){
            request.setAttribute("exception", ex);
            action_error(request, response);
        }
    
    

}
    private boolean checkPassword(char c){
        switch (c){
            case '0': return false;
            case '1': return false;
            case '2': return false;
            case '3': return false;
            case '4': return false;
            case '5': return false;
            case '6': return false;
            case '7': return false;
            case '8': return false;
            case '9': return false;
        }
        return true;
    }

 
  private void send_registrazione(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        System.out.println("Si procede con la registrazione...");
        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String luogo_nascita = request.getParameter("luogo_nascita");
        String giorno = request.getParameter("giorno");
        String mese = request.getParameter("mese");
        String anno = request.getParameter("anno");
        String spazio = "-";
        String data_nascita = anno + spazio + mese + spazio + giorno;
        String residenza = request.getParameter("residenza");
        String codice_fiscale = request.getParameter("codice_fiscale");
        String telefono = request.getParameter("telefono");
        String corso_laurea = request.getParameter("corso_laurea");
        String handicap = request.getParameter("handicap");
        String email = request.getParameter("email");
        String password = Encryption.cripta(request.getParameter("password"));
        
       
        
        boolean verifica = verificacredenziali(email);
        if(!verifica){
            System.out.println("Procedo con la registrazione");
            boolean inserimentoStudente = inserimentoStudenteDB(nome, 
                    cognome, luogo_nascita, data_nascita, codice_fiscale, residenza,         
                    telefono, handicap,corso_laurea, email, password);
            if(inserimentoStudente){
                System.out.println("Registrazione studente avvenuta con successo");
                response.sendRedirect("index.jsp");
            }
        }else{
            String errore = "lo studente è già registrato!";
            request.setAttribute("err", errore);
            errore_compilazione(request, response);
        }
    }
    
    public static boolean verificacredenziali(String email){
        String e = email;
        //String pi = partita_iva;
        if(e.equals("")){ //controllo ridondante
            System.out.println("Inserire username e pwd");
            return false;
        }
        
        Studente studente = CercaStudenteReg(e);
        if(studente != null){
            return true;
        }
        return false;
    }
    
     public static boolean inserimentoStudenteDB(String nome, String cognome,
            String luogo_nascita, String data_nascita, String codice_fiscale, String residenza, String telefono,
            String handicap, String corso_laurea, String email,
            String password){
        System.out.println("Procedo all'inserimento (model)");
        ArrayList<Object> lista = new ArrayList<>();
        lista.add(nome);
        lista.add(cognome);
        lista.add(luogo_nascita);
        lista.add(data_nascita);
        lista.add(codice_fiscale);
        lista.add(residenza);
        lista.add(telefono);
        lista.add(handicap);
        lista.add(corso_laurea);
        lista.add(email);
        lista.add(password);
        
        boolean inserimentoSTdb = new StudenteDAO().insert(lista);
        return inserimentoSTdb;
    }
     
     public static Studente CercaStudenteReg(String email){
        System.out.println("Cerco lo studente (model)");
        ArrayList<Object> lista = new ArrayList();
        lista.add(email);
        Studente studente = (Studente) new StudenteDAO().retrieve(lista);
        return studente;
    }
     
     
     private void errore_compilazione(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        //System.out.println("Errore");
        RequestDispatcher rd = request.getRequestDispatcher("registrazioneStudente.jsp");
        rd.forward(request, response);
    }
 
 private void action_error(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //assumiamo che l'eccezione sia passata tramite gli attributi della request
        //we assume that the exception has been passed using the request attributes
        Exception exception = (Exception) request.getAttribute("exception");
        String message;
        if (exception != null && exception.getMessage() != null) {
            message = exception.getMessage();
        } else {
            message = "Unknown error";
        }
        HTMLResult result = new HTMLResult(getServletContext());
        result.setTitle("ERROR");
        result.setBody("<p>" + message + "</p>");
        try {
            result.activate(request, response);
        } catch (IOException ex) {
            //if error page cannot be sent, try a standard HTTP error message
            //se non possiamo inviare la pagina di errore, proviamo un messaggio di errore HTTP standard
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, ex.getMessage());
        }
    }
    
    
    
}

