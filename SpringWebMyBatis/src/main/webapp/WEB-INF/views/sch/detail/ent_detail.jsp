<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	#tmp{
	    margin-left: 50%;
	    color: #81898E;
	}
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
<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
		integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
		crossorigin="anonymous">
<title>기업 상세 정보</title>
</head>
<body>
	

	<nav class="navbar navbar-expand-lg navbar-dark"
		style="background-color: #87AFEB;">
	<div class="container">	<a class="navbar-brand"><img src="../images/내일로고.jpg" height="40"
		width="70"></a>

		
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item "><a class="nav-link" href="../home">홈
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="../lecture">수강
						정보</a></li>
				<li class="nav-item active"><a class="nav-link" href="../enterprise">지원
						기업</a></li>


			</ul>
			<div class = "dropdown">
						<img src="/images/계정아이콘.png" height="40" width="40">
						<div class="dropdown-content">
							<a  href="../mypage">마이페이지</a>
							<a  href="../member/logout">로그아웃</a>
						</div>
					</div>
			<!-- <form class="form-inline my-2 my-lg-0">
			      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
			      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			    </form> -->
		</div>
	</div>
	</nav>
	
	<nav class="navbar navbar-expand-lg navbar-dark"
		style="background-color: #E3EEFC;">
		<div class="container">
		
		<span id="tmp" class="navbar-item">기업 상세 정보</span>
		</div>
		</nav>
	
	<br>

	<div class="container">


		<table class="table table-hover">
			<colgroup>
				<col width="15%" />
				<col width="85%" />

			</colgroup>
<%-- 			<tr>
				<th scope="col">기업 ID</th>
				<td>${ent.ent_id}</td>
			</tr> --%>
			<tr>
				<th scope="col">기업명</th>
				<td>${ent.ent_name}</td>
			</tr>
			<tr>
				<th scope="col">서류마감일</th>
				<td>${ent.paper_end}</td>
			</tr>
			<tr>
				<th scope="col">1차 면접일</th>
				<td>${ent.interview1}</td>
			</tr>
			<tr>
				<th scope="col">2차 면접일</th>
				<td>${ent.interview2}</td>
			</tr>
			<tr>
				<th scope="col">3차 면접일</th>
				<td>${ent.interview3}</td>
			</tr>

		</table>
		<br> <a href="update?ent_id=${ent.ent_id}"><button
				type="button" class="btn btn-outline-info btn-sm">수정하기</button></a> <a
			href="delete?ent_id=${ent.ent_id}"><button type="button"
				class="btn btn-outline-info btn-sm">삭제하기</button></a>

	</div>
</body>
</html>