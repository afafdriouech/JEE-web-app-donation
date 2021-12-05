<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Donation App</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="shortcut icon" type="image/x-icon" href="images/mainlogo.png">
    <link href="https://fonts.googleapis.com/css?family=Overpass:300,400,500|Dosis:400,700" rel="stylesheet">
    <link rel="stylesheet" href="css/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/css/animate.css">
    <link rel="stylesheet" href="css/css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/css/magnific-popup.css">
    <link rel="stylesheet" href="css/css/aos.css">
    <link rel="stylesheet" href="css/css/ionicons.min.css">
    <link rel="stylesheet" href="css/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/css/jquery.timepicker.css">
    <link rel="stylesheet" href="css/css/flaticon.css">
    <link rel="stylesheet" href="css/css/icomoon.css">
    <link rel="stylesheet" href="css/css/fancybox.min.css">

    <link rel="stylesheet" href="css/css/bootstrap.css">
    <link rel="stylesheet" href="css/css/style.css">

  </head>
  <body>
    
  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
      <img src="images/mainlogo.png" alt="Image placeholder" class="img-fluid">
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="oi oi-menu"></span> Menu
      </button>

      <div class="collapse navbar-collapse" id="ftco-nav">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item"><a href="homeServlet" class="nav-link">Home</a></li>
          
          <li class="nav-item"><a href="donate_form.jsp" class="nav-link">Donate</a></li>
          <li class="nav-item">
          <form action="AssociationServlet" method="POST">
            <button value="AfficherAssociation" name="afficherAssociation" type="submit" data-toggle="tooltip" title="" style="background:transparent;border: none;width:150px;height:50px;font-size: 17px;margin-top:15px;cursor: pointer;">Associations</button>         
          </form>
          </li>
          <li class="nav-item">
          <form action="ProjetServlet" method="get">
            <button name="afficherProjets" type="submit" data-toggle="tooltip" title="" style="background:transparent;border: none;width:150px;height:50px;font-size: 17px;margin-top:15px;cursor: pointer;">Projets</button>         
          </form>
          </li>
          <%
          if(null == session.getAttribute("id_d")){
        	  
              %>
          <li class="nav-item"><a href="index.html" class="nav-link">Login</a></li>
          
          <% }
          else {
        	  int id_d=(Integer)session.getAttribute("id_d");
          %>
          <li class="nav-item">
         <form action="AssofavoritesServlet" method="POST">
         	<input name="id_donateur" type="hidden" class="form-control" value="<%=id_d%>">
            <button value="AfficherAssofavorites" name="afficherAssofavo" type="submit" data-toggle="tooltip" title="" style="background:transparent;color:white;border: none;width:150px;height:50px;font-size: 17px;margin-top:15px;cursor: pointer;">Favorites</button>         
          </form>
          </li>
          <li class="nav-item"><a href="logout.jsp" class="nav-link">Logout</a></li>
           <%
          }
          %>
        </ul>
      </div>
    </div>
  </nav>
  <!-- END nav -->
  
  <div class="block-31" style="position: relative;">
    <div class="owl-carousel loop-block-31 ">
      <div class="block-30 block-30-sm item" style="background-image: url('images/bg_1.jpg');" data-stellar-background-ratio="0.5">
        <div class="container">
          <div class="row align-items-center justify-content-center text-center">
            <div class="col-md-7">
              <h2 class="heading">Better To Give Than To Receive</h2>
            </div>
          </div>
        </div>
      </div>
      
    </div>
  </div>

  <div class="site-section fund-raisers">
    <div class="container">
      <div class="row mb-3 justify-content-center">
        <div class="col-md-8 text-center">
          <h2>Mes Associations Favorites</h2><img src="images/heart2.png" alt="Image placeholder" class="img-fluid">
          
          
        </div>
      </div>
	
	
      <div class="row">
       <% int id_d=(Integer)session.getAttribute("id_d");%>
      <c:forEach items="${assofavoList}" var="af">
      
        <div class="col-md-12 col-lg-6 mb-5">
          <div class="person-donate text-center">
            <img src="images/asso2.png" alt="Image placeholder" class="img-fluid">
            <div class="donate-info">
              <h2>${af.nom}</h2>
              <span class="time d-block mb-3">${af.email}</span>
              <form action="AssociationServlet" method="POST">
              <input name="id_asso" type="hidden" class="form-control" value="${a.id_asso}">
            <button value="AfficherAssociation" name="afficherAssociation" type="submit" data-toggle="tooltip" title="" style="background:#e3c652;color:white;border: none;width:100px;height:40px;font-size: 15px;margin-top:15px;cursor: pointer;">View More</button>         
         	 </form>
            </div>
          </div>    
        </div>
       
     </c:forEach>
      </div>
    </div>
  </div> <!-- .section -->

 

 <footer class="footer">
    <div class="container">
      <div class="row mb-5">
        <div class="col-md-8 col-lg-8">
          <h3 class="heading-section">About Us</h3>
          <p class="lead">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
          <p class="mb-5">Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
          <p><a href="#" class="link-underline">Read  More</a></p>
        </div>
        
        <div class="col-md-6 col-lg-4">
          <div class="block-23">
            <h3 class="heading-section">Get Connected</h3>
              <ul>
                <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
              </ul>
            </div>
        </div>
        
        
      </div>
      
      </div>
    </div>
  </footer>

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="js/js/jquery.min.js"></script>
  <script src="js/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/js/popper.min.js"></script>
  <script src="js/js/bootstrap.min.js"></script>
  <script src="js/js/jquery.easing.1.3.js"></script>
  <script src="js/js/jquery.waypoints.min.js"></script>
  <script src="js/js/jquery.stellar.min.js"></script>
  <script src="js/js/owl.carousel.min.js"></script>
  <script src="js/js/jquery.magnific-popup.min.js"></script>
  <script src="js/js/bootstrap-datepicker.js"></script>

  <script src="js/js/jquery.fancybox.min.js"></script>
  
  <script src="js/js/aos.js"></script>
  <script src="js/js/jquery.animateNumber.min.js"></script>
  <script src="js/js/main.js"></script>
    
  </body>
</html>