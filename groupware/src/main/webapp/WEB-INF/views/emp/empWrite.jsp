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

<!-- 신규사원 입력 양식 -->

<div class="virtual-box"></div>
z
<div class="container">
	<div class="row">
		<div class="offset-md-2 col-md-4">
			<div class="card" style="width:200%;">
				<div class="card-header text-white" style="background: #343A40;">
					<h2><span style="color: gray;">MyCompany</span> 신규사원 등록화면</h2>
				</div>
				<div class="card-body">
					<form action="/emp" name="signup" id="signUpForm" method="post"	style="margin-bottom: 0;">						
						<table style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
						
							<tr>	<!-- 이름 입력 시작 -->
								<td style="text-align: left">
									<strong>사원 이름을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="nameChk"></span>
									<input type="text" name="empName" id="emp_name"
									class="form-control tooltipstered" maxlength="6"
									required="required" aria-required="true"
									style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
									placeholder="한글로 최대 10자"></td>
							</tr>	<!-- 이름 입력 종료 -->
							
							<tr>	<!-- 패스워드 입력 시작 -->
								<td style="text-align: left">
									<p><strong>비밀번호를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="pwChk"></span></p>
								</td>
							</tr>
							<tr>
								<td><input type="password" size="17" maxlength="20" id="password"
									name="password" class="form-control tooltipstered" 
									maxlength="20" required="required" aria-required="true"
									style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
									placeholder="영문과 특수문자를 포함한 최소 8자">
								</td>
							</tr>
							<tr>
								<td style="text-align: left">
									<p><strong>비밀번호를 재확인해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="pwChk2"></span></p>
								</td>
							</tr>
							<tr>
								<td><input type="password" size="17" maxlength="20" id="password_check"
									name="pw_check" class="form-control tooltipstered" 
									maxlength="20" required="required" aria-required="true"
									style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
									placeholder="비밀번호가 일치해야합니다."></td>
							</tr>	<!-- 패스워드 입력 종료 -->
							
							<tr>	<!-- 이메일 입력 시작 -->
								<td style="text-align: left">
									<p><strong>이메일을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="emailChk"></span></p>
								</td>
							</tr>
							<tr>
								<td><input type="email" name="email" id="emp_email"
									class="form-control tooltipstered" 
									required="required" aria-required="true"
									style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
									placeholder="ex) abc@mvc.com"></td>
							</tr>	<!-- 이메일 입력 종료 -->
							
							<tr>	<!-- 연락처 입력 시작 -->
								<td style="text-align: left">
									<p><strong>연락처를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="phoneChk"></span></p>
								</td>
							</tr>
							<tr>
								<td><input type="text" name="phone" id="emp_phone"
									class="form-control tooltipstered" 
									required="required" aria-required="true"
									onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
									style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
									placeholder="ex) 01012345678"></td>
							</tr>	<!-- 연락처 입력 종료 -->
							
							<tr>	<!-- 부서코드 입력 시작 -->
								<td style="text-align: left">
									<p><strong>부서를 선택해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="deptCodeChk"></span></p>
								</td>
							</tr>							
							<tr>		
								<td>			
									<div class="form-group">
					                    <select class="form-control" name="deptCode" id="dept_code">
					                        <option value="IT">IT개발부</option>
					                        <option value="HR">인사부</option>
					                        <option value="SALES">영업부</option>
					                        <option value="FINANCE">재무관리부</option>
					                        <option value="MARKETING">마케팅부</option>
					                    </select>                
									</div>
								</td>								
							</tr>	<!-- 부서코드 입력 종료 -->
							
							<tr>	<!-- 직책 입력 시작 -->
								<td style="text-align: left">
									<p><strong>직책을 선택해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="positionChk"></span></p>
								</td>
							</tr>							
							<tr>		
								<td>			
									<div class="form-group">
					                    <select class="form-control" name="position" id="position">
					                        <option value="INTERN">INTERN</option>
					                        <option value="MANAGER">MANAGER</option>
					                        <option value="PARTNER">PARTNER</option>
					                        <option value="CEO">CEO</option>
					                    </select>                
									</div>
								</td>								
							</tr>	<!-- 직책 입력 종료 -->
							
							<tr>	<!-- 연봉 입력 시작 -->
								<td style="text-align: left">
									<p><strong>연봉을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="salaryChk"></span></p>
								</td>
							</tr>							
							<tr>		
								<td><input type="text" name="salary" id="salary"
									class="form-control tooltipstered" 
									required="required" aria-required="true"
									onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
									style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
									placeholder="ex) 40,000,000"></td>								
							</tr>	<!-- 연봉 입력 종료 -->
					
							<tr>	<!-- 은행명 입력 시작 -->
								<td style="text-align: left">
									<p><strong>은행을 선택해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="bankChk"></span></p>
								</td>
							</tr>							
							<tr>		
								<td>			
									<div class="form-group">
					                    <select class="form-control" name="bankName" id="bank_name">
					                        <option value="KB국민" ${param.bankName == 'KB국민' ? 'selected' : ''}>KB국민</option>
					                        <option value="KEB하나" ${param.bankName == 'KEB하나' ? 'selected' : ''}>KEB하나</option>
					                        <option value="신한" ${param.bankName == '신한' ? 'selected' : ''}>신한</option>
					                        <option value="우리" ${param.bankName == '우리' ? 'selected' : ''}>우리</option>
					                        <option value="케이뱅크" ${param.bankName == '케이뱅크' ? 'selected' : ''}>케이뱅크</option>
					                        <option value="카카오뱅크" ${param.bankName == '카카오뱅크' ? 'selected' : ''}>카카오뱅크</option>
					                        <option value="NH농협" ${param.bankName == 'NH농협' ? 'selected' : ''}>NH농협</option>
					                        <option value="수협"  ${param.bankName == '수협' ? 'selected' : ''}>수협</option>
					                        <option value="KDB산업" ${param.bankName == 'KDB산업' ? 'selected' : ''}>KDB산업</option>
					                    </select>                
									</div>
								</td>								
							</tr>	<!-- 은행명 입력 종료 -->
							
							<tr>	<!-- 은행계좌 입력 시작 -->
								<td style="text-align: left">
									<p><strong>은행계좌를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="bankAccountChk"></span></p>
								</td>
							</tr>							
							<tr>		
								<td><input type="text" name="bankAccount" id="bank_account"
									class="form-control tooltipstered" 
									required="required" aria-required="true"
									onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
									style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
									placeholder="ex)1101234567"></td>								
							</tr>	<!-- 은행계좌 입력 종료 -->
			
							<tr>	<!-- 증명사진 입력 시작 -->
								<td style="text-align: left">
									<strong>증명사진을 등록해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="photoChk"></span>
									<input type="text" name="photo" id="photo"
									class="form-control tooltipstered" maxlength="6"
									required="required" aria-required="true"
									style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
									placeholder="증명사진 등록(미구현)"></td>
							</tr>	<!-- 증명사진 입력 종료 -->
							
							<tr>	<!-- 입사일 입력 시작 -->
								<td style="text-align: left">
									<p><strong>입사일을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="hireDateChk"></span></p>
								</td>
							</tr>
							<tr>
								<td style="text-align: left">						
							        <div class="input-group date">
							            <input id="hireDate" name="hireDate" type="date" class="form-control">
							            	<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i>
							            	</span>
							        </div>			
								</td>
							</tr>	<!-- 입사일 입력 종료 -->
							
							<tr>
								<td style="padding-top: 10px; text-align: center">
									<p><strong>myCompany의 신규입사자를 등록합니다!</strong></p>
								</td>
							</tr>
							
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
		</div>	<!-- end offset-md-2 col-md-4 -->
	</div>	<!-- end row -->
