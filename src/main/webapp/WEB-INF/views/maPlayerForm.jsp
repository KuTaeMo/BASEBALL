<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<hr/>
	<!-- 머리열 행 -->
	<div style="display: flex; width: 100%; height: 30px;">
		<div style="width: 15%"><b>NO</b></div>
		<div style="width: 25%"><b>선수 이름</b></div>
		<div style="width: 20%"><b>포지션</b></div>
		<div style="width: 20%"><b>팀</b></div>
		<div style="width: 20%"></div>
	</div>
	<hr/>
	<!-- 표 -->
	<c:forEach var="player" items="${players}">
	<div style="display: flex; width: 100%; height: 30px;">
		<div style="width: 15%">${player.id }</div>
		<div style="width: 25%">${player.playerName }</div>
		<div style="width: 20%">${player.position }</div>
		<div style="width: 20%">${player.team.teamName }</div>
		<div style="width: 20%"><button id="pdelete" value="${player.id }" style="background-color: red; color: white;">삭제</button></div>
	</div>
	<hr/>
	</c:forEach>
	
<script type="text/javascript">
	$("#pdelete").on("click",(e)=>{
		let id=e.currentTarget.value;

		$.ajax({
			type:"DELETE",
			url:"/player/"+id,
			dataType:"json"
			}).done((res)=>{
				if(res===200){
					alert("삭제 성공");
					history.back();
				}else{
					alert("삭제 실패");
				}
			});

		});
</script>

</body>
</html>