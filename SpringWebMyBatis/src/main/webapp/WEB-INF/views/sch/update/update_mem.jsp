<%@ page contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 정보 수정</title>
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

</head>
<body>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
		integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
		crossorigin="anonymous">

	<nav class="navbar navbar-expand-lg navbar-dark"
		style="background-color: #87AFEB;">
		<div class="container">

			<a class="navbar-brand"><img src="../images/내일로고.jpg" height="40"
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
		
		<span id="tmp" class="navbar-item">나의 정보 수정</span>
		</div>
		</nav>
	<form action="<c:url value='/mypage/update'/>" method="post">
		<br>
		<div class="container">

			<table class="table table-hover">
				<colgroup>
					<col width="15%" />
					<col width="85%" />
				</colgroup>

				<tr>
					<th scope="col">이름</th>
					<td><input type="text" name="mem_name" value=${mem.mem_name}></td>
				</tr>
				<tr>
					<th scope="col">아이디</th>
					<td><input type="text" name="mem_id" value=${mem.mem_id}></td>
				</tr>
				<tr>
					<th scope="col">패스워드</th>
					<td><input type="password" name="mem_pw" value=${mem.mem_pw}></td>
				</tr>
				
				</table>
				<input type="hidden" name="seq_id" value=${mem.seq_id}>
						<br> <input class="btn btn-outline-info btn-sm" type="submit"
						value="수정"> 
						</form>
						
						<a class="btn btn-outline-info btn-sm" 
						href="../mypage/delete">회원탈퇴</a>
						<a class="btn btn-outline-info btn-sm" 
						href="../mypage">취소</a>
	
	</div>
</body>
</html>