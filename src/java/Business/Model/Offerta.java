/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Model;

/**
 *
 * @author alesi
 */
public class Offerta {

    private static Offerta instance;
    
    private int id;
    private String titolo;
    private String descrizione;
    private String luogo;
    private String orari;
    private String durata;
    private String obiettivi;
    private String modalità;
    private String rimborsi;
    private int id_azienda; //enum

    public Offerta(int id, String titolo, String descrizione, String luogo, String orari,
                    String durata, String obiettivi, String modalità, String rimborsi, int id_azienda) {
        this.id = id;
        this.titolo = titolo;
        this.descrizione = descrizione;
        this.luogo = luogo;
        this.orari = orari;
        this.durata = obiettivi;
        this.obiettivi = obiettivi;
        this.modalità = rimborsi;
        this.rimborsi = rimborsi;
        this.id_azienda = id_azienda;
        
    }
    
    public int getID(){
        return id;
    }
    
    public void setTitolo(String NewTitolo){
        this.titolo = NewTitolo;
    }
    
    public String getTitolo(){
        return titolo;
    }
    
    public void setDescrizione(String NewDescrizione){
        this.descrizione = NewDescrizione;
    }
    
    public String getDescrizione(){
        return descrizione;
    }
    
    public void setLuogo(String NewLuogo){
        this.luogo = NewLuogo;
    }
    
    public String getLuogo(){
        return luogo;
    }
    
    public void setOrari(String NewOrari){
        this.orari = NewOrari;
    }
    
    public String getOrari(){
        return orari;
    }
    
    public void setDurata(String NewDurata){
        this.durata = NewDurata;
    }
    
    public String getDurata(){
        return durata;
    }
    
    public void setObiettivi(String NewObiettivi){
        this.obiettivi = NewObiettivi;
    }
    
    public String getObiettivi(){
        return obiettivi;
    }
    
    public void setModalità(String NewModalità){
        this.modalità = NewModalità;
    }
    
    public String getModalità(){
        return modalità;
    }
    
    public void setRimborsi(String NewRimborsi){
        this.rimborsi = NewRimborsi;
    }
    
    public String getRimborsi(){
        return rimborsi;
    }
    
    public void setIdAzienda(int NewIdAzienda){
        this.id_azienda = NewIdAzienda;
    }
    
    public int getIdAzienda(){
        return id_azienda;
    }
    
    
    public static final synchronized Offerta setInstance(int id, String titolo, String descrizione, String luogo, 
            String orari,  String durata, String obiettivi, String modalità, String rimborsi,
            int id_azienda) {
	if ( instance == null ) {
            instance = new Offerta(id, titolo, descrizione, luogo, orari, durata,
            obiettivi, modalità, rimborsi, id_azienda);
	}
	return instance;
    }
}
