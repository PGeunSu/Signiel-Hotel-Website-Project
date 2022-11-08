<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
	String sessionId = (String) session.getAttribute("sessionId");
	
%>
	<sql:setDataSource var="dataSource" url="jdbc:mysql://localhost:3307/ProjectDB"
	driver="com.mysql.jdbc.Driver" user="root" password="1234" />
	
	<!-- sql쿼리문 실행하는 코드. executeQuery() -->
	<sql:update dataSource="${dataSource}" var="resultSet">
		delete from member where userID = ?
		<sql:param value="<%=sessionId %>"/>
	</sql:update>
	
	<c:if test="${resultSet >= 1 }">
		<c:import var="url" url="login.jsp"/>
		<c:redirect url="resultMember.jsp"/>
	</c:if>