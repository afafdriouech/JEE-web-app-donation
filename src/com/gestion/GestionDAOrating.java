package com.gestion;

import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.persistence.NoResultException;

import org.hibernate.Query;

import com.bean.rating;
import com.crud.DAOrating;

public class GestionDAOrating implements DAOrating{
	
	@Override
	public void ajouter_rating(rating rt) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		int id=rt.getId_donateur();
		String exist="select count(*) from rating r where r.id_donateur="+id+" and r.id_asso="+rt.getId_asso();
		Long d=(Long)session.createQuery(exist).getSingleResult();
		if(d==0) {
			Transaction transaction = session.beginTransaction();
			session.save(rt);
			transaction.commit();
			}
		else {
			Transaction transaction = session.beginTransaction();
			String up="update rating r set r.stars="+rt.getStars()+" where r.id_donateur="+id+" and r.id_asso="+rt.getId_asso();
			Query q=session.createQuery(up);  
			q.executeUpdate();  
			transaction.commit();
		}
		
		session.close();
	}
	
	@Override
    public Double calculer_rating(int id_asso) {
    	Session session = HibernateUtil.getSessionFactory().openSession();
    	int totalStars;
    	Query quer=null;
    	try {
    	String totStars="select SUM(stars) from rating r GROUP BY r.id_asso having r.id_asso="+id_asso;
    	String totRate="select count(*) from rating r GROUP BY r.id_asso having r.id_asso="+id_asso;
    	totalStars=Integer.parseInt((String)session.createQuery(totStars).getSingleResult());
    	Long totalRate=(Long)session.createQuery(totRate).getSingleResult();
    	Double total=(double)totalStars/totalRate;
    	Double starPercentage = (total / 5) * 100;
    	Double starPercentageRounded = (double)Math.round(starPercentage / 10)*10;
    	
    	Transaction transaction = session.beginTransaction();
		String up="update Association a set a.nbr_etoiles="+starPercentageRounded+" where a.id_asso="+id_asso;
		Query q=session.createQuery(up);  
		q.executeUpdate(); 
    	
    	return starPercentageRounded;
    	}catch(NoResultException e) { System.out.print("erreeuuuuuuuuuuuuuuuuuuur"+e);}
    	return 0.0;
	}
}
