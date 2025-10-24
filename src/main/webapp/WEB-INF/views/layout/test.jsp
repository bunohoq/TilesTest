<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK" />
</head>
<body>	
	<!-- test.jsp -->
	<h1>테스트</h1>
	
	<%@ include file="/WEB-INF/views/inc/main_menu.jsp" %>
	
	<tiles:insertAttribute name="menu"></tiles:insertAttribute>
	
	<tiles:insertAttribute name="member_menu"></tiles:insertAttribute>
	
</body>
</html>














