<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<link rel="stylesheet" type="text/css" href="/css/lesson05/style.css">
</head>
<body>
	
	<div class="container">
		<header>
			<h1 class="text-center">통나무 팬션</h1>
			<nav class="bg-warning">
                <ul class="nav nav-fill">
                    <li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">팬션소개</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">객실보기</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">예약안내</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">커뮤니티</a></li>
                </ul>
            </nav>
		</header>
		<section>
			<div class="banner">
				<img src="/img/test06_banner1.jpg" alt="banner"  id="bannerImage">
			</div>
			<div class="d-flex align-items-center justify-content-center text-light bg-warning">
				<div><h1 class="text-light">실시간 예약하기 </h1></div>
				<div><h4 class="text-light">예약 확인 </h4><br>
					<div class="form-group">
						<label for="name"><b class="text-light">이름: </b>
						<input type="text" id="name" name="name" class="form-control">
 						</label>
					</div>
					<div class="form-group">
						<label for=phoneNumber"><b class="text-light">전화번호: </b>
						<input type="text" id="phoneNumber" name="phoneNumber" class="form-control">
 						</label>
					</div>
					<button type="button" id="accessBtn" class="btn btn-success form-control mt-2">조회하기 </button>
					
				</div>
				<div>
					<h2>예약문의: </h2><br>
					<h2>010-</h2><br>
					<h2>0000-1111</h2>
				</div>
			</div>
	</section>
	<script>
		let bannerScrArr = ['/img/test06_banner1.jpg','/img/test06_banner2.jpg','/img/test06_banner3.jpg','/img/test06_banner4.jpg']
		let currentIndex = 0;
		setInterval(function(){
			$('#bannerImage').arrt('src', bannerScrArr[currentIndex]);
			currentIndex++;
			
			if (currentIndex > bannerSrcArr.length){
				currentIndex = 0;
			}
		}, 3000);
		});
		
		$(document).ready(function(){
			$('#accessBtn').on('click', function(){
				e.preventionDefault();
				let name = $('#name').val().trim();
				let phoneNumber = $('#phoneNumber').val().trim();
				if (name == 0){
					alert("이름을 입력하세요");
					return;
				}
				if (phoneNumber.startsWith("010") == false){
					alert("010으로 시작하는 번호를 입력하세요");
					return ;
				}
				$.ajax({
					type:"POST"
					,url : "/lesson06/search_booking"
					,data:{"name":name, "phoneNumber":phoneNumber}
					, success:function(data){
						if (data.code == 100){
							alert("이름:" + data.pension.name
									+ "\n날짜:" + data.pension.date.slice(0, 10)
									+ "\n일수:" + data.pension.day
									+"\n인원:" + data.pension.headcount
									+"\n상태:" + data.pension.state);	
						}else {
							alert("예약 내역이 없습니다.")
						}
					},error:function(e){
						alert("예약하는데 실패했습니다.");
				});
			});
		});
	</script>
</body>
</html>