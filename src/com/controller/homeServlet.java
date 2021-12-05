package com.controller;

import java.io.File;
import java.io.IOException;


import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.bean.Projet;
import com.crud.DAOprojet;
import com.gestion.GestionDAOprojet;

public class homeServlet  extends HttpServlet{
	 Projet p = new Projet();
	 GestionDAOprojet gs = new GestionDAOprojet();
	 DAOprojet p_dao;
	 
	 @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	
             List<Projet> projetList = new ArrayList();
             projetList = gs.AfficherProjets();
             request.setAttribute("projetList", projetList);
             RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
             rd.forward(request, response);
         
	    }
	 
	 @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	
          List<Projet> projetList = new ArrayList();
          projetList = gs.AfficherProjets();
          request.setAttribute("projetList", projetList);
          RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
          rd.forward(request, response);
      
	    }

}
