<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/static-head.jsp" />

<style>
.virtual-box {
	margin-bottom: 120px;
}
th {
	background-color: #eee;
}
td {
	vertical-align: middle !important;
}
.article-link {
		font-weight: 700;
		color: brown;
	}
</style>
</head>
<body>
	
<jsp:include page="../include/header.jsp" />

<div class="virtual-box"></div>

<!-- 전자결재 상세 화면 -->

<div class="container">
<div class="row">
		
	<br>

	<div class="card" style="width: 200%;">

		<div class="card-header text-white" style="background: #343A40;">
			<h2>전자결재 조회화면 </h2>
		</div>

		<div class="card-body">			
			
			<!-- 문서내용  START -->
			<h4>문서내용</h4>
			<table class="table table-bordered">
				<colgroup>
					<col width="20%">
					<col width="30%">
					<col width="20%">
					<col width="30%">
				</colgroup>

				<tbody>
					<tr>
						<th style="vertical-align: middle;">문서번호</th>
						<td>${edi.ediCode}</td>
						<th style="vertical-align: middle;">결재상태</th>
						<td>${edi.ediStatusName}</td>						
					</tr>
					<tr>
						<th style="vertical-align: middle;">제목</th>
						<td colspan="3">${edi.ediTitle}</td>
					</tr>
					<tr>
						<th style="vertical-align: middle;">작성자</th>
						<td>${edi.inpEmpName} [${edi.deptName}]</td>
						<th style="vertical-align: middle;">작성일</th>
						<td><fmt:formatDate value="${edi.inpDate}" pattern="yyyy년 MM월 dd일 a hh:mm" /></td>
					</tr>
					<tr>
						<th style="vertical-align: middle;">문서유형</th>
						<td>${edi.ediTypeName}</td>
						<th style="vertical-align: middle;">첨부파일</th>
						<td>${edi.fileName}</td>
					</tr>
					<c:if test="${not empty workDay}">
					<tr id="work_date">
						<th style="vertical-align: middle;">근태일자</th>
						<td><fmt:formatDate value="${workDay.ediWorkDate}" pattern="yyyy년 MM월 dd일 " /></td>
						<th style="vertical-align: middle;">근태유형</th>
						<td>${workDay.workType}</td>
					</tr>
					</c:if>
					<tr>
						<th style="vertical-align: middle;">내용</th>
						<td colspan="3">${edi.ediContents}</td>
					</tr>					
				</tbody>
			</table>			
			<!-- 문서내용  END -->
			
			<!--START 비용환급 레이어-->
			
			<c:if test="${not empty refund && edi.ediType eq '0003'}">
			<div id="refund">
			<br>
			<h4>비용환급</h4>
				<table class="table table-bordered" style="margin-bottom: 3px;">
					<colgroup>
						<col width="10%">
						<col width="20%">
						<col width="10%">
						<col width="20%">
						<col width="10%">
						<col width="20%">
					</colgroup>
					<tbody>
						<tr>
							<th style="vertical-align: middle;">계획예산</th>
							<td>${refund.planTotalBudget}</td>
							<th style="vertical-align: middle;">사용예산</th>
							<td>${refund.planUseBudget}</td>
							<th style="vertical-align: middle;">가용예산</th>
							<td>${refund.availableBudget}</td>
						</tr>
						<tr>
							<th style="vertical-align: middle;">입금계좌</th>									
							<td>${refund.bankName} [${refund.bankAccount}]</td>
							<th style="vertical-align: middle;">환급일자</th>
							<td><fmt:formatDate value="${refund.refundDate}" pattern="yyyy년 MM월 dd일 " /></td>
							<th style="vertical-align: middle;">환급비용</th>
							<td>${refund.useBudget}</td>
						</tr>
					</tbody>
				</table>
				<span style="margin: 0; color:blueviolet;">*작성자 부서(${edi.deptName})의 예산범위 내에서 환급가능합니다.</span>
			</div>  <!--end 비용환급 레이어-->
			
			</c:if>
			
			<br>
			
					<!-- 결재현황  START -->
			<h4>결재현황</h4>
			<table class="table table-bordered">
				<colgroup>
					<col width="6%">
					<col width="10%">
					<col width="20%">
					<col width="48%">
					<col width="12%">
				</colgroup>
				<tbody>					
					<tr>
						<th>차수</th>
						<th>결재자</th>
						<th>결재일시</th>
						<th>결재자 첨언</th>
						<th>결재상태
					</tr>
					<c:forEach var="sett" items="${sett}" >
						<input type="hidden" value="${sett.ediSettStatus}" >
						<tr>
							<td>${sett.ediSeq}</td>
							<td>${sett.settEmpName}</td>
							<td><fmt:formatDate value="${sett.updateDate}" pattern="yyyy년 MM월 dd일 " /></td>
							
							<c:choose>
								<c:when test="${not empty sett.ediComments}">
									<td>${sett.ediComments}</td>
									<td>${sett.ediSettStatusName}</td>
								</c:when>
								<c:when test="${empty sett.ediComments && emp.empCode eq sett.settEmpCode && sett.ediSettStatus eq '0'}">
									<td>
										<input id="settComments" class="form-control" placeholder="결재 시 첨언을 작성하세요.">																			
									</td>
									<td>
										<a class="article-link" href="#">결재click!</a>
									</td>
								</c:when>
								<c:otherwise>
									<td></td>
									<td>${sett.ediSettStatusName}</td>
								</c:otherwise>
							</c:choose>
						</tr>	
					</c:forEach>				
				</tbody>
			</table>
			<!-- 결재현황  END -->				

			
				
			<!-- 합의현황  START -->
			<c:if test="${not empty coWork}">
			
			<br>
			
			<h4>합의현황</h4>
			<table class="table table-bordered">
				<colgroup>
					<col width="15%">
					<col width="20%">
					<col width="45%">
					<col width="12%">
				</colgroup>
				<tbody>
					<tr>
						<th>합의부서</th>
						<th>합의일시</th>
						<th>합의자 첨언</th>
						<th>합의상태</th>
					</tr>
					
					<c:if test="${not empty coWork}">
						<c:forEach var="coWork" items="${coWork}">
							<input type="hidden" name="ediCoWorkStatus" value="${coWork.ediCoWorkStatus}">
							<tr>
								<td>${coWork.mgrEmpName} [${coWork.coWorkDeptName}]</td>
								<td><fmt:formatDate value="${coWork.updateDate}" pattern="yyyy년 MM월 dd일 " /></td>
								<c:if test="${edi.ediStatus eq '0'}">
									<c:choose>												
										<c:when test="${coWork.ediCoWorkStatus eq '0' && emp.empCode eq coWork.mgrEmpCode}">
											<td>
												<input id="settComments" class="form-control" placeholder="합의 시 첨언을 작성하세요.">																			
											</td>
											<td>
												<a class="article-link" class='btn' id="coWorkBtn" href="">합의click!</a>
											</td>
										</c:when>
										<c:otherwise>
											<td>${coWork.ediCoWorkComments}</td>
											<td>${coWork.ediCoWorkStatusName}</td>
										</c:otherwise>
									</c:choose>															
								</c:if>																					
							</tr>
						</c:forEach>				
					</c:if>
				</tbody>
			</table>
			
			</c:if>
			<!-- 합의현황  END -->		
			
			<!-- 경유부서  START -->
			<c:if test="${not empty inform}">
			
			<br>
			
			<h4>경유부서</h4>
			<table class="table table-bordered">
				<colgroup>
					<col width="15%">				
					<col width="85%">
				</colgroup>
				<tbody>
					<tr>
						<th>경유부서</th>
						<td>
							<c:forEach var="inform" items="${inform}" >
								${inform.informDeptName}&nbsp;&nbsp;
							</c:forEach>
						</td>
						
					</tr>					
				</tbody>
			</table>
			
			</c:if>
			<!-- 경유부서  END -->
			<br>
				<p style="text-align: center;">
					
					<c:if test="${edi.ediStatus eq '0'}">
						<c:forEach items="${sett}" var="sett" varStatus="status">
							<c:if test="${status.last}">
								<c:if test="${sett.ediSettStatus eq '0' && emp.empCode eq sett.settEmpCode}">
									
								</c:if>
							</c:if>
						</c:forEach>
					</c:if>
					
					
					<c:if test="${edi.ediStatus ne '1' || edi.ediStatus ne '2' && emp.empCode eq edi.inpEmpCode }">
						<button id="ediDelBtn" type="button" class="btn btn-danger btn-lg">문서삭제</button>					
					</c:if>
					<a id="ediListBtn" type="button" href="/ediList/1" class="btn btn-default btn-lg">목록으로</a>
				</p>

		</div>	<!-- end card-body -->
		

	</div>	<!-- End card -->
	
