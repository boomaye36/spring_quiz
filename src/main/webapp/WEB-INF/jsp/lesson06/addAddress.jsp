<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<body>
	<div class="container">
		<h1>즐겨 찾기 추가하기</h1>
		<form method="post" action="lesson06/quiz01/add_address">
			<div class="form-group"> 
				<label for="name">이름</label>
				<input type="text" id="name" name="name" class="form-control">
				<label for="address" class="mt-2">주소</label>
				<input type="text" id="address" name="address" class="form-control">
				<button type="button" id="addBtn" class="btn btn-success form-control mt-2">추가</button>
			</div>
		</form>
	
	</div>
<script>
	$(document).ready(function(){
		$('#addBtn').on('click', function(e){
			e.preventDefault();
			let name = $('#name').val().trim();
			if (name.length < 1){
				alert("이름을 입력하세요");
				return false;
			}
			let address = $('#address').val().trim();
			if(address.startsWith("http") == false && address.startsWith("https") == false){
				alert ("주소를 입력하세요")
				return false;
			}
			$.ajax({
				//request
				type:"post"
				, url:"/lesson06/quiz01/add_address" //api view가 아님
				, data : {"name" : name, "address" : address}
				
				//response
				, success : function(data){
					if (data == "success"){
						location.href="/lesson06/quiz01/get_address_view"
					}
					else{
						alert("입력 실패");
					}
					
				}
				,error: function(request, status, error){
					alert("에러" + e);
				}
			});
		});
	});
</script>

</body>
</html>