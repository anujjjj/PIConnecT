<%@page language="java" session="true" contentType="text/html" pageEncoding="UTF-8"%>
 
<HTML>
    <HEAD>
        <TITLE></TITLE>
    </HEAD>
 
    <BODY>
<H1>LOGOUT FORM</H1>
<%
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setDateHeader("Expires", 0);
    response.setHeader("Pragma","no-cache");
 
    session.removeAttribute("username");
    session.invalidate();

    out.println("You have been logged out <a href=\"login.jsp\">Login</a>");
    response.sendRedirect("login.jsp");
%> 
    </BODY>
</HTML>