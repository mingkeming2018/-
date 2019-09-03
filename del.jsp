<%@ page language="java" import="java.util.*, java.sql.*,sql_pakage.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% 
request.setCharacterEncoding("UTF-8"); 
int id=Integer.parseInt(request.getParameter("id"));

//System.out.println(id_2);
del2 ob=new del2();
if(id!=0){ob.del(id);}
//response.sendRedirect("shebei5.jsp");
else{
	out.print("faiure--");
}
%>