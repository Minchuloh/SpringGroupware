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
a {
	hover: background-color: #FFCC99;
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
			
			<!--START 전자결재 입력 폼 -->
			<form action="/ediList/1" method="GET">	
					
                <table class="table table-bordered">
                    <colgroup>
                        <col width="15%">
						<col width="35%">
						<col width="15%">
						<col width="30%">
                    </colgroup>

                    <tbody>
                        <tr>
                            <th style="vertical-align: middle;">기간</th>
                            <td colspan="3">
                                    <input type="date" id="fDate" name="sDate" title="기간시작" /> ~
									<input type="date" id="tDate" name="fDate" title="기간끝" />
									<a href="#" class="btn btn-warning"><strong>1주일</strong></a>
									<a href="#" class="btn btn-warning"><strong>2주일</strong></a>
									<a href="#" class="btn btn-warning"><strong>1개월</strong></a>
                            </td>
                        </tr>
                        <tr>
                            <th style="vertical-align: middle;">문서번호</th>								
                            <td><input name="ediCode" type="text" class="form-control" placeholder="ex) E0000131"></td>                            
                            <th style="vertical-align: middle;">문서유형</th>
                            <td>
                                <select class="form-control" name="ediType" id="work_type">
                                    <option value="">===전체===</option>
                                    <option value="0001">일반품의</option>
                                    <option value="0002">근태신청</option>
									<option value="0003">비용환급</option>
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
                                <input type="hidden" name="inpEmpCode" value="H0078">
                                <input type="button" id="edi_setter_main" style="text-align: left;"  
                                    class="form-control" data-target="#edi_setter" data-toggle="modal">
                            </td>
                        </tr>             
                       
                    </tbody>
                </table>

                <div style="text-align: center;">
                    <input type="submit" class="btn btn-danger" value="검색하기"></a>
                    <a href="/ediWrite" class="btn btn-dark"><strong>등록하기</strong></a>
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
           		href="/ediList/${pc.beginPage-1}">이전</a>
          	</li>
		</c:if>
		
		<c:forEach var="pageNum" begin="${pageCreator.pageStart}" end="${pageCreator.pageRealEnd}">
           	<li class="page-item">
           		<a class="page-link page-custom ${(pageNum == pageCreator.pageNum) ? 'page-active' : ''}" 
           		href="/ediList/${pageNum}">${pageNum}</a>
           	</li>
           </c:forEach>
           
		<c:if test="${pageCreator.next}">
           	<li class="page-item">
           		<a id="page-next" class="page-link page-custom" 
           		href="/ediList/${pc.pageRealEnd+1}">다음</a>
           	</li>
       	</c:if>
    </ul>
    
    <div class="modal fade" id="edi_setter" role="dialog" data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- header -->
            <div class="modal-header">
                <!-- header title -->
                <h4 style="text-align: left;"class="modal-title">작성자 검색</h4>
            </div>
            <!-- body -->
            <div class="modal-body">
                <table class="table table-bordered">
                    <tbody>
                        <tr>
                            <th style="vertical-align: middle;">조회</th>
                            <td>
                                <div style="margin-bottom: 0px;"
                                    class="form-group form-inline input-group">
                                    <input type="text" name="empName" class="form-control" placeholder="이름을 입력하세요.">
                                    <button id="seachSett" class="btn btn-dark" type="submit">검색</button>
                                </div>
                            </td>
                        </tr>
                    </tbody>                      
                </table>  
                <div id="nameSett">
                    <hr>
                    
                </div>            
            </div>          

            <!-- Footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
    
</div>
	
</div><!-- end container -->

<jsp:include page="../include/footer.jsp" />
<jsp:include page="../include/plugin-js.jsp" />

<script>
$(function () {

    $("#seachSett").click(function (e) {
        
    	e.preventDefault();
    	
    	$("a[name=nameSetter]").remove();
    	
    	let empName = $("input[name=empName]").val();
    	
    	$.getJSON('/empSett/' + empName + '.json', function(empList) {		

			for (let i in empList) {	
				
				$("#nameSett").
				append('<a id="nameSetter" name="nameSetter" class="btn btn-nameSetter" margin-right="3px"' 
     			      +   'data-dismiss="modal" value="' + empList[i].empCode + '">'      			      
     				  +    empList[i].empName + ' [' + empList[i].deptName + ']' 
     				  +'</a>');				
			}  			
	
    	});   	
	
    });       
	
    
    $("#nameSett btn").click(function (e) {
    	e.preventDefault();
    	console.log("실행됨");
        let setterName = $("#nameSett .btn-nameSetter").val();        
        $("#edi_setter_main").val(setterName);
        $("a[name=nameSetter]").remove();
    });
    
    $(".modal-footer .btn").click(function() {
    	$("a[name=nameSetter]").remove();
    });


});
</script>

</body>
</html>