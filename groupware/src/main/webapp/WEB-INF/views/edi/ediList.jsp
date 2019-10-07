<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/static-head.jsp" />
<style>
	.article-link {
		font-weight: 700;
		color: brown;
	}
</style>
</head>
<body>

<jsp:include page="../include/header.jsp" />

<div class="virtual-box"></div>

<div class="container">
	<div class="row">
		<div class="card" style="width:200%;">
			<div class="card-header text-white" style="background: #343A40;">
				<h2><span style="color: gray;">MyCompany</span> 전자결재 조회</h2>
			</div>
			
			<div class="card-body">
			
				<form id="ediSearch" name="ediSearch" method="get" action="/ediList">
					
					<table style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
						<tbody>
							<tr>
								<th scope="row">기간</th>
								<td>
									<input type="date" id="sDate" name="startDate" class="glyphicon glyphicon-calendar" title="기간시작" /> ~
									<input type="date" id="eDate" name="endDate" class="glyphicon glyphicon-calendar" title="기간끝" />
									<a href="#" class="btn btn-warning"><strong>1주일</strong></a>
									<a href="#" class="btn btn-warning"><strong>2주일</strong></a>
									<a href="#" class="btn btn-warning"><strong>1개월</strong></a>
								</td>
							</tr>
							<tr>
								<th>문서번호</th>
								<td><input type="text" id="ediCode" name="ediCode" value="" class="" /></td>
								
								<th>문서종류</th>
								<td>
									<select id="searchDocCode" name="searchDocCode" class="w_auto" onchange="showDocTypeList('ALL');">
										<option value='0001'>일반품의</option> 
										<option value='0002'>근태신청</option> 
										<option value='0003'>환급비용처리</option>  
									</select>
								</td>
							</tr>					
							<tr>
								<th scope="row">제목</th>
								<td><input type="text" id="subject" name="subject" value="" /></td>
								<th scope="row">작성자</th>
								<td><input type="text" id="searchName" name="searchName" value="" /></td>
							</tr>
						</tbody>
					</table>
					<br>
					<div style="text-align: center;">
						<a href="#n" class="btn btn-danger"><strong>검색하기</strong></a>
						<a href="/ediWrite" class="btn btn-secondary"><strong>등록하기</strong></a>
					</div>		
				</form>
				
			</div>	<!-- card body end -->
			
			 <table style="margin-top:30px;" class="table table-secondary table-hover table-border">
	                <thead class="thead-dark">
	                    <tr>
	                        <th>문서번호</th>
	                        <th>작성자</th>
	                        <th>문서종류</th>
	                        <th>작성일</th>
	                        <th>제목</th>
	                        <th>결재상태</th>
	                    </tr>
	                </thead>
					
					<c:forEach var="edi" items="${ediList}" >
		                <!--게시물들이 들어갈 공간-->
		                <tr>
		                    <td>${edi.ediCode}</td>
		                    <td>${edi.inpEmpName}</td>	                    
		                    <td>${edi.ediTypeName}</td>
		                    <td>
		                    	<fmt:formatDate value="${edi.inpDate}" pattern="yyyy년 MM월 dd일 a hh:mm" />	                    
		                    </td>                	
		                    <td>${edi.ediTitle}</td> 
		                    <td>${edi.ediStatusName}</td>
		                </tr>
	                </c:forEach>
	            </table>
		</div>
	</div><!-- end row -->
	
	<!--페이징 처리 부분-->
    <ul class="pagination justify-content-center">
		<c:if test="${pageCreator.prev}">
           	<li class="page-item">
           		<a id="page-prev" class="page-link page-custom" 
           		href="/ediList/${pc.beginPage-1}?keyword=${search.keyword}&condition=${search.condition}">이전</a>
          	</li>
		</c:if>
		
		<c:forEach var="pageNum" begin="${pageCreator.pageStart}" end="${pageCreator.pageRealEnd}">
           	<li class="page-item">
           		<a class="page-link page-custom ${(pageNum == pageCreator.pageNum) ? 'page-active' : ''}" 
           		href="/ediList/${pageNum}?keyword=${search.keyword}&condition=${search.condition}">${pageNum}</a>
           	</li>
           </c:forEach>
           
		<c:if test="${pageCreator.next}">
           	<li class="page-item">
           		<a id="page-next" class="page-link page-custom" 
           		href="/ediList/${pc.pageRealEnd+1}?keyword=${search.keyword}&condition=${search.condition}">다음</a>
           	</li>
       	</c:if>
    </ul>
	
</div><!-- end container -->

<jsp:include page="../include/footer.jsp" />
<jsp:include page="../include/plugin-js.jsp" />

<script>

</script>
</body>
</html>