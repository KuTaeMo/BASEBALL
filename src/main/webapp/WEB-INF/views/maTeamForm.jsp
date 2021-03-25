<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<br/>
	<hr/>
	<!-- 머리열 행 -->
	<div style="display: flex; width: 100%; height: 30px;">
		<div style="width: 20%"><b>NO</b></div>
		<div style="width: 30%"><b>팀 이름</b></div>
		<div style="width: 30%"><b>구장</b></div>
		<div style="width: 20%"></div>
	</div>
	<hr/>
	<!-- 표 -->
	<c:forEach var="team" items="${team}">
	<div style="display: flex; width: 100%; height: 30px;">
		<div style="width: 20%">${team.id }</div>
		<div style="width: 30%">${team.teamName }</div>
		<div style="width: 30%">${team.stadium.stadiumName }</div>
		<div style="width: 20%"><button id="tdelete" value="${team.id }" style="background-color: red; color: white;">삭제</button></div>
	</div>
	<hr/>
	</c:forEach>
	
<script type="text/javascript">
$("#tdelete").on("click",(e)=>{
	let id = e.currentTarget.value;
	
	$.ajax({
		type: "DELETE",
		url: "/team/"+id,
		dataType: "json"
	}).done((res)=>{
		console.log(res);
		if(res === 200){
			alert("삭제에 성공하였습니다");
			history.go(0);
			
		}else {
			alert("삭제에 실패하였습니다");
		}
	});
});

</script>
</body>
</html>