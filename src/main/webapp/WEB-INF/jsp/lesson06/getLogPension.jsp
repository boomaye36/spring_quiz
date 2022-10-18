<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
   
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>  

<!-- bootstrap-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <!-- jquery slim 제거-->
        <!--<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<header>
			<h1 class="text-center">통나무 팬션</h1>
			<nav class="bg-warning">
                <ul class="nav nav-fill">
                    <li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">팬션소개</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">객실보기</a></li>
                    <li class="nav-item"><a href="/lesson06/quiz03/add_pension_view" class="nav-link text-white font-weight-bold">예약하기 </a></li>
                    <li class="nav-item"><a href="/lesson06/quiz03/confirm_pension_view" class="nav-link text-white font-weight-bold">예약목록  </a></li>
                </ul>
            </nav>
		</header>
		<section>
			<h2 class="text-center p-4">예약 목록 보기 </h2>
			<table class="table text-center ">
				<thead>
					<tr>
						<th>이름 </th>
						<th>예약날짜 </th>
						<th>숙박일수 </th>
						<th>숙박인원 </th>
						<th>전화번호 </th>
						<th>예약상태 </th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${log }" var="pension">
					<tr>
						<td>${pension.name}</td>
						<td>${pension.day}</td>
						<td>${pension.date}</td>
						<td>${pension.headcount}</td>
						<td>${pension.phoneNumber}</td>
						<td class="text-success">${pension.state}</td>
						<td><button type="button" class="del-btn btn btn-danger" data-pension-id="${pension.id }">삭제 </button></td>
						
						
					</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</section>
		<footer>
			<small>서울특별시 삼성로 212<br>
				아이스 아메리카노 주세용<br>
				한세트만 더하면 줄게 </small>
		</footer>
		
	
	</div>
	<script>
	$(document).ready(function(){
		$('.del-btn').on('click',function(){
			let pensionId = $(this).data('pension-id');
			//alert(pensionId);
			$.ajax({
				type:"DELETE"
				, url:"/lesson06/delete_pension"
				, data:{"id":pensionId}
				, success:function(data){
					if (data.code == 100){
						location.reload(true);
						
					}else{
						alert(data.errorMessage);
					}
				}
				, error:function(e){
					alert("삭제 실패입니다. ");
				}
			})
		});
	});
	</script>
</body>
</html>