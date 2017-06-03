package com.rating.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name="professor")
public class Professor {
	@Id
	private String iz_kuerzel;
	@Column
	private String email_adresse;
	
	public Professor() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Professor(String iz_kuerzel, String email_adresse) {
		super();
		this.iz_kuerzel = iz_kuerzel;
		this.email_adresse = email_adresse;
	}
	public String getIz_kuerzel() {
		return iz_kuerzel;
	}
	public void setIz_kuerzel(String iz_kuerzel) {
		this.iz_kuerzel = iz_kuerzel;
	}
	public String getEmail_adresse() {
		return email_adresse;
	}
	public void setEmail_adresse(String email_adresse) {
		this.email_adresse = email_adresse;
	}
	@Override
	public String toString() {
		return "Professor [iz_kuerzel=" + iz_kuerzel + ", email_adresse=" + email_adresse + "]";
	}
}
