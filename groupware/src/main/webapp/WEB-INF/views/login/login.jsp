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

<!-- 로그인 양식 -->

<div class="virtual-box"></div>
<div class="container">
	<div class="row">
		<div class="offset-md-2 col-md-4">
			<div class="card" style="width:200%;">
				<div class="card-header text-white" style="background: #343A40;">
					<h2><span style="color: gray;">MyCompany</span> 로그인</h2>					
				</div>
				<div class="card-body">
					<form action="/loginCheck" name="izone-sign-in" method="post" id="signInForm"
					style="margin-bottom: 0;">
					<table style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
						<tr>
							<td style="text-align: left">
								<p><strong>아이디를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="idCheck"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="text" name="empCode" id="signInId"
								class="form-control tooltipstered" maxlength="10"
								required="required" aria-required="true"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
								placeholder="최대 10자"></td>
						</tr>
						<tr>
							<td style="text-align: left">
								<p><strong>비밀번호를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="pwCheck"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="password" size="17" maxlength="20" id="signInPw"
								name="password" class="form-control tooltipstered" 
								maxlength="20" required="required" aria-required="true"
								style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
								placeholder="최소 8자"></td>
						</tr>		
						
						
						<tr>
							<td style="padding-top: 10px; text-align: center">
								<p><strong>MyCompany의 그룹웨어 로그인 화면입니다.</strong></p>
							</td>
						</tr>
						<tr>
							<td style="width: 100%; text-align: center; colspan: 2;"><input
								type="submit" value="로그인" class="btn form-control tooltipstered" id="signIn-btn"
								style="background-color: #343A40; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">
							</td>
						</tr>						
						
					</table>
				</form>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../include/footer.jsp" />
<jsp:include page="../include/plugin-js.jsp" />
<script>

</script>
</body>
</html>