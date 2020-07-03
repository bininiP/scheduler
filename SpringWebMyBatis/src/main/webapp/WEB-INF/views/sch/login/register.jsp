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
<title>회원가입</title>
<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed"
	rel="stylesheet">
<!--     <link rel="stylesheet" href="css/demo.css"/> -->
<link rel="stylesheet" href="css/theme3.css">

<style>
#wrap {
	width: 530px;
	margin-left: auto;
	margin-right: auto;
	text-align: left;
}
btt {
	width: 85px;
	float: center;
	padding: 3px
}
</style>

</head>
<body class style="background-color: #87AFEB;">
	<div id="wrap">
		<link rel="stylesheet"
			href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
			integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
			crossorigin="anonymous">
		<div class="mx-auto" style="width: 200px;">
			<a class="navbar-brand"><img src="/images/내일로고.jpg" width="140"; height="80"></a>
		</div>
		<br>
		<div class="container"
			style="background-color: WHITE; width: 450px; height: 400px; border-radius: 20px 20px 20px 20px;">
			<b>
				<form action="/member/register" method="post">
					<div id="wrap">
						<br> <b><font size="6" color="gray"> 회원가입</font></b> <br>
						<br> <br>
						<table class="table table-hover" style="width: 400px;">
							<tr scope="col">
								<td id="title">아이디</td>
								<td><input type="text" id ="mem_id" name="mem_id" maxlength="20" required></td>
							</tr>

							<tr>
								<td id="title">비밀번호</td>
								<td><input type="password" name="mem_pw" maxlength="15" required>
								</td>
							</tr>

							<tr>
								<td id="title">비밀번호 확인</td>
								<td><input type="password" name="password" maxlength="15" required>
								</td>
							</tr>

							<tr>
								<td id="title">이름</td>
								<td><input type="text" name="mem_name" maxlength="40" required></td>
							</tr>

						</table>
						<input type="submit" 
							class="btn btn-outline-info btn-sm" value="가입" />
						 
				</form>
		</div>

	</div>
</body>

</html>