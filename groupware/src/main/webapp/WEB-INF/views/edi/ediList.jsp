<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/static-head.jsp" />
<style>
.virtual-box {
	margin-bottom: 120px;
}
.article-link {
	font-weight: 700;
	color: brown;
}
th {
       background-color: #eee;
   }
</style>
</head>
<body>

<jsp:include page="../include/header.jsp" />

<div class="virtual-box" style="margin-bottom: 20px;"></div>

<div class="container">
	<div class="row">
		<div class="card" style="width:200%;">
			<div class="card-header text-white" style="background: #343A40;">
				<h2><span style="color: gray;">MyCompany</span> 전자결재 조회</h2>
			</div>
			
			<div class="card-body">
			
			<!--START 전자결재 입력 폼 -->
			<form action="/ediList/1" method="GET">	
					
                <table class="table table-bordered">
                    <colgroup>
                        <col class="col-md-2">
                        <col class="col-md-4">
                        <col class="col-md-2">
                        <col class="col-md-4">
                    </colgroup>

                    <tbody>
                        <tr>
                            <th style="vertical-align: middle;">기간</th>
                            <td colspan="3">
                                    <input type="date" id="sDate" name="startDate" class="glyphicon glyphicon-calendar" title="기간시작" /> ~
									<input type="date" id="eDate" name="endDate" class="glyphicon glyphicon-calendar" title="기간끝" />
									<a href="#" class="btn btn-warning"><strong>1주일</strong></a>
									<a href="#" class="btn btn-warning"><strong>2주일</strong></a>
									<a href="#" class="btn btn-warning"><strong>1개월</strong></a>
                            </td>
                        </tr>
                        <tr>
                            <th style="vertical-align: middle;">문서번호</th>								
                            <td><input type="text" class="form-control" placeholder="ex) E1909010001"></td>                            
                            <th style="vertical-align: middle;">문서유형</th>
                            <td>
                                <select class="form-control" name="workType" id="work_type">
                                    <option value="00">전체</option>
                                    <option value="01">연차계</option>
                                    <option value="02">오전반차</option>
                                    <option value="03">오후반차</option>
                                    <option value="04">출장계</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th style="vertical-align: middle;">제목</th>
                            <td>
                                <input name="ediTitle" type="text" class="form-control"	placeholder="문서 제목입니다">
                            </td>                        
                            <th style="vertical-align: middle;">작성자</th>
                            <td>
                                <input type="hidden" name="settEmpCode" value="H0002">
                                <input type="button" id="edi_setter_main" style="text-align: left;"  
                                    class="form-control" data-target="#edi_setter" data-toggle="modal">
                            </td>
                        </tr>             
                       
                    </tbody>
                </table>

                <div style="text-align: center;">
                    <a href="/ediList/1" class="btn btn-danger"><strong>검색하기</strong></a>
                    <a href="/ediWrite" class="btn btn-default"><strong>등록하기</strong></a>
                </div>
            
            </form>			
			
            <table style="margin-top:30px;" class="table table-secondary table-hover table-border">
                <thead class="thead-dark">
                    <tr>
                        <th>문서번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>문서종류</th>                        
                        <th>작성일</th>                        
                        <th>결재상태</th>
                    </tr>
                </thead>
                
                <c:forEach var="edi" items="${ediList}" >
                    <!--게시물들이 들어갈 공간-->
                    <tr>
                        <td><a class="article-link" href="ediContent?ediCode=${edi.ediCode}">${edi.ediCode}</a></td>
                        <td>${edi.ediTitle}</td> 
                        <td>${edi.inpEmpName}</td>	                    
                        <td>${edi.ediTypeName}</td>                                 	
                        <td>
                            <fmt:formatDate value="${edi.inpDate}" pattern="yyyy년 MM월 dd일" />	                    
                        </td> 
                        <td>${edi.ediStatusName}</td>
                    </tr>
                </c:forEach>
            </table>
				
			</div>	<!-- card body end -->
			
			
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
    
    <div class="modal fade" id="edi_setter" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- header -->
            <div class="modal-header">
                <!-- 닫기(x) 버튼 -->
                <button type="button" class="close" data-dismiss="modal">×</button>
                <!-- header title -->
                <h4 class="modal-title">작성자 검색</h4>
            </div>
            <!-- body -->
            <div class="modal-body">
                <table class="table table-bordered">
                    <tbody>
                        <tr>
                            <th style="vertical-align: middle;">조회</th>
                            <td>
                                <div style="margin-bottom: 0px;"
                                    class="form-group form-inline">
                                    <input type="text" class="form-control"
                                        placeholder="이름을 입력하세요.">
                                    <button id="seachSett" class="btn btn-dark" type="submit"
                                        value="test">검색</button>
                                </div>
                            </td>
                        </tr>
                    </tbody>                      
                </table>  
                <div id="nameSett" style="display: none;">
                    <hr>
                    <input id="#nameSetter" class="btn-nameSetter btn btn-default"
                        data-dismiss="modal" value="오민철[IT개발부]">
                </div>            
            </div>          

            <!-- Footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                    data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
    
</div>
	
</div><!-- end container -->

<jsp:include page="../include/footer.jsp" />
<jsp:include page="../include/plugin-js.jsp" />

<script>
$(function () {

    $("#seachSett").click(function () {
        $("#nameSett").css("display", "");
    });
    $(".modal-body .btn-nameSetter").click(function () {
        let setterName = $(".modal-body .btn-nameSetter").val();
        $("#edi_setter_main").val(setterName);
    });
 
});
</script>
</body>
</html>