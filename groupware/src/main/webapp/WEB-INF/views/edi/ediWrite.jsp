<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/static-head.jsp" />
<style>
.virtual-box {
	margin-bottom: 120px;
}
</style>
</head>
<body>
<jsp:include page="../include/header.jsp" />

<!-- 전자결재 입력 양식 -->

<div class="virtual-box"></div>

<div class="container">
	<div class="row">
		<div class="card" style="width:200%;">
				<div class="card-header text-white" style="background: #343A40;">
					<h2><span style="color: gray;">MyCompany</span> 전자결재 작성화면</h2>
				</div>
				<div class="card-body">
					<form action="/emp" name="signup" id="signUpForm" method="post"	style="margin-bottom: 0;">						
						<table style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
						
							<tr>	<!-- 이름 입력 시작 -->
								<td style="text-align: left">
									<strong>작성자 이름</strong>&nbsp;&nbsp;&nbsp;<span id="nameChk"></span>
									<input type="text" name="empName" id="emp_name"
									class="form-control tooltipstered" maxlength="6"
									required="required" aria-required="true"
									style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
									placeholder="로그인 사원정보(추후 구현)"></td>
							</tr>	<!-- 이름 입력 종료 -->
							
							<tr>	<!-- 결재자 입력 시작 -->
								<td style="text-align: left">
									<strong>결재자 이름</strong>&nbsp;&nbsp;&nbsp;<span id="nameChk"></span>
									<input type="text" name="empName" id="emp_name"
									class="form-control tooltipstered" maxlength="6"
									required="required" aria-required="true"
									style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
									placeholder="부서기준 매니저 자동조회(추후구현)"></td>
							</tr>	<!-- 결재자 입력 종료 -->
							
							<tr>	<!-- 합의자 입력 시작 -->
								<td style="text-align: left">
									<strong>결재자 이름</strong>&nbsp;&nbsp;&nbsp;<span id="nameChk"></span>
									<input type="text" name="empName" id="emp_name"
									class="form-control tooltipstered" maxlength="6"
									required="required" aria-required="true"
									style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
									placeholder="직책자 매니저 자동조회(추후구현)"></td>
							</tr>	<!-- 합의자 입력 종료 -->								
							
							<tr>	<!-- 버튼 시작 -->
								<td>
									<div>
			                            <button id="regBtn" type="button" class="btn btn-dark form-control">등록</button>
			                            <button type="button" class="btn btn-danger form-control">취소</button>
			                       	</div>
			                    </td>
							</tr>	<!-- 버튼 종료 -->							
							
						</table>					
					</form>
				</div>	<!-- end card-body -->
			</div>	<!-- end card -->
		
	</div>
</div>

</div>	<!-- end container -->

<jsp:include page="../include/footer.jsp" />
<jsp:include page="../include/plugin-js.jsp" />

<script>

</script>

</body>
</html>