<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
          <li class="nav-item active"><a href="homeServlet" class="nav-link">Home</a></li>
          <%
          if(null != session.getAttribute("id_d")){
        	  
              %>
          <li class="nav-item"><a href="donate_form.jsp" class="nav-link">Donate</a></li>
          <%}else{ %>
          <li class="nav-item"><a href="login_don.jsp" class="nav-link">Donate</a></li>
          <%} %>
          <li class="nav-item">
          <form action="AssociationServlet" method="POST">
            <button value="AfficherAssociation" name="afficherAssociation" type="submit" data-toggle="tooltip" title="" style="background:transparent;color:black;border: none;width:150px;height:50px;font-size: 17px;margin-top:15px;cursor: pointer;">Associations</button>         
          </form>
          </li>
          <li class="nav-item">
          <form action="ProjetServlet" method="get">
            <button name="afficherProjets" type="submit"  title="" data-toggle="tooltip" title="" style="background:transparent;color:black;border: none;width:150px;height:50px;font-size: 17px;margin-top:15px;cursor: pointer;">Projets</button>         
          </form>
          </li>
          <% if (request.getAttribute("id_d")!=null) {
          int id_d = (Integer)request.getAttribute("id_d");
          String email =(String)request.getAttribute("email");
          session.setAttribute("id_d",id_d);
          session.setAttribute("email",email);}
          %>
          
          
         <!--  <li class="nav-item"><a href="about.html" class="nav-link">About</a></li> -->
          
          
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
            <button value="AfficherAssofavorites" name="afficherAssofavo" type="submit" data-toggle="tooltip" title="" style="background:transparent;border: none;width:150px;height:50px;font-size: 17px;margin-top:15px;cursor: pointer;">Favorites</button>         
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
              <h2 class="heading mb-5">Charity is a continuous process toward success and happiness.</h2>
            </div>
          </div>
        </div>
      </div>
      
    </div>
  </div>
  
  

  <div class="site-section border-top">
    <div class="container">
      <div class="row">

        <div class="col-md-4">
          <div class="media block-6">
            <div class="icon"><span class="ion-ios-bulb"></span></div>
            <div class="media-body">
              <h3 class="heading">Our Mission</h3>
              <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
              <p><a href="#" class="link-underline">Learn More</a></p>
            </div>
          </div>     
        </div>

        <div class="col-md-4">
          <div class="media block-6">
            <div class="icon"><span class="ion-ios-cash"></span></div>
            <div class="media-body">
              <h3 class="heading">Make Donations</h3>
              <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
              <p><a href="#" class="link-underline">Learn More</a></p>
            </div>
          </div>  
        </div>

        <div class="col-md-4">
          <div class="media block-6">
            <div class="icon"><span class="ion-ios-contacts"></span></div>
            <div class="media-body">
              <h3 class="heading">We Need Volunteers</h3>
              <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
              <p><a href="#" class="link-underline">Learn More</a></p>
            </div>
          </div> 
        </div>

      </div>
    </div>
  </div> <!-- .site-section -->



  

  <div class="site-section fund-raisers bg-light">
    <div class="container">
      <div class="row mb-3 justify-content-center">
        <div class="col-md-8 text-center">
          <h2>Latest Projects</h2>
          <p class="lead">Nous avons besoin de vos dons pour réaliser ces projets !! </p>
          <p><a href="ProjetServlet" class="link-underline">View All Projects</a></p>
        </div>
      </div>
    </div>

    <div class="container-fluid">

      <!-- <div class="row"> -->
        
        <div class="col-md-12 block-11">
          <div class="nonloop-block-11 owl-carousel">
          
          <c:forEach items="${projetList}" var="p">
          	<div class="card fundraise-item">
              <a href="#"><img class="card-img-top"  src="ProjetImage?id=${p.id_projet}" alt="Image placeholder" ></a>
              <div class="card-body">
                <h3 class="card-title"><a href="#">${p.nom}</a></h3>
                <p class="card-text">${p.description}</p>
                <span class="donation-time mb-3 d-block">Date lancement:${p.date_lancement}</span>
                <div class="progress custom-progress-success">
                  <div class="progress-bar bg-primary" role="progressbar" style="width: ${p.avancement}%" aria-valuenow="28" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <span class="fund-raised d-block">${p.budget}</span>
              </div>
            </div>
          </c:forEach>

         <!--     <div class="card fundraise-item">
              <a href="#"><img class="card-img-top" src="images/img_1.jpg" alt="Image placeholder"></a>
              <div class="card-body">
                <h3 class="card-title"><a href="#">Water Is Life. Clean Water In Urban Area</a></h3>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <span class="donation-time mb-3 d-block">Last donation 1w ago</span>
                <div class="progress custom-progress-success">
                  <div class="progress-bar bg-primary" role="progressbar" style="width: 28%" aria-valuenow="28" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <span class="fund-raised d-block">$12,000 raised of $30,000</span>
              </div>
            </div>

            
            <div class="card fundraise-item">
              <a href="#"><img class="card-img-top" src="images/img_7.jpg" alt="Image placeholder"></a>
              <div class="card-body">
                <h3 class="card-title"><a href="#">Need Shelter for Children in Africa</a></h3>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <span class="donation-time mb-3 d-block">Last donation 1w ago</span>
                <div class="progress custom-progress-success">
                  <div class="progress-bar bg-primary" role="progressbar" style="width: 28%" aria-valuenow="28" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <span class="fund-raised d-block">$12,000 raised of $30,000</span>
              </div>
            </div>
            
            <div class="card fundraise-item">
              <a href="#"><img class="card-img-top" src="images/img_3.jpg" alt="Image placeholder"></a>
              <div class="card-body">
                <h3 class="card-title"><a href="#">Children Needs Education</a></h3>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <span class="donation-time mb-3 d-block">Last donation 1w ago</span>
                <div class="progress custom-progress-success">
                  <div class="progress-bar bg-primary" role="progressbar" style="width: 28%" aria-valuenow="28" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <span class="fund-raised d-block">$12,000 raised of $30,000</span>
              </div>
            </div>


            <div class="card fundraise-item">
              <a href="#"><img class="card-img-top" src="images/img_4.jpg" alt="Image placeholder"></a>
              <div class="card-body">
                <h3 class="card-title"><a href="#">Refugees Needs Food</a></h3>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <span class="donation-time mb-3 d-block">Last donation 1w ago</span>
                <div class="progress custom-progress-success">
                  <div class="progress-bar bg-primary" role="progressbar" style="width: 28%" aria-valuenow="28" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <span class="fund-raised d-block">$12,000 raised of $30,000</span>
              </div>
            </div>

            
            <div class="card fundraise-item">
              <a href="#"><img class="card-img-top" src="images/img_6.jpg" alt="Image placeholder"></a>
              <div class="card-body">
                <h3 class="card-title"><a href="#">Voluteer </a></h3>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <span class="donation-time mb-3 d-block">Last donation 1w ago</span>
                <div class="progress custom-progress-success">
                  <div class="progress-bar bg-primary" role="progressbar" style="width: 28%" aria-valuenow="28" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <span class="fund-raised d-block">$12,000 raised of $30,000</span>
              </div>
            </div>
            
            <div class="card fundraise-item">
              <a href="#"><img class="card-img-top" src="images/img_3.jpg" alt="Image placeholder"></a>
              <div class="card-body">
                <h3 class="card-title"><a href="#">Children Needs Food</a></h3>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <span class="donation-time mb-3 d-block">Last donation 1w ago</span>
                <div class="progress custom-progress-success">
                  <div class="progress-bar bg-primary" role="progressbar" style="width: 28%" aria-valuenow="28" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <span class="fund-raised d-block">$12,000 raised of $30,000</span>
              </div>
            </div> -->
           
          </div>
        </div>
      <!-- </div> -->
    </div>
  </div> <!-- .section -->


  

  <div class="featured-section overlay-color-2" style="background-image: url('images/mainlogo.png');">
    
    <div class="container">
      <div class="row">

        <div class="col-md-6">
          <img src="images/bg_3.jpg" alt="Image placeholder" class="img-fluid">
        </div>

        <div class="col-md-6 pl-md-5">
          <span class="featured-text d-block mb-3">Success Stories</span>
          <h2>Water Is Life. We Successfuly Provide Clean Water in South East Asia</h2>
          <p class="mb-3">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
          <span class="fund-raised d-block mb-5">We have raised $100,000</span>

          <p></p>
          <form action="AssociationServlet" method="POST">
            <button value="AfficherAssociation" name="afficherAssociation" type="submit" data-toggle="tooltip" title="" class="btn btn-success btn-hover-white py-3 px-5">Voir les Associations</button>         
          </form>
          </p>
        </div>
        
      </div>
    </div>

  </div> <!-- .featured-donate -->  

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