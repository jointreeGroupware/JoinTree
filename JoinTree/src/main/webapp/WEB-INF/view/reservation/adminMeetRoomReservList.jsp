<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>[경영지원팀]사원 회의실 예약 현황</title>
</head>
<body>
<!-- header -->
<jsp:include page="/WEB-INF/view/inc/header.jsp"/> 
<div class="container-fluid page-body-wrapper">
    <jsp:include page="/WEB-INF/view/inc/sideContent.jsp"/> <!-- 사이드바 -->
    <div class="content-wrapper"> <!-- 컨텐츠부분 wrapper -->
		<h4>경영지원팀 예약관리</h4>
	<div class="card">
		<div class="card-body">
			<div>
	            <label>예약일시:</label>
	            <input type="date" name="revStartTime"> ~ <input type="date" name="revEndTime">
	        </div>
			<div>
	            <label>예약 상태:</label>
	            <input type="radio" name="revStatus" value=""> 전체
	            <input type="radio" name="revStatus" value="A0301"> 예약완료
	            <input type="radio" name="revStatus" value="A0302"> 예약취소
	            <input type="radio" name="revStatus" value="A0303"> 사용완료
	        </div>
	        <div>
	        	<label>예약자:</label>
	        	<input type="text" name="empName">
	        	<button id="searchButton">검색</button>
	        </div>
        </div>
     </div>
		
        <table class="table">
            <thead>
                <tr>
                    <td>예약번호</td>
                    <td>예약자</td>
                    <td>회의실 이름</td>
                    <td>예약일시</td>
                    <td>예약 내용</td>
                    <td>예약 신청일</td>
                    <td>상태</td>
                    <td>최종수정자</td>
                    <td></td>
                </tr>
            </thead>
            <tbody id="reservationbody">
                <c:forEach var="r" items="${empAllMeetReserved}">
                    <tr>
                        <td>${r.revNo}</td>
                        <td>${r.empName}(${r.empNo})</td>
                        <td>${r.roomName}</td>
                        <td>${r.revStartTime.substring(0,16)} ~ ${r.revEndTime.substring(10,16)}</td>
                        <td>${r.revReason}</td>
                        <td>${r.createdate.substring(0,10)}</td>
                        <td>
                            <c:choose>
                                <c:when test="${r.revStatus == 'A0301'}">예약완료</c:when>
                                <c:when test="${r.revStatus == 'A0302'}">예약취소</c:when>
                                <c:when test="${r.revStatus == 'A0303'}">사용완료</c:when>
                            </c:choose>
                        </td>
                        <td>${r.updateName}(${r.updateId})</td>
                        <!-- 예약 완료인 상태에만 취소 버튼 활성화 / 사용완료 상태는 취소 버튼 X-->
                        <c:choose>
                            <c:when test="${r.revStatus == 'A0301'}">
                                <td><button class="btn btn-sm btn-primary cancel-btn" data-revno="${r.revNo}">취소</button></td>
                            </c:when>
                            <c:otherwise>
                                <td></td>
                            </c:otherwise>
                        </c:choose>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    <!-- 컨텐츠 끝 -->
    </div>
</div>
<!-- 컨텐츠전체 끝 -->
<!-- footer -->
<jsp:include page="/WEB-INF/view/inc/footer.jsp"/>
</body>
	<div id="empNo" data-empno="${loginAccount.empNo}"></div>
	<div id="empName" data-empname="${sessionScope.empName}"></div>
	<script src="/JoinTree/resource/js/reservation/adminMeetRoomReservList.js"></script>
</body>
</html>