<%@ page contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
#tmp {
	margin-left: 50%;
	color: #81898E;
}
</style>

</head>
<body>
	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
		integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
		crossorigin="anonymous">

	<nav class="navbar navbar-expand-lg navbar-dark"
		style="background-color: #87AFEB;">
		<div class="container">

			<a class="navbar-brand"><img src="/images/내일로고.jpg" height="40"
				width="70"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item "><a class="nav-link" href="../">홈 <span
							class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="../lecture">수강
							정보</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="../enterprise">지원 기업</a></li>


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

			<span id="tmp" class="navbar-item">본인 확인</span>
		</div>
	</nav>

	<br>
	<div class="container">

		<table class="table table-hover">
			<colgroup>
				<col width="15%" />
				<col width="85%" />
			</colgroup>

			<tr>
				<th scope="col">아이디</th>
				<td><input type="text" id="tmp_id"></td>
			</tr>
			<tr>
				<th scope="col">패스워드</th>
				<td><input type="text" id="tmp_pw"></td>
			</tr>

		</table>
		<br> <input type="hidden" id="mem_id" value=${mem.mem_id}>
		<input type="hidden" id="mem_pw" value=${mem.mem_pw}> <a
			href="update?mem_id=${mem.mem_id}&mem_pw=${mem.mem_pw}"
			class="btn btn-outline-info btn-sm" onclick="return check()">확인</a> <a
			class="btn btn-outline-info btn-sm" href="../">뒤로</a>



	</div>
</body>
<script>
	function check() {
		var id = document.getElementById("tmp_id").value;
		var pw = document.getElementById("tmp_pw").value;
		var t_id = document.getElementById("mem_id").value;
		var t_pw = document.getElementById("mem_pw").value;
		console.log(t_id, id);
		if (id == t_id && pw == t_pw) {
			return true;
		} else {
			alert(t_id);
			return false;
		}

	}
</script>
</html>