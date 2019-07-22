/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Controller;

import static Business.Controller.registrazioneStudente.verificacredenziali;
import Business.Model.Azienda;
import framework.result.HTMLResult;
import Business.Model.Studente;
import DAO.StudenteDAO;
import java.io.IOException;
import java.sql.Date;
import java.io.PrintWriter;
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
    
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String luogo_nascita = request.getParameter("luogo_nascita");
        String data_nascita = request.getParameter("data_nascita");
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
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
            }
            if(cognome.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
            }
            if(luogo_nascita.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
            }
        
            if(data_nascita.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
            }
            if(residenza.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
            }
            if(codice_fiscale.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
            }
            if(telefono.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
            }
            if(corso_laurea.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
            }
            if(handicap.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
            }
            if(email.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
            }
            if(password.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
            }
            
            if(!password.equals(conf_passw)){
                String errore = "Attenzione! Confermare correttamente la Password!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
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
            
            
            send_registrazione(request, response);
        
        }catch(IOException ex){
            request.setAttribute("exception", ex);
            action_error(request, response);
        }
    
    

}  

 
  private void send_registrazione(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        System.out.println("Si procede con la registrazione...");
        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String luogo_nascita = request.getParameter("luogo_nascita");
        String data_nascita = request.getParameter("data_nascita");
        String residenza = request.getParameter("residenza");
        String codice_fiscale = request.getParameter("codice_fiscale");
        String telefono = request.getParameter("telefono");
        String corso_laurea = request.getParameter("corso_laurea");
        String handicap = request.getParameter("handicap");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String conf_passw = request.getParameter("conf_passw");
        
       
        
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