</div>	<!-- end container -->
<jsp:include page="../include/footer.jsp" />
<jsp:include page="../include/plugin-js.jsp" />

<script>
$(function() {	
	
	//입력값 검증 정규표현식
	const getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
	const getName= RegExp(/^[가-힣]+$/);
	const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	
	const regForm = $("#signUpForm");
	
	//입력값 검증을 마칠 경우 true로 설정 
	//(chk1 : 이름검증, chk2: 비번검증, chk3: 비번확인란, chk4: 이메일, chk5: 연락처)
	let chk1 = false, chk2 = false, chk3 = false, chk4 = false, chk5 = false;
	
	//이름 입력값 검증.
	$('#emp_name').on('keyup', function() {
		//이름값 공백 확인
		if($("#emp_name").val() === ""){
		    $('#emp_name').css("background-color", "pink");
			$('#nameChk').html('<b style="font-size:14px;color:red;">[이름은 필수정보입니다!]</b>');
			chk1 = false;			
		}		         
		//이름값 유효성검사
		else if(!getName.test($("#emp_name").val())){
		    $('#emp_name').css("background-color", "pink");
			$('#nameChk').html('<b style="font-size:14px;color:red;">[이름은 한글로 작성해주세요!]</b>');
			chk1 = false;
		} else {
			$('#emp_name').css("background-color", "aqua");
			$('#nameChk').html('<b style="font-size:14px;color:green;">[확인되었습니다!]</b>');
			chk1 = true;
		}
		
	});
	
	//패스워드 입력값 검증.
	$('#password').on('keyup', function() {
		//비밀번호 공백 확인
		if($("#password").val() === ""){
		    $('#password').css("background-color", "pink");
			$('#pwChk').html('<b style="font-size:14px;color:red;">[패스워드는 필수정보입니다!]</b>');
			chk2 = false;
		}		         
		//비밀번호 유효성검사
		else if(!getPwCheck.test($("#password").val()) || $("#password").val().length < 8){
		    $('#password').css("background-color", "pink");
			$('#pwChk').html('<b style="font-size:14px;color:red;">[특수문자 포함 8자 이상입니다!]</b>');
			chk2 = false;
		} else {
			$('#password').css("background-color", "aqua");
			$('#pwChk').html('<b style="font-size:14px;color:green;">[확인되었습니다!]</b>');
			chk2 = true;
		}		
	});
	
	//패스워드 확인란 입력값 검증.
	$('#password_check').on('keyup', function() {
		//비밀번호 확인란 공백 확인
		if($("#password_check").val() === ""){
		    $('#password_check').css("background-color", "pink");
			$('#pwChk2').html('<b style="font-size:14px;color:red;">[패스워드 확인은 필수정보입니다!]</b>');
			chk3 = false;
		}		         
		//비밀번호 확인란 유효성검사
		else if($("#password").val() != $("#password_check").val()){
		    $('#password_check').css("background-color", "pink");
			$('#pwChk2').html('<b style="font-size:14px;color:red;">[기존 입력된 비밀번호와 다릅니다!]</b>');
			chk3 = false;
		} else {
			$('#password_check').css("background-color", "aqua");
			$('#pwChk2').html('<b style="font-size:14px;color:green;">[확인되었습니다!]</b>');
			chk3 = true;
		}		
	});
	
	//이메일 입력값 검증.
	$('#emp_email').on('keyup', function() {
		//이메일값 공백 확인
		if($("#emp_email").val() == ""){
		    $('#emp_email').css("background-color", "pink");
			$('#emailChk').html('<b style="font-size:16px;color:red;">[이메일은 필수정보에요!]</b>');
			chk4 = false;
		}		         
		//이메일값 유효성검사
		else if(!getMail.test($("#emp_email").val())){
		    $('#emp_email').css("background-color", "pink");
			$('#emailChk').html('<b style="font-size:16px;color:red;">[이메일 형식이 아닙니다?]</b>');
			chk4 = false;
		} else {
			
			//이메일 중복확인 비동기 통신
			const email = $(this).val();
			
			$.getJSON("/check?kind=email&info="+email, result => {
				if(!result) {
					$("#emp_email").css("background-color", "aqua");
					$("#emailChk").html("<b style='font-size:14px; color:green;'>[사용 가능한 이메일입니다!]</b>");						
					chk4 = true;
				} else {
					$("#emp_email").css("background-color", "pink");
					$("#emailChk").html("<b style='font-size:14px; color:red;'>[이메일이 중복됩니다!]</b>");						
					chk4 = false;
				}
			});		
		}
		
	});
	
	//연락처 입력값 검증.
	$('#emp_phone').on('keyup', function() {
		//연락처값 공백 확인
		if($("#emp_phone").val() == ""){
		    $('#emp_phone').css("background-color", "pink");
			$('#phoneChk').html('<b style="font-size:16px;color:red;">[연락처는 필수정보에요!]</b>');
			chk5 = false;
		} else {			
			//연락처 중복확인 비동기 통신
			const phone = $(this).val();
			
			$.getJSON("/check?kind=phone&info="+phone, result => {
				if(!result) {
					$("#emp_phone").css("background-color", "aqua");
					$("#phoneChk").html("<b style='font-size:14px; color:green;'>[사용 가능한 연락처입니다!]</b>");						
					chk5 = true;
				} else {
					$("#emp_phone").css("background-color", "pink");
					$("#phoneChk").html("<b style='font-size:14px; color:red;'>[연락처가 중복됩니다!]</b>");						
					chk5 = false;
				}
			});		
		}
		
	});
	
	$("#regBtn").click(() => {
		let chk = confirm("게시글 등록을 완료하시겠습니까?");
		console.log("chk1: " + chk1 
				+ ", chk2 : " + chk2
				+ ", chk3 : " + chk3
				+ ", chk4 : " + chk4
				+ ", chk5 : " + chk5);
		if(chk1 && chk2 && chk3 && chk4 && chk5) {
			regForm.submit(); //서버로 폼전송
		} else {
			alert("입력정보를 다시 확인하세요!");
		}
	});
		
});
</script>

</body>
</html>