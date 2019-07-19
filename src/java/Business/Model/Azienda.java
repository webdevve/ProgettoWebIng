/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Model;

import DAO.AziendaDAO;
import java.util.ArrayList;

/**
 *
 * @author Davide Simboli
 */
public class Azienda {
    public static Azienda instance;
    
    private int id;
    private String ragione_sociale;
    private String indirizzo;
    private String partita_iva;
    private String codice_fiscale;
    private String nome_legale_rappr;
    private String cognome_legale_rappr;
    private String nome_responsabile;
    private String cognome_responsabile;
    private String telefono_responsabile;
    private String email_responsabile;
    private String foro;
    private String email_azienda;
    private String pwd_azienda;
    
    private Azienda(int id, String ragione_sociale, String indirizzo, String partita_iva, 
            String codice_fiscale, String nome_legale_rappr, String cognome_legale_rappr, 
            String nome_responsabile, String cognome_responsabile, String telefono_responsabile,
            String email_responsabile, String foro, String email_azienda, String pwd_azienda){
        this.id = id;
        this.ragione_sociale = ragione_sociale;
        this.indirizzo = indirizzo;
        this.partita_iva = partita_iva;
        this.codice_fiscale = codice_fiscale;
        this.nome_legale_rappr = nome_legale_rappr;
        this.cognome_legale_rappr = cognome_legale_rappr;
        this.nome_responsabile = nome_responsabile;
        this.cognome_responsabile = cognome_responsabile;
        this.telefono_responsabile = telefono_responsabile;
        this.email_responsabile = email_responsabile;
        this.foro = foro;
        this.email_azienda = email_azienda;
        this.pwd_azienda = pwd_azienda;
    }
    
    public int getID(){
        return id;
    }
    
    public void setRagione_sociale(String NewRagione_sociale){
        this.ragione_sociale = NewRagione_sociale;
    }
    
    public String getRagione_sociale(){
        return ragione_sociale;
    }
    
    public void setIndirizzo(String NewIndirizzo){
        this.indirizzo = NewIndirizzo;
    }
    
    public String getIndirizzo(){
        return indirizzo;
    }
    
    public void setPartita_iva(String NewPartita_iva){
        this.partita_iva = NewPartita_iva;
    }
    
    public  String getPartita_iva(){
        return partita_iva;
    }
    
    public void setCodice_fiscale(String NewCodice_fiscale){
        this.codice_fiscale = NewCodice_fiscale;
    }
    
    public String getCodice_fiscale(){
        return codice_fiscale;
    }
    
    public void setNome_legale_rappr(String NewNome_legale_rappr){
        this.nome_legale_rappr = NewNome_legale_rappr;
    }
    
    public String getNome_legale_rappr(){
        return nome_legale_rappr;
    }
    
    public void setCognome_legale_rappr(String NewCognome_legale_rappr){
        this.cognome_legale_rappr = NewCognome_legale_rappr;
    }
    
    public String getCognome_legale_rappr(){
        return cognome_legale_rappr;
    }
    
    public void setNome_responsabile(String NewNome_responsabile){
        this.nome_responsabile = NewNome_responsabile;
    }
    
    public String getNome_responsabile(){
        return nome_responsabile;
    }
    
    public void setCognome_responsabile(String NewCognome_responsabile){
        this.cognome_responsabile = NewCognome_responsabile;
    }
    
    public String getCognome_responsabile(){
        return cognome_responsabile;
    }
    
    public void setTelefono_responsabile(String NewTelefono_responsabile){
        this.telefono_responsabile = NewTelefono_responsabile;
    }
    
    public String getTelefono_responsabile(){
        return telefono_responsabile;
    }
    
    public void setEmail_responsabile(String NewEmail_responsabile){
        this.email_responsabile = NewEmail_responsabile;
    }
    
    public void setForo(String NewForo){
        this.foro = NewForo;
    }
    
    public String getForo(){
        return foro;
    }
    
    public void setEmail_azienda(String NewEmail_azienda){
        this.email_azienda = NewEmail_azienda;
    }
    
    public String getEmail_azienda(){
        return email_azienda;
    }
    
    public void setPwd_azienda(String NewPwd_azienda){
        this.pwd_azienda = NewPwd_azienda;
    }
    
    public String getPwd_azienda(){
        return pwd_azienda;
    }
    
    public static Azienda CercaAzienda(String email, String password){
        System.out.println("Cerco l'azienda (model)");
        ArrayList<Object> lista = new ArrayList();
        lista.add(email);
        lista.add(password);
        Azienda azienda = (Azienda) new AziendaDAO().retrieve(lista);
        return azienda;
    }
    
    public static final synchronized Azienda setInstance(int id, String ragione_sociale, String indirizzo, String partita_iva, 
            String codice_fiscale, String nome_legale_rappr, String cognome_legale_rappr, 
            String nome_responsabile, String cognome_responsabile, String telefono_responsabile,
            String email_responsabile, String foro, String email_azienda, String pwd_azienda) {
	if ( instance == null ) {
            instance = new Azienda(id, ragione_sociale, indirizzo, partita_iva, codice_fiscale,
            nome_legale_rappr, cognome_legale_rappr, nome_responsabile, cognome_responsabile, 
                    telefono_responsabile, email_responsabile, foro, email_azienda, pwd_azienda);
	}
	return instance;
    }
}