<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<h1>선수 등록</h1>
	<form action="/player" method="post">
		<input name="playerName" placeholder="선수 이름을 등록하세요."/>
		<input name="position" placeholder="포지션을 등록하세요."/>
		<input name="teamName" placeholder="팀 이름을 등록하세요."/>
		<button>등록</button>	
	</form>
</body>
</html>