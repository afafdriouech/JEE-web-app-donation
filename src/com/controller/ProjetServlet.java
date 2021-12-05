package com.controller;

import java.io.File;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.bean.Projet;
import com.crud.DAOprojet;
import com.gestion.GestionDAOprojet;


@MultipartConfig
public class ProjetServlet  extends HttpServlet{
	 Projet p = new Projet();
	 GestionDAOprojet gs = new GestionDAOprojet();
	 DAOprojet p_dao;
	 
	 @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	
            
    		 if(request.getParameter("Projets")!=null){  //afficherProjet
    			 List<Projet> projetList = new ArrayList();
                 projetList = gs.AfficherProjets();
                 request.setAttribute("projetList", projetList);
                 RequestDispatcher rs = request.getRequestDispatcher("liste_projets.jsp");
                 rs.forward(request, response);
             }
    		 else {
    			 List<Projet> projetList = new ArrayList();
                 projetList = gs.AfficherProjets();
                 request.setAttribute("projetList", projetList);
                 RequestDispatcher rs = request.getRequestDispatcher("all_projets.jsp");
                 rs.forward(request, response);            
    		 }
         
	    }
	    
	        @Override
	        protected void doPost(HttpServletRequest request, HttpServletResponse response)
	                throws ServletException, IOException {

	             if(request.getParameter("afficherUnProjet")!=null){
	            	 	int id = Integer.parseInt(request.getParameter("id_projet"));
		                List<Projet> projetList = new ArrayList();
		                projetList = gs.AfficherProjet(id);
		                request.setAttribute("projetList", projetList);
		                RequestDispatcher rd = request.getRequestDispatcher("modifier_projet.jsp");
		                rd.forward(request, response);
		            }
	             
	              if(request.getParameter("modifierProjet")!=null){
	                 int id_projet = Integer.parseInt(request.getParameter("id_projet"));
	                 String nom = request.getParameter("nom");
	                 
	                 String date_echeance = request.getParameter("date_echeance");
					 String duree_realisation=request.getParameter("duree_realisation");
	                 Float budget = Float.parseFloat(request.getParameter("budget"));
	                 String lieu= request.getParameter("lieu");
	                 String description = request.getParameter("description");
	                 gs.modifier_Projet(id_projet, nom,duree_realisation,date_echeance,budget,lieu,description);
	                 List<Projet> projetList = new ArrayList();
		             projetList = gs.AfficherProjets();
		             request.setAttribute("projetList", projetList);
	                 RequestDispatcher rd = request.getRequestDispatcher("liste_projets.jsp");
	                 rd.forward(request, response);              
	                
	             }
	              
	             if(request.getParameter("supprimerprojet")!=null){
	                int idx = Integer.parseInt(request.getParameter("id_projet"));
	                p.setId_projet(idx);
	                gs.supprimer_Projet(p);
	                List<Projet> projetList = new ArrayList();
		            projetList = gs.AfficherProjets();
		            request.setAttribute("projetList", projetList);
	                RequestDispatcher rd = request.getRequestDispatcher("liste_projets.jsp");
	                rd.forward(request, response);
	             } 
	             if(request.getParameter("ajoutProjet")!=null){
	            	 try {
	                 String nom = request.getParameter("nom");
	                 String date_lancement= request.getParameter("date_lancement");
	                 String duree_realisation= request.getParameter("duree_realisation");
	                 String date_echeance = request.getParameter("date_echeance");
	                 Float budget = Float.parseFloat(request.getParameter("budget"));
	                 String lieu= request.getParameter("lieu");
	                 String description = request.getParameter("description");
	                 int id_asso = Integer.parseInt(request.getParameter("id_asso"));
					 
	                 Part part=request.getPart("image");
	             	InputStream is=null;
	             	if(part!=null)
	             		is=part.getInputStream();
	             	byte[] data= new byte[is.available()];
	             	is.read(data);
	             	
	                 
	                 p.setNom(nom);
	         		 p.setDate_lancement(date_lancement);
	         		 p.setDuree_realisation(duree_realisation);
	         		 p.setDate_echeance(date_echeance);
	         		 p.setBudget(budget);
	         		 p.setLieu(lieu);
	         		 p.setDescription(description);
	         		 p.setId_asso(id_asso);
	         		 p.setImage(data);
					
	                 gs.ajouter_Projet(p);
	                 List<Projet> projetList = new ArrayList();
		             projetList = gs.AfficherProjets();
		             request.setAttribute("projetList", projetList);
	                 RequestDispatcher rd = request.getRequestDispatcher("liste_projets.jsp");
	                 rd.forward(request, response);
	             }catch(Exception e){
	            	 System.out.print("errrrrrrrro");
	            	 System.out.print(e);
	             	}
	             }
	                          
	         }
	        private String extractFileName(Part part) {
	        	String contentDisp = part.getHeader("content-disposition");
	        	String[] items = contentDisp.split(";");
	        	for (String s : items) {
	        		if (s.trim().startsWith("filename")) {
	        			return s.substring(s.indexOf("=") + 2, s.length() -1);
	        		}
	        	}
	        	return "";
	        }

}
