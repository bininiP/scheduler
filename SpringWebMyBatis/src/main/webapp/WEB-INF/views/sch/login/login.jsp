<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!doctype html>

<html>
<head>
<style>
#wrap {
	width: 530px;
	margin-left: auto;
	margin-right: auto;
	text-align: left;
}

#button {
	margin-left: auto;
	margin-right: auto;
}

.rounded {
	width: 200px;
	background-color: #bdf;
	border: 2px solid #1bf;
	padding: 0.5em;
	line-height: 1em;
	border-radius: 0.5em;
	-moz-border-radius: 0.5em;
	-webkit-border-radius: 0.5em;
}
</style>


<!-- 합쳐지고 최소화된 최신 CSS -->
<!-- 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		부가적인 테마
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>내 일 스케줄러-로그인 페이지</title>
<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed"
	rel="stylesheet">
<link rel="stylesheet" href="css/theme3.css">

</head>
<body style="background-color: #87AFEB;">

	<div class="mx-auto" style="width: 200px;">
		<!-- <span class="align-middle">middle</span>
	
	 -->
		<a class="navbar-brand"><img src="/images/내일로고.jpg" height="80"
			width="140"></a>


	</div>
	<br>
<div class="container" style="background-color: WHITE; width:420px; height:380; border-radius: 20px 20px 20px 20px; " text-align=center; >
		<div id="wrap">
			<br> <b><font size="6" color="gray">Login</font></b> <br>
			<br>
			<br>

			<!-- <form action="/member/login" method="post"> -->
			<form action="/" method="post">
				<table class="table table-hover" style="width: 400px;">
					<colgroup>
						<col width="40%" />
						<col width="60%" />
					<tr scope="col">
						<td id="title">아이디</td>
						<td><input type="text" name="mem_id" maxlength="20">   
						</td>
					</tr>

					<tr>
						<td id="title">비밀번호</td>
						<td><input type="password" name="mem_pw" maxlength="15">
						</td>
					</tr>
				</table>
				<br>

				<input type="submit" class="btn btn-outline-info btn-sm"
					value="로그인">
				<a class="btn btn-outline-info btn-sm" href="<c:url value= '/member/register'/> " >회원가입</a>
				<%-- <a class="btn btn-outline-info btn-sm" href="<c:url value= 'register'/> ">회원가입</a> --%>
				<br> <br>
			</form>
			
		</div>
		
	</div>

</body>

</html>