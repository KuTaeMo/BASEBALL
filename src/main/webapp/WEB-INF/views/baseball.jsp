<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
ul.tabs {
	margin: 0;
	padding: 0;
	float: left;
	list-style: none;
	height: 32px; /*--Set height of tabs--*/
	border-bottom: 1px solid #999;
	border-left: 1px solid #999;
	width: 100%;
}

ul.tabs li {
	float: left;
	margin: 0;
	padding: 0;
	height: 31px;
	/*--Subtract 1px from the height of the unordered list--*/
	line-height: 31px; /*--Vertically aligns the text within the tab--*/
	border: 1px solid #999;
	border-left: none;
	margin-bottom: -1px; /*--Pull the list item down 1px--*/
	overflow: hidden;
	position: relative;
	background: #e0e0e0;
}
ul.tabs li a {
            text-decoration: none;
            color: #000;
            display: block;
            font-size: 15px;
            padding: 0 20px;
            /*--Gives the bevel look with a 1px white border inside the list item--*/
            border: 1px solid #fff; 
            
</style>
</head>
<body>

	<script type="text/javascript"
		src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			//When page loads...
			$(".tab_content").hide(); //Hide all content
			$("ul.tabs li:first").addClass("active").show(); //Activate first tab
			$(".tab_content:first").show(); //Show first tab content
			//On Click Event
			$("ul.tabs li").click(function() {
				$("ul.tabs li").removeClass("active"); //Remove any "active" class
				$(this).addClass("active"); //Add "active" class to selected tab
				$(".tab_content").hide(); //Hide all tab content
				var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
				$(activeTab).fadeIn(); //Fade in the active ID content
				return false;
			});
		});
	</script>

	<div id="wrapper">
		<!--탭 메뉴 영역 -->
		<ul class="tabs">
			<li><a href="#tab1"
				style="width: 100px; height: 40px; display: flex; justify-content: center; align-items: center;">
					야구장 등록</a></li>

			<li><a href="#tab2"
				style="width: 100px; height: 40px; display: flex; justify-content: center; align-items: center;">
					팀 등록</a></li>

			<li><a href="#tab3"
				style="width: 100px; height: 40px; display: flex; justify-content: center; align-items: center;">
					선수 등록</a></li>

			<li><a href="#tab4"
				style="width: 100px; height: 40px; display: flex; justify-content: center; align-items: center;">
					야구장 관리</a></li>

			<li><a href="#tab5"
				style="width: 100px; height: 40px; display: flex; justify-content: center; align-items: center;">
					팀 관리</a></li>

			<li><a href="#tab6"
				style="width: 100px; height: 40px; display: flex; justify-content: center; align-items: center;">
					선수 관리</a></li>

			<li><a href="#tab7"
				style="width: 100px; height: 40px; display: flex; justify-content: center; align-items: center;">
					포지션별 선수</a></li>
		</ul>

		<!--탭 콘텐츠 영역 -->
		<div class="tab_container">

			<div id="tab1" class="tab_content">
				<!--Content-->
				<%@ include file="registerStadiumForm.jsp"%>


			</div>

			<div id="tab2" class="tab_content">
				<!--Content-->
				<%@ include file="registerTeamForm.jsp"%>

			</div>
			
			<div id="tab3" class="tab_content">
				<!--Content-->
				<%@ include file="registerPlayerForm.jsp"%>

			</div>
			
			<div id="tab4" class="tab_content">
				<!--Content-->
				<%@ include file="maStadiumForm.jsp"%>

			</div>
			
			<div id="tab5" class="tab_content">
				<!--Content-->
				<%@ include file="maTeamForm.jsp"%>

			</div>
			
			<div id="tab6" class="tab_content">
				<!--Content-->
				<%@ include file="maPlayerForm.jsp"%>

			</div>
			
			<div id="tab7" class="tab_content">
				<!--Content-->
				<%@ include file="viewPlayerByPosition.jsp"%>

			</div>

		</div>

	</div>



</body>
</html>