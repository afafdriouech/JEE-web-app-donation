package com.bean;

import java.io.Serializable;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Appelaudon implements Serializable{
	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
	int id_appel;
	String nom;
	String  date_lancement;
	String  date_echeance;
	Float budget;
	String lieu;
	String description;
	int id_asso;
	
	public int getId_appel() {
		return id_appel;
	}
	public void setId_appel(int id_appel) {
		this.id_appel = id_appel;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String  getDate_lancement() {
		return date_lancement;
	}
	public void setDate_lancement(String  date_lancement) {
		this.date_lancement = date_lancement;
	}
	public String  getDate_echeance() {
		return date_echeance;
	}
	public void setDate_echeance(String  date_echeance) {
		this.date_echeance = date_echeance;
	}
	public Float getBudget() {
		return budget;
	}
	public void setBudget(Float budget) {
		this.budget = budget;
	}
	public String getLieu() {
		return lieu;
	}
	public void setLieu(String lieu) {
		this.lieu = lieu;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getId_asso() {
		return id_asso;
	}
	public void setId_asso(int id_asso) {
		this.id_asso = id_asso;
	}


	
	
}
