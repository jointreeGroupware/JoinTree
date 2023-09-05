<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<!-- header -->
	<jsp:include page="/WEB-INF/view/inc/header.jsp"/> 
	<script src="/JoinTree/resource/js/community/freeCommList.js"></script>
	<style>
		.selected-page {
		    font-weight: bold;
		    pointer-events: none; /* 버튼 클릭 불가 */
		}
	</style>

	<div class="container-fluid page-body-wrapper">
	<jsp:include page="/WEB-INF/view/inc/sideContent.jsp"/> <!-- 사이드바 -->
		<div class="content-wrapper"> <!-- 컨텐츠부분 wrapper -->
			<div class="col-lg-12 grid-margin stretch-card">
	        	<div class="card">
	              	<div class="card-body">
						<h1>자유 게시판</h1>
						<div>
							<a href="/JoinTree/community/freeCommList/addFreeComm">게시글 작성</a>
						</div>
						<!-- 검색 폼  -->
						<form class="form-inline">
						    <select name="searchOption" id="searchOption">
						        <option value="board_title">제목</option>
						        <option value="board_content">내용</option>
						        <option value="board_title_content">제목+내용</option>
						    </select> &nbsp;
						    <input type="text" name="searchText" id="searchText" placeholder="검색어를 입력하세요." class="form-control w-25"> &nbsp;
						    <button type="button" id="searchBtn">검색</button>
						</form>
							
						<table class="table table-bordered">
						    <thead id="pinnedList">
						    </thead>
						    <tbody id="commList">
						        
						    </tbody>
						</table>
						<br>
						
						<!-- 페이지 내비게이션  -->
						<div id="pagination" class="btn-group" style="text-align: center;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</html>