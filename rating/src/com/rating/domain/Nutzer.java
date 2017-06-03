package com.rating.domain;

public class Nutzer {
	private String nachname;
	private String vorname;
	private String email;
	private String iz_kuerzel;
	private String rolle;
	
	public Nutzer(String nachname, String vorname, String email, String iz_kuerzel, String rolle) {
		super();
		this.setNachname(nachname);
		this.setVorname(vorname);
		this.setEmail(email);
		this.setIz_kuerzel(iz_kuerzel);
		this.setRolle(rolle);
	}

	public Nutzer()
	{
		
	}

	public String getNachname() {
		return nachname;
	}

	public void setNachname(String nachname) {
		this.nachname = nachname;
	}
	
	public String getVorname() {
		return vorname;
	}

	public void setVorname(String vorname) {
		this.vorname = vorname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getIz_kuerzel() {
		return iz_kuerzel;
	}

	public void setIz_kuerzel(String iz_kuerzel) {
		this.iz_kuerzel = iz_kuerzel;
	}

	public String getRolle() {
		return rolle;
	}

	public void setRolle(String rolle) {
		this.rolle = rolle;
	}

	@Override
	public String toString() {
		return "nachname=" + nachname + ", vorname=" + vorname + ", email=" + email + ", iz_kuerzel="
				+ iz_kuerzel + ", rolle=" + rolle;
	}	
	
	
}
