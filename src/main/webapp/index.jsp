<%@ page import="com.myweb.user.service.UserService" %>
<%@ page import="com.myweb.user.service.UserServiceImpl" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    System.out.println("service");

    UserService service = new UserServiceImpl();
    service.getUser();


%>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
 Hello Servlet
</body>
</html>