/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Controller;

import Business.Model.Azienda;
import DAO.AziendaDAO;
import framework.result.HTMLResult;
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
 * @author Davide Simboli
 */
@WebServlet(name = "registrazioneAzienda", urlPatterns = {"/registrazioneAzienda"})
public class registrazioneAzienda extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ragione_sociale = request.getParameter("ragione_sociale");
        String via = request.getParameter("via");
        String città = request.getParameter("citta");
        String provincia = request.getParameter("provincia");
        String cap = request.getParameter("cap");
        String partita_iva = request.getParameter("partita_iva");
        String codice_fiscale = request.getParameter("codice_fiscale");
        String nome_legale_rappr = request.getParameter("nome_legale_rappr");
        String cognome_legale_rappr = request.getParameter("cognome_legale_rappr");
        String nome_responsabile = request.getParameter("nome_responsabile");
        String cognome_responsabile = request.getParameter("cognome_responsabile");
        String telefono_responsabile = request.getParameter("telefono_responsabile");
        String email_responsabile = request.getParameter("email_responsabile");
        String foro = request.getParameter("foro");
        String email_azienda = request.getParameter("email_azienda");
        String pwd = request.getParameter("pwd");
        String pwd_azienda = request.getParameter("pwd_azienda");
        String descrizione = request.getParameter("descrizione");
        String ambito = request.getParameter("ambito");
        
        String indirizzo, sp;
        sp = ", ";
        indirizzo = via + sp + città + sp + provincia + sp + cap;
        
        try{
            if(ragione_sociale.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
            if(via.equals("") || città.equals("") || provincia.equals("--") || cap.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
            if(partita_iva.equals("")){
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
            if(nome_legale_rappr.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
            if(cognome_legale_rappr.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
            if(nome_responsabile.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
            if(cognome_responsabile.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
            if(telefono_responsabile.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
            if(email_responsabile.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
            if(foro.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
            if(email_azienda.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
            if(descrizione.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
            if(ambito.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
            if(pwd.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
            if(pwd_azienda.equals("")){
                String errore = "Compilare tutti i campi!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            }
            
            if(!pwd.equals(pwd_azienda)){
                String errore = "Attenzione! Confermare correttamente la Password!";
                request.setAttribute("err", errore);
                errore_compilazione(request, response);
                return;
            } else{
                send_registrazione(request, response);
            }
            
            System.out.println(ragione_sociale);
            System.out.println(indirizzo);
            System.out.println(partita_iva);
            System.out.println(codice_fiscale);
            System.out.println(nome_legale_rappr);
            System.out.println(cognome_legale_rappr);
            System.out.println(nome_responsabile);
            System.out.println(cognome_responsabile);
            System.out.println(telefono_responsabile);
            System.out.println(email_responsabile);
            System.out.println(foro);
            System.out.println(email_azienda);
            System.out.println(pwd);
            System.out.println(pwd_azienda);
            System.out.println(descrizione);
            System.out.println(ambito);
        
        }catch(IOException ex){
            request.setAttribute("exception", ex);
            action_error(request, response);
        }
        
    }
    
    private void send_registrazione(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        System.out.println("Si procede con la registrazione...");
        String ragione_sociale = request.getParameter("ragione_sociale");
        String via = request.getParameter("via");
        String città = request.getParameter("citta");
        String provincia = request.getParameter("provincia");
        String cap = request.getParameter("cap");
        String partita_iva = request.getParameter("partita_iva");
        String codice_fiscale = request.getParameter("codice_fiscale");
        String nome_legale_rappr = request.getParameter("nome_legale_rappr");
        String cognome_legale_rappr = request.getParameter("cognome_legale_rappr");
        String nome_responsabile = request.getParameter("nome_responsabile");
        String cognome_responsabile = request.getParameter("cognome_responsabile");
        String telefono_responsabile = request.getParameter("telefono_responsabile");
        String email_responsabile = request.getParameter("email_responsabile");
        String foro = request.getParameter("foro");
        String email_azienda = request.getParameter("email_azienda");
        String pwd_azienda = request.getParameter("pwd_azienda");
        String descrizione = request.getParameter("descrizione");
        String ambito = request.getParameter("ambito");
        
        String indirizzo, sp;
        sp = ", ";
        indirizzo = via + sp + città + sp + provincia + sp + cap;
        
        boolean verifica = verificacredenziali(email_azienda);
        if(!verifica){
            System.out.println("Procedo con la registrazione");
            boolean inserimentoAzienda = inserimentoAziendaDB(ragione_sociale, 
                    indirizzo, partita_iva, codice_fiscale, nome_legale_rappr, cognome_legale_rappr,
                    nome_responsabile, cognome_responsabile, telefono_responsabile, email_responsabile,
                    foro, email_azienda, pwd_azienda, descrizione, ambito);
            if(inserimentoAzienda){
                //System.out.println("Registrazione azienda avvenuta con successo");
                String notifica = "L'Azienda  e' stata registrata!\n"
                        + "Riceverai una email a "+ email_azienda + " quando sarà possibile fare l'accesso.";
                request.setAttribute("notify", notifica);
                RequestDispatcher rd = request.getRequestDispatcher("registrazioneAzienda.jsp");
                rd.forward(request, response);
            }
        }else{
            String errore = "l'Azienda è già registrata!";
            request.setAttribute("err", errore);
            errore_compilazione(request, response);
        }
    }
    
    public static boolean verificacredenziali(String email){
        String e = email;
        if(e.equals("")){ //controllo ridondante
            System.out.println("Inserire username e pwd");
            return false;
        }
        //cerca utente nel db con le credenziali inserite dall'utente
        Azienda azienda = CercaAziendaReg(e);
        if(azienda != null){
            return true;
        }
        return false;
    }
    
    
     public static Azienda CercaAziendaReg(String email){
        System.out.println("Cerco l'azienda (model) reg");
        ArrayList<Object> lista = new ArrayList();
        lista.add(email);
        //lista.add(partita_iva);
        Azienda azienda = (Azienda) new AziendaDAO().retrieveReg(lista);
        return azienda;
    }
     
    
    public static boolean inserimentoAziendaDB(String ragione_sociale, String indirizzo,
            String partita_iva, String codice_fiscale, String nome_legale_rappr, String cognome_legale_rappr,
            String nome_responsabile, String cognome_responsabile, String telefono_responsabile,
            String email_responsabile, String foro, String email_azienda, String pwd_azienda, String descrizione, String ambito){
        System.out.println("Procedo all'inserimento (model)");
        ArrayList<Object> lista = new ArrayList<>();
        lista.add(ragione_sociale);
        lista.add(indirizzo);
        lista.add(partita_iva);
        lista.add(codice_fiscale);
        lista.add(nome_legale_rappr);
        lista.add(cognome_legale_rappr);
        lista.add(nome_responsabile);
        lista.add(cognome_responsabile);
        lista.add(telefono_responsabile);
        lista.add(email_responsabile);
        lista.add(foro);
        lista.add(email_azienda);
        lista.add(pwd_azienda);
        lista.add(descrizione);
        lista.add(ambito);
        boolean inserimentoAZdb = new AziendaDAO().insert(lista);
        return inserimentoAZdb;
    }
    
    
    
    
    private void errore_compilazione(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        //System.out.println("Errore");
        RequestDispatcher rd = request.getRequestDispatcher("registrazioneAzienda.jsp");
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

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
