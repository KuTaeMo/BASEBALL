<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<br/>
	<hr/>
	<!-- 머리열 행 -->
	<div style="display: flex; width: 100%; height: 30px;">
		<div style="width: 20%"><b>NO</b></div>
		<div style="width: 40%"><b>구장</b></div>
		<div style="width: 20%"><b>팀</b></div>
		<div style="width: 20%"></div>
	</div>
	<hr/>
	
	<!-- 표 -->
	<c:forEach var="stadium" items="${stadiums}">
	<div style="display: flex; width: 100%; height: 30px;">
		<div style="width: 20%">${stadium.id }</div>
		<div style="width: 40%">${stadium.stadiumName }</div>
		<div style="width: 20%">${stadium.team.teamName }</div>
		<div style="width: 20%"><button id="sdelete" value="${stadium.id }" style="background-color: red; color: white;">삭제</button></div>
	</div>
	<hr/>
	</c:forEach>
	
<script type="text/javascript">

$("#sdelete").on("click",(e)=>{
	let id=e.currentTarget.value;

	$.ajax({
		type:"DELETE",
		url:"/stadium/"+id,
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