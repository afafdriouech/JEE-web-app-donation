<%-- 
    Document   : logout
    Created on : Feb 7, 2021, 9:55:36 PM
    Author     : afaf
--%>

<% 
session.invalidate(); //destroy session
response.sendRedirect("homeServlet");
%>


