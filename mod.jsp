<%@ page language="java" import="java.util.*, java.sql.*,sql_pakage.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% 
request.setCharacterEncoding("UTF-8"); 
int id=Integer.parseInt(request.getParameter("id"));
String id_2=null;String name=null;String sn=null;String beizhu=null;String user=null;
id_2=request.getParameter("id_2")+"";
name=request.getParameter("name")+"";
sn=request.getParameter("sn")+"";
beizhu=request.getParameter("beizhu")+"";
user=request.getParameter("user")+"";
System.out.println("modjsp"+id_2);System.out.println("modjsp"+id);System.out.println("modjsp"+name);System.out.println("modjsp"+sn);
mod ob=new mod();
if(id!=0){ob.update(id,id_2,name,sn,beizhu,user);}
//response.sendRedirect("shebei5.jsp");
else{
	out.print("faiure--");
}
%>