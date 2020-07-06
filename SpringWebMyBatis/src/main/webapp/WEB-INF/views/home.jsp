<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!doctype html>
<html lang="en">
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>내 일 스케줄러</title>
<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed"
	rel="stylesheet">
<!--     <link rel="stylesheet" href="css/demo.css"/> -->
<link rel="stylesheet" href="css/theme3.css">
<style>
.dropdown {
  position: relative;
  display: inline-block;
}
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #ECEDED;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}
/* Links inside the dropdown */
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}
/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #BEDBF9;}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {display: block;}

</style>

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark"
		style="background-color: #87AFEB;">
		<div class="container">

			<div class="container">
				<a class="navbar-brand" href="./"><img src="images/내일로고.jpg"
					height="40" width="70"></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item active"><a class="nav-link ml-5"
							href="./">홈 <span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="./lecture">수강
								정보</a></li>
						<li class="nav-item"><a class="nav-link" href="./enterprise">지원
								기업</a></li>

					</ul>
				
					<div class = "dropdown">
						<img src="images/계정아이콘.png" height="40" width="40">
						<div class="dropdown-content">
							<a  href="./mypage">마이페이지</a>
							<a  href="./member/logout">로그아웃</a>
						</div>
					</div>
					<!-- <form class="form-inline my-2 my-lg-0">
			      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
			      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			    </form> -->
				</div>
			</div>
	</nav>

	<div class="container" id="caleandar"></div>


</body>

<style>
.lecture >a {
	color: #ed8e83!important;
}
.enterprise >a {
	color: #1b4793!important;

}
</style>
<script>
	var result = new Array();
	var result2 = new Array();
	window.addEventListener("load", function() {
		<c:forEach items="${assign}" var = "a">
		var json = new Object();
		json.LEC_ID = "${a.LEC_ID}";
		json.ASIGN_END = "${a.ASIGN_END}";
		json.ASIGN_NAME = "${a.ASIGN_NAME}";
		result.push(json);
		</c:forEach>

		<c:forEach items="${ent}" var = "b">
		var json = new Object();
		json.ENT_ID = "${b.ENT_ID}";
		json.ENT_NAME = "${b.ENT_NAME}";
		json.PAPER_END = "${b.PAPER_END}";
		json.INTERVIEW1 = "${b.INTERVIEW1}";
		json.INTERVIEW2 = "${b.INTERVIEW2}";
		json.INTERVIEW3 = "${b.INTERVIEW3}";
		result2.push(json);
		</c:forEach>
	});
</script>
<script src="js/caleandar.js"></script>
</html>