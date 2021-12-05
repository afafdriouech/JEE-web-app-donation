package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.rating;
import com.crud.DAOrating;
import com.gestion.GestionDAOrating;

/**
 * Servlet implementation class ratingServlet
 */
@WebServlet("/ratingServlet")
public class ratingServlet extends HttpServlet {
	
	rating rt= new rating();
	GestionDAOrating gs = new GestionDAOrating();
    DAOrating rt_dao;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
       	 try {
       	 String rate=request.getParameter("rate");
       	 int id_asso=Integer.parseInt(request.getParameter("id_asso"));
       	 int id_don=Integer.parseInt(request.getParameter("id_don"));
       	 
       	 
            rt.setId_asso(id_asso);
            rt.setId_donateur(id_don);
            rt.setStars(rate);
            
            gs.ajouter_rating(rt);
            //RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
            //rd.forward(request, response);
        }catch(Exception e){
       	 System.out.print(e);
        	}
        
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
