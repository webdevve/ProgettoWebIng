/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Model;

/**
 *
 * @author Davide Simboli
 */
public class offertaAzienda {
    private static offertaAzienda instance;
    private int id;
    private String titolo;
    private String luogo;
    private String durata;
    private String descrizione;
    private String modalita;
    private String orari;
    private String rimborsi;
    private String obiettivi;
    private String ragioneSociale;
    private String indirizzo;
    
    public offertaAzienda(int id, String titolo, String luogo, String durata, String descrizione,
            String modalita, String orari, String rimborsi, String obiettivi, String ragioneSociale, String indirizzo){
        this.id = id;
        this.titolo = titolo;
        this.luogo = luogo;
        this.durata = durata;
        this.descrizione = descrizione;
        this.modalita = modalita;
        this.orari = orari;
        this.rimborsi = rimborsi;
        this.obiettivi = obiettivi;
        this.ragioneSociale = ragioneSociale;
        this.indirizzo = indirizzo;
    }
    
    public int getId(){
        return id;
    }
    public String getTitolo(){
        return titolo;
    }
    public void setTitolo(String titolo){
        this.titolo = titolo;
    }
    public String getLuogo(){
        return luogo;
    }
    public void setLuogo(String luogo){
        this.luogo = luogo;
    }
    public String getDurata(){
        return durata;
    }
    public void setDurata(String durata){
        this.durata = durata;
    }
    public String getDescrizione(){
        return descrizione;
    }
    public void setDescrizione(String descrizione){
        this.descrizione = descrizione;
    }
    public String getModalita(){
        return modalita;
    }
    public void setModalita(String modalita){
        this.modalita = modalita;
    }
    public String getOrari(){
        return orari;
    }
    public void setOrari(String orari){
        this.orari = orari;
    }
    public String getRimborsi(){
        return rimborsi;
    }
    public void setRimborsi(String rimborsi){
        this.rimborsi = rimborsi;
    }
    public String getObiettivi(){
        return obiettivi;
    }
    public void setObiettivi(String obiettivi){
        this.obiettivi = obiettivi;
    }
    public String getRagioneSociale(){
        return ragioneSociale;
    }
    public void setRagioneSociale(String ragioneSociale){
        this.ragioneSociale = ragioneSociale;
    }
    public String getIndirizzo(){
        return indirizzo;
    }
    public void setIndirizzo(String indirizzo){
        this.indirizzo = indirizzo;
    }
    public static final synchronized offertaAzienda setInstance(int id, String titolo, String luogo, String durata,
            String descrizione, String modalita, String orari, String rimborsi, String obiettivi, String ragioneSociale,
            String indirizzo) {
	if ( instance == null ) {
            instance = new offertaAzienda(id, titolo, luogo, durata, descrizione, modalita, orari, rimborsi, obiettivi,
            ragioneSociale, indirizzo);
	}
	return instance;
    }
}
    
