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
public class Candidatura {
    private String condizioneAttualeStudente;
	private String idStudente;
	private String handicap;
	private String startDate;
	private String endDate;
	private String cfu;
	private String tutoreUniversitario;
	private String telefonoTutoreUni;
	private String emailTutoreUni;
	private String dataRichiesta;
	private String email_responsabile_azienda;
	private String emailStudente;
	private String idOfferta;
	private String ragioneSociale;
	private String nomeStudente;
	private String titoloOfferta;
        private String luogoNascita;
        private String dataNascita;
        private String residenza;
        private String telefonoStudente;
        private String approvazione;
        private String documento;
        private int id;
        private String cf;
        private String luogoTirocinio;
        private String ambito;
        private String orari;
        private String ore;
        private String tutoreAziendale;
        private String telefonoTutoreAz;
        private String email_responsabile;
        private String obiettivi;
        private String modalita;
        private String rimborsi;
	
	public Candidatura(String condizioneAttualeStudente,  String handicap, String startDate,
			String endDate, String cfu, String tutoreUniversitario, String telefonoTutoreUni, String emailTutoreUni,
			String dataRichiesta, String email_responsabile_azienda, String emailStudente, String idOfferta,
			String ragioneSociale, String nomeStudente, String titoloOfferta, String luogoNascita,
                        String dataNascita, String residenza, String telefonoStudente, String cf, 
                        String luogoTirocinio, String ambito, String orari, String ore, String tutoreAziendale,
                        String telefonoTutoreAz, String email_responsabile, String obiettivi,
                        String modalita, String rimborsi) {
		this.condizioneAttualeStudente = condizioneAttualeStudente;
		//this.idStudente = idStudente;
		this.handicap = handicap;
		this.startDate = startDate;
		this.endDate = endDate;
		this.cfu = cfu;
		this.tutoreUniversitario = tutoreUniversitario;
		this.telefonoTutoreUni = telefonoTutoreUni;
		this.emailTutoreUni = emailTutoreUni;
		this.dataRichiesta = dataRichiesta;
		this.email_responsabile_azienda = email_responsabile_azienda;
		this.emailStudente = emailStudente;
		this.idOfferta = idOfferta;
		this.ragioneSociale = ragioneSociale;
		this.nomeStudente = nomeStudente;
		this.titoloOfferta = titoloOfferta;
                this.luogoNascita = luogoNascita;
                this.dataNascita = dataNascita;
                this.residenza = residenza;
                this.telefonoStudente = telefonoStudente;
                this.cf = cf;
                this.luogoTirocinio = luogoTirocinio;
                this.ambito = ambito;
                this.orari = orari;
                this.ore = ore;
                this.tutoreAziendale = tutoreAziendale;
                this.telefonoTutoreAz = telefonoTutoreAz;
                this.email_responsabile = email_responsabile;
                this.obiettivi = obiettivi;
                this.modalita = modalita;
                this.rimborsi = rimborsi;
	}
        public String getRimborsi(){
            return rimborsi;
        }
        public void setRimborsi(String rimborsi){
            this.rimborsi = rimborsi;
        }
        
        public String getModalita(){
            return modalita;
        }
        public void setModalita(String modalita){
            this.modalita = modalita;
        }
        public String getObiettivi(){
            return obiettivi;
        }
        public void setObiettivi(String obiettivi){
            this.obiettivi = obiettivi;
        }
        public String getEmailTutAz(){
            return email_responsabile;
        }
        public void setEmailAz(String email_responsabile){
            this.email_responsabile = email_responsabile;
        }
        
        public String getTelefonoTutAz(){
            return telefonoTutoreAz;
        }
        public void setTelefonoTutAz(String telefonoTutoreAz){
            this.telefonoTutoreAz = telefonoTutoreAz;
        }
        
        public String getTutoreAziendale(){
            return tutoreAziendale;
        }
        public void setTutoreAziendale(String tutoreAziendale){
            this.tutoreAziendale = tutoreAziendale;
        }
        public String getOre(){
            return ore;
        }
        public void setOre(String ore){
            this.ore = ore;
        }
        
        public String getOrari(){
            return orari;
        }
        
        private void setOrari(String orari){
            this.orari = orari;
        }
        
        public String getAmbito(){
            return ambito;
        }
        public void setAmbito(String ambito){
            this.ambito = ambito;
        }
        
        public String getLuogoTirocinio(){
            return luogoTirocinio;
        }
        public void setLuogoTirocinio(String luogoTirocinio){
            this.luogoTirocinio = luogoTirocinio;
        }
        
        public String getCf(){
            return cf;
        }
        public void setCf(String cf){
            this.cf = cf;
        }
        
        public String getTelefonoStudente(){
            return telefonoStudente;
        }
        
