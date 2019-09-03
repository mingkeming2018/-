<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% Object login=session.getAttribute("login");System.out.println("loginconf:"+session.getAttribute("login"));
    	if(login!=null){response.sendRedirect("wai/sq.html");}
    	else{response.sendRedirect("wai/login.html");}
    	
    %>
<!-- request.getRequestDispatcher("/WEB-INF/sq.jsp").forward(request, response); -->