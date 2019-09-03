<%@ page language="java" import="java.util.*, java.sql.*,sql_pakage.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% 
request.setCharacterEncoding("UTF-8"); 
String id_2=null;String name=null;String sn=null;String beizhu=null;
id_2=request.getParameter("id_2");
name=request.getParameter("name");
sn=request.getParameter("sn");
beizhu=request.getParameter("beizhu");
System.out.println(id_2);
add ob=new add();
if(id_2!=null){ob.add2(id_2,name,sn,beizhu);}
//response.sendRedirect("shebei5.jsp");
else{
	out.print("faiure--");
}
%>