<%@ page import="json2.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*, java.sql.*" pageEncoding="utf-8"%>

<% int id=Integer.parseInt(request.getParameter("id"));
resultSetToJson result=new resultSetToJson();
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
    String url="jdbc:mysql://localhost:3306/wai?useUnicode=true&characterEncoding=utf-8&useSSL=true"; 
    String user="root"; 
    String password="123456"; 
    Connection conn = DriverManager.getConnection(url, user, password); 
    Statement st = conn.createStatement();  
    
    
    ResultSet rs = st.executeQuery("select * from shebei where id="+id);
	 out.println(result.result(rs));
    rs.close(); 
    conn.close(); 

  %>  
 