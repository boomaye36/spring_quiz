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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<%-- datepicker --%>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
</head>

<title>펜션 예약 </title>
</head>

<body>
	<div class="container">
		<header>
			<h1 class="text-center">통나무 팬션</h1>
			<nav class="bg-warning">
                <ul class="nav nav-fill">
                    <li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">팬션소개</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">객실보기</a></li>
                    <li class="nav-item"><a href="/lesson06/quiz03/add_pension_view" class="nav-link text-white font-weight-bold">예약안내</a></li>
                    <li class="nav-item"><a href="/lesson06/quiz03/confirm_pension_view" class="nav-link text-white font-weight-bold">예약목록 </a></li>
                </ul>
            </nav>
		</header>
		<section>
			<h2>예약하기 </h2>
			<div class="form-group">
				<label for="name">이름 </label>
				<input type="text" id="name" name="name" class="form-control">
				<label for="date">예약날짜  </label>
				<input type="text" id="date" name="date" class="form-control">
				<label for="day ">숙박일수  </label>
				<input type="text" id="day" name="day" class="form-control">
				<label for="headcount">숙박 인원  </label>
				<input type="text" id="headcount" name="headcount" class="form-control">
				<label for="phoneNumber ">전화번호  </label>
				<input type="text" id="phoneNumber" name="phoneNumber" class="form-control">
				<button type="button" id="addBtn" class="btn btn-warning">예약하기  </button>
			</div>
			
		</section>
		</div>
	<script>
		$(document).ready(function() {
			
			$('#date').datepicker({
				changeMonth : true,  
				changeYear : true,  
				dateFormat : "yy-mm-dd"
				,minDate : 0 //오늘부터 뒤 선택
			});
			$('#addBtn').on('click', function(){
				let name = $('input[name=name]').val().trim();
				let date = $('input[name=date]').val().trim();
				let day = $('input[name=day]').val().trim();
				let headcount = $('input[name=headcount]').val().trim();
				let phoneNumber = $('#phoneNumber').val().trim();
				
				if (name == "") {
					alert("이름을 입력하세요");
					return;
				}
				
				if (date == "") {
					alert("날짜를 선택하세요");
					return;
				}
				
				if (day == "") {
					alert("숙박일을 입력하세요");
					return;
				} 
				
				if (isNaN(day)) {
					alert("숙박일수를 숫자만 입력가능합니다.");
					return;
				}
				
				if (headcount == "") {
					alert("숙박 인원을 입력하세요");
					return;
				}
				
				if (isNaN(headcount)) {
					alert("숙박인원은 숫자만 입력가능합니다.");
					return;
				}
				
				if (phoneNumber == "") {
					alert("전화번호를 입력하세요");
					return;
				}
			
			
			//ajax -> insert
			$.ajax({
				//request
				type:"POST"
				, url:"/lesson06/add_booking"
				, data:{"name":name, "date":date, "day":day, "headcount":headcount, "phoneNummber":phoneNumber}
				// response
				, success : function(data){
					if (data.code == 100){
						alert("예약되었습니다.");
						location.href="/lesson06/quiz03/get_pension_view"
					}else {
						alert(data.errorMessage);
					}
				}
				,error:function(e){
					alert("예약하는데 실패했습니다.");
				}
			});
			});
		});

		
	</script>
		
</body>
</html>