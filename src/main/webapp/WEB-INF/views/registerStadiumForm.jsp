<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<h1>야구장 등록</h1>
	<form action="/stadium" method="post">
		<input name="stadiumName" placeholder="구장 이름을 등록하세요."/>
		<input name="teamName" placeholder="팀 이름을 등록하세요."/>
		<button>등록</button>	
	</form>
</body>
</html>