<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강의 정보</title>
<style>
	#tmp{
	    margin-left: 50%;
	    color: #81898E;
	}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark"
		style="background-color: #87AFEB;">
	<div class="container">
		<a class="navbar-brand"><img src="images/내일로고.jpg" height="40"
		width="70"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item "><a class="nav-link" href="./">홈
						<!-- <span class="sr-only">(current)</span> -->
				</a></li>
				<li class="nav-item active"><a class="nav-link" href="./lecture">수강
						정보</a></li>
				<li class="nav-item"><a class="nav-link" href="./enterprise">지원
						기업</a></li>

			</ul>
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
		
		<span id="tmp" class="navbar-item">강의 정보</span>
		</div>
		</nav>
	<br>

	<div class="container">


		<a href="<c:url value='/lecture/insert'/>">
			<button type="button" class="btn btn-outline-info btn-sm">
				강의 추가 입력</button>
		</a> <br></br>


		<table class="table table-hover">
			<tr>
				<!-- <th scope="col">강의ID</th> -->
				<th scope="col">강의명</th scope="col">
				<th scope="col">시작일</th scope="col">
				<th scope="col">마감일</th scope="col">
				<th scope="col">일정추가</th scope="col">

			</tr>
			<c:forEach var="lec" items="${lec_list}">
				<form action="<c:url value='/assign/insert'/>" method="post">
					<tr>
						<%-- <td>${lec.lec_id}</td> --%>
						<td><a href="<c:url value='/lecture/${lec.lec_id}'/>">${lec.lec_name}</a></td>
						<td>${lec.lec_start}</td>
						<td>${lec.lec_end}</td>
						<td><input type="hidden" name="lec_id" value="${lec.lec_id}">
							<input type="text" name="asign_name" placeholder="일정"> <input
							type="date" name="asign_end" value="2999-12-31"> <input
							class="btn btn-outline-info btn-sm" type="submit" value="일정 추가">
						</td>
					</tr>
				</form>
			</c:forEach>

		</table>
		<br>
		<border="1">
		<p>추가 일정 정보</p>
		<table class="table table-hover">

			<tr>
				<!-- <th scope="col">강의ID</th scope="col"> -->
				<th scope="col">강의명</th scope="col">
				<th scope="col">일정</th scope="col">
				<th scope="col">마감일</th scope="col">
				<th scope="col"></th scope="col">
				
			</tr>

			<c:forEach var="assign" items="${assign_list}">
				<form action="<c:url value='/assign/delete'/>" method="post">
					<tr>
						<%-- <td>${assign.lec_id}</td> --%>
						
						<c:set var="loop_flag" value="false" />
						<c:forEach var="lec" items="${lec_list}">
							<c:if test="${lec.lec_id == assign.lec_id}">
								<td>${lec.lec_name}</td>
								<c:set var="loop_flag" value="true" />
							</c:if>
						</c:forEach>
						
						<td>${assign.asign_name}</td>
						<td>${assign.asign_end}</td>
						<td><input type="hidden" name="lec_id"
							value="${assign.lec_id}"> <input type="hidden"
							name="asign_name" value="${assign.asign_name}"> <input
							class="btn btn-outline-info btn-sm" type="submit" value="삭제">
							<%-- <a href="delete?lec_id=${assign.lec_id} asign_name=${assign.asign_name}">삭제</a> --%>
						</td>
					</tr>
				</form>
			</c:forEach>

		</table>
	</div>
</body>
</html>