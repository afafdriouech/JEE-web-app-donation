package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.Association;
import com.bean.Donateur;
import com.bean.Projet;
import com.crud.DAOassociation;
import com.gestion.GestionDAOasso;
import com.gestion.GestionDAOrating;

public class AssociationServlet extends HttpServlet{
	
	Association a = new Association();
    GestionDAOasso gs = new GestionDAOasso();
    DAOassociation a_dao;
    GestionDAOrating rt=new GestionDAOrating();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         if(request.getParameter("afficherAssociation")!=null){
            List<Association> associationList = new ArrayList();
            associationList = gs.AfficherAssociations();
            request.setAttribute("associationList",associationList);
            RequestDispatcher rd = request.getRequestDispatcher("liste_associations.jsp");
            rd.forward(request, response);
        }
         if(request.getParameter("afficherUneAsso")!=null){
     	 	int id = Integer.parseInt(request.getParameter("id_asso"));
             List<Association> assoList = new ArrayList();
             assoList = gs.AfficherUneAssociation(id);
             request.setAttribute("assoList", assoList);
             request.setAttribute("id_ass", id);
             Double res=rt.calculer_rating(id);
             request.setAttribute("nbr_etoiles", res);

             RequestDispatcher rd = request.getRequestDispatcher("detail_asso.jsp");
             rd.forward(request, response);
         }
        
         if(request.getParameter("ajoutAssociation")!=null){
        	 try {
             String nom = request.getParameter("nom");
             String tel = request.getParameter("tel");
             String email = request.getParameter("email");
             String adresse= request.getParameter("adresse");
             String ville= request.getParameter("ville");
             String description= request.getParameter("description");
             String password = request.getParameter("password");
             
             
             a.setNom(nom);
             a.setTel(tel);
             a.setEmail(email);
             a.setAdresse(adresse);
             a.setVille(ville);
             a.setDescription(description);
             a.setPassword(password);
             gs.ajouter_Association(a);
             RequestDispatcher rd = request.getRequestDispatcher("AfficherDonateurs.jsp");
             rd.forward(request, response);
         }catch(Exception e){
        	 System.out.print(e);
         	}
         }
         if(request.getParameter("loginass")!=null){
        	 
        	 String email = request.getParameter("email");
        	 String password = request.getParameter("password");

        	 if (gs.validate(email, password)!= 0) {
        		 
        		 
                 int id_a = gs.validate( email,password);
                 HttpSession session = request.getSession(true);
                 //session.setAttribute(id_ass, new Integer(param.intValue() + 1));
                 request.setAttribute("id_a",id_a);
        		 RequestDispatcher dispatcher = request.getRequestDispatcher("add_projet.jsp");
        		 dispatcher.forward(request, response);
        	 } else {
        		 System.out.print("errore somewhere");
        		 RequestDispatcher dispatcher = request.getRequestDispatcher("login_ass.jsp");
        		 dispatcher.forward(request, response);
        		 
        		  }
          }
                      
     }
    
}
