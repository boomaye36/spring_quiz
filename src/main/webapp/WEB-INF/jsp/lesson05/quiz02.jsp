<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <!-- jquery slim 제거-->
        <!--<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<meta charset="UTF-8">
</head>
<body>
	<h2>HOT 5</h2>
	
	
	<table class="table text-center">
		<thead>
			<tr>
				<th>순위</th>
				<th>제목 </th>
				
			</tr>
		
		</thead>
	
		<tbody>
			<c:forEach items="${musicRank}" var="musicR" varstatus="status">
			<tr>
				<td>${status.count}</td>
				<td>${musicR}</td>
				
			</tr>
			</c:forEach>
		</tbody>
		
	</table>
	<h1>맴버</h1>
	<table class="table text-center">
		<thead>
			<tr>
				<th>이름 </th>
				<th>전화번호 </th>
				<th>등급 </th>
				<th>포인트 </th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${membership}" var="member" varStatus="status" >
			<tr>
				<td>${member.name}</td>
				<td>${member.phoneNumber }</td>
				<td>${member.grade }
					<c:choose>
						<c:when test="${member.grade eq 'VIP' }">
							<span class="text-danger">${member.grade }</span> 
						</c:when>
						<c:when test="${member.grade eq 'GOLD' }">
							<span class="text-warning">${member.grade }</span> 
						</c:when>
						<c:otherwise>
						
							${member.grade }
						</c:otherwise>
					</c:choose> 
					</td>
				<td>${member.point }P
					<c:choose>
						<c:when test="${member.point >= 5000 }">
							<span class="text-primary">${member.point }</span>
						<c:otherwise>
							${member.point }
						</c:otherwise>
						</c:when>
						
					</c:choose>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
</body>
</html>