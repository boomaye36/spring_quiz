<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<!-- jquery slim 제거-->
<!--<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
</head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>1.후보자 득표율</h1>
	<c:set var="num" value="10000" />
	<div class="container">
		<table class="table">
			<thead>
				<tr>
					<th>기호</th>
					<th>득표수</th>
					<th>득표율</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${candidates }" var="vote" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td><fmt:formatNumber value="${vote }" type="number" /></td>
						<td><fmt:formatNumber value="${vote / total }" type="percent" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<h1>카드 명세서</h1>
	<div class="container">
		<table class="table text-center">
			<thead>
				<tr>
					<th>사용처</th>
					<th>가격</th>
					<th>사용날짜</th>
					<th>할부</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cardBills }" var="card" varStatus="status">
					<tr>
						<td>${card.store }</td>
						<td><fmt:formatNumber value="${card.pay }" type="currency" /></td>
						<td>
							<fmt:parseDate value="${card.date }" pattern="yyyy-MM-dd일 " var="date"/>
							<fmt:formatDate value="${ date}" pattern="yyyy년 M월 dd일 " />
						</td>
	
						<td>${card.installment }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>