        public void setTelefonoStudente(String telefonoStudente){
            this.telefonoStudente = telefonoStudente;
        }
        
        public String getResidenza(){
            return residenza;
        }
        
        public void setResidenza(String residenza){
            this.residenza = residenza;
        }
        
        public String getDataNascita(){
            return dataNascita;
        }
        
        public void setDataNascita(String dataNascita){
            this.dataNascita = dataNascita;
        }
        
        public String getLuogoNascita(){
            return luogoNascita;
        }
        
        public void setLuogoNascita(String luogoNascita){
            this.luogoNascita = luogoNascita;
        }

	public String getCondizioneAttualeStudente() {
		return condizioneAttualeStudente;
	}

	public void setCondizioneAttualeStudente(String condizioneAttualeStudente) {
		this.condizioneAttualeStudente = condizioneAttualeStudente;
	}

	public String getIdStudente() {
		return idStudente;
	}

	public void setIdStudente(String idStudente) {
		this.idStudente = idStudente;
	}

	public String getHandicap() {
		return handicap;
	}

	public void setHandicap(String handicap) {
		this.handicap = handicap;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getCfu() {
		return cfu;
	}

	public void setCfu(String cfu) {
		this.cfu = cfu;
	}

	public String getTutoreUniversitario() {
		return tutoreUniversitario;
	}

	public void setTutoreUniversitario(String tutoreUniversitario) {
		this.tutoreUniversitario = tutoreUniversitario;
	}

	public String getTelefonoTutoreUni() {
		return telefonoTutoreUni;
	}

	public void setTelefonoTutoreUni(String telefonoTutoreUni) {
		this.telefonoTutoreUni = telefonoTutoreUni;
	}

	public String getEmailTutoreUni() {
		return emailTutoreUni;
	}

	public void setEmailTutoreUni(String emailTutoreUni) {
		this.emailTutoreUni = emailTutoreUni;
	}

	public String getDataRichiesta() {
		return dataRichiesta;
	}

	public void setDataRichiesta(String dataRichiesta) {
		this.dataRichiesta = dataRichiesta;
	}

	public String getEmail_responsabile_azienda() {
		return email_responsabile_azienda;
	}

	public void setEmail_responsabile_azienda(String email_responsabile_azienda) {
		this.email_responsabile_azienda = email_responsabile_azienda;
	}

	public String getEmailStudente() {
		return emailStudente;
	}

	public void setEmailStudente(String emailStudente) {
		this.emailStudente = emailStudente;
	}

	public String getIdOfferta() {
		return idOfferta;
	}

	public void setIdOfferta(String idOfferta) {
		this.idOfferta = idOfferta;
	}

	public String getRagioneSociale() {
		return ragioneSociale;
	}

	public void setRagioneSociale(String ragioneSociale) {
		this.ragioneSociale = ragioneSociale;
	}

	public String getNomeStudente() {
		return nomeStudente;
	}

	public void setNomeStudente(String nomeStudente) {
		this.nomeStudente = nomeStudente;
	}

	public String getTitoloOfferta() {
		return titoloOfferta;
	}

	public void setTitoloOfferta(String titoloOfferta) {
		this.titoloOfferta = titoloOfferta;
	}
        public Candidatura(int id, String idStudente, String startDate,
			String endDate, String cfu, String tutoreUniversitario, 
                        String telefonoTutoreUni, String emailTutoreUni,String idOfferta,
                        String approvazione, String documento) {
                this.id = id;
		this.idStudente = idStudente;
                this.idOfferta = idOfferta;
                this.startDate = startDate;
		this.endDate = endDate;
                this.cfu = cfu;
		this.tutoreUniversitario = tutoreUniversitario;
                this.telefonoTutoreUni = telefonoTutoreUni;
		this.emailTutoreUni = emailTutoreUni;
		this.approvazione = approvazione;
                this.documento = documento;
	}
        
        public void setApprovazione(String approvazione){
            this.approvazione = approvazione;
        }
        public String getApprovazione(){
            return approvazione;
        }
        public void setDocumento(String documento){
            this.documento = documento;
        }
        public String getDocumento(){
            return documento;
        }
        public int getId(){
            return id;
        }
        private static Candidatura instance;
            public static final synchronized Candidatura setInstance(int id, String idStudente,String idOfferta, String startDate,
			String endDate, String cfu, String tutoreUniversitario, 
                        String telefonoTutoreUni, String emailTutoreUni,
                        String approvazione, String documento) {
                if ( instance == null ) {
                    instance = new Candidatura(id,idStudente, idOfferta, startDate, endDate, cfu, tutoreUniversitario,
                    telefonoTutoreUni, emailTutoreUni, approvazione, documento);
                }
            return instance;
    }
}
