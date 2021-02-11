package com.gestion;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.Appelaudon;
import com.crud.DAOappel;

public class GestionDAOappel implements DAOappel{
	@Override
	public void ajouter_Appelaudon(Appelaudon ap) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		session.save(ap);
		transaction.commit();
		session.close();		
	}
	
	public void modifier_Appelaudon(int id_appel, String nom,Date date_lancement,Date date_echeance,Float budget,String lieu,String description) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		Appelaudon ap = (Appelaudon) session.load(Appelaudon.class,id_appel);
		ap.setNom(nom);
		ap.setDate_lancement(date_lancement);
		ap.setDate_echeance(date_echeance);
		ap.setBudget(budget);
		ap.setLieu(lieu);
		ap.setDescription(description);
		
		
		session.update(ap);
		transaction.commit();
		session.close();			
	}
	
	public void supprimer_Appelaudon(Appelaudon ap) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();		
		session.delete(ap);
        transaction.commit();
		session.close();	

	}
	
	public List<Appelaudon> AfficherAppelaudons(){		
		List<Appelaudon> appelaudonList = new ArrayList();
		Session session = HibernateUtil.getSessionFactory().openSession();		
		String qr = "FROM Appelaudon"; //Entity name
		Query query = session.createQuery(qr);
		appelaudonList = query.list();
		return appelaudonList;
	}
}