</div>	<!-- END ROW-->	

</div>

<input type="hidden" id="deptCode" value="${emp.deptCode}">
<input type="hidden" id="ediCode" value="${edi.ediCode}">

<jsp:include page="../include/footer.jsp" />
<jsp:include page="../include/plugin-js.jsp" />


<script>
$(function () {
	
	$("#ediDelBtn").click(function(){
		
		if(!confirm("해당 문서를 삭제하시겠습니까?")) {
			return;
		}
		
		const ediCode = "${edi.ediCode}";
		
		$.ajax({
			type : "DELETE",
	        url : "/ediList/del/" + ediCode,
	        headers : {
	            "Content-type" : "application/json",
	            "X-HTTP-Method-Override" : "DELETE"
	        },
	        dataType : "text",
	        success : function (result) {
	            if (result === "delSuccess") {
	                alert("문서 삭제 완료!");
	                location.href="/ediList/1";
	            }
	        }
		});
	});
	
	$("#coWorkBtn").click(function(e){
		
		e.preventDefault();	
		
		if(!confirm("해당 문서에 합의하시겠습니까?")) {
			return;
		}
		
		console.log($("#ediCode").val());

		const ediCoWork =  {
			coWorkDeptCode : $("#deptCode").val(),
			ediCoWorkComments :	$("#settComments").val(),
			ediCode : $("#ediCode").val()
		}

		$.ajax({
			type: "POST",
			url: "/ediList/cowork",
			headers : {
				"Content-type" : "application/json",
				"X-HTTP-Method-Override": "POST" 
			},
			dataType : "text",
			data: JSON.stringify(ediCoWork),
			success : function (result) {
	            if (result === "cowork Success") {
	                alert("문서 합의 완료!");
	            }
	            location.reload();
	        },
	        error: (e) => {
				console.log("통신 실패: " + e);
			}
		});
	});
	
});
    
</script>

</body>
</html>