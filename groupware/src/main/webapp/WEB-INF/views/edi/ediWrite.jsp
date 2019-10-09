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

th {
	background-color: #eee;
}
</style>
</head>
<body>
	
<jsp:include page="../include/header.jsp" />

<div class="virtual-box"></div>

<!-- 전자결재 입력 양식 -->

<div class="container">
	<div class="row">
		<div class="card" style="width: 200%;">

			<div class="card-header text-white" style="background: #343A40;">
				<h2>전자결재 입력화면</h2>
			</div>

			<div class="card-body">

				<!--START 전자결재 입력 폼 -->
				<form id="edi_write" action="/ediWrite" method="POST">
		
					
					<table class="table table-bordered">
						<colgroup>
							<col class="col-md-2">
							<col class="col-md-4">
							<col class="col-md-2">
							<col class="col-md-4">
						</colgroup>
						<tbody>
							<tr>
								<th style="vertical-align: middle;">제목</th>
								<td colspan="3">
									<input name="ediTitle" type="text" class="form-control"	placeholder="문서 제목입니다">
								</td>
							</tr>
							<tr>
								<th style="vertical-align: middle;">작성자</th>								
								<td>
									<input style="background-color: #eee;" type="text"
										class="form-control" value="오민철[IT개발부]" readonly>
									<input type="hidden" name="inpEmpCode" value="H0001">
								</td>
								<th style="vertical-align: middle;">결재자</th>
								<td>
									<input type="hidden" name="settEmpCode" value="H0002">
									<input type="button" id="edi_setter_main" 
										style="background-color: #eee; text-align: left;"
										class="form-control" data-target="#edi_setter" data-toggle="modal">
								</td>
							</tr>
							<tr>
								<th style="vertical-align: middle;">문서유형</th>
								<td>
									<div class="radio form-group">
										<label class="radio-inline"> 
											<input type="radio" name="ediType" value="0001" checked> 일반품의
										</label> 
										<label class="radio-inline"> 
											<input type="radio" name="ediType" value="0002"> 근태신청
										</label> 
										<label class="radio-inline"> 
											<input type="radio" name="ediType" value="0003"> 비용환급
										</label>
									</div>
								</td>
								<th style="vertical-align: middle;">첨부파일</th>
								<td>
									<input id="fileInput" type="file" data-class-button="btn btn-default"
										data-class-input="form-control" data-icon-name="fa fa-upload" 
										class="form-control" style="position: absolute; clip: rect(0px, 0px, 0px, 0px);">
									<div class="bootstrap-filestyle input-group">
										<input type="text" id="userfile" class="form-control" name="fileName" disabled> 
										<span class="group-span-filestyle input-group-btn" tabindex="0">
											<label for="fileInput" class="btn btn-default "> 
												<span class="glyphicon glyphicon-plus"></span>
											</label>
										</span>
									</div>
								</td>
							</tr>
							<tr>
								<th style="vertical-align: middle;">합의부서</th>
								<td id="co_work_dept_code">
								<select class="form-control" id="co_work_dept_code_select">
									<option value="IT">IT개발부</option>
									<option value="HR">인사부</option>
									<option value="SALES">영업부</option>
									<option value="FINANCE">재무관리부</option>
									<option value="MARKETING">마케팅부</option>
								</select>
									<p></p>
									<div id="co_work_dept_code_result">
										
									</div>
								</td>
								<th style="vertical-align: middle;">경유부서</th>
								<td colspan="3">
								<select class="form-control" id="inform_dept_code_select">
									<option value="IT">IT개발부</option>
									<option value="HR">인사부</option>
									<option value="SALES">영업부</option>
									<option value="FINANCE">재무관리부</option>
									<option value="MARKETING">마케팅부</option>
								</select>
									<p></p>
									<div id="inform_dept_code_result">
										
									</div>
								</td>
							</tr>
							<tr id="work_date" style="display: none;">
								<th style="vertical-align: middle;">근태일자</th>
								<td>
									<div class="input-group date">
										<input id="workDate" name="workDate" type="date"
											class="form-control"> 
										<span class="input-group-addon">
											<i class="glyphicon glyphicon-calendar"></i> 
										</span>
									</div>
								</td>
								<th style="vertical-align: middle;">근태유형</th>
								<td>
									<select class="form-control" name="workType" id="work_type">
										<option value="01">연차계</option>
										<option value="02">오전반차</option>
										<option value="03">오후반차</option>
										<option value="04">출장계</option>
									</select>
								</td>
							</tr>
							<tr>
								<th style="vertical-align: middle;">내용</th>
								<td colspan="3">
									<textarea name="ediContents" class="form-control" rows="7" placeholder="문서 내용입니다"></textarea>
								</td>
							</tr>

						</tbody>
					</table>

					<br>

					<div id="refund" style="display: none;">
						<!--START 비용환급 레이어-->
						<h3>비용환급</h3>

						<table class="table table-bordered">
							<colgroup>
								<col class="col-md-1">
								<col class="col-md-3">
								<col class="col-md-1">
								<col class="col-md-3">
								<col class="col-md-1">
								<col class="col-md-3">
							</colgroup>
							<tbody>
								<tr>
									<th style="vertical-align: middle;">계획예산</th>
									<td><input style="background-color: #eee;" type="text"
										class="form-control" value="1,000,000" readonly></td>
									<th style="vertical-align: middle;">사용예산</th>
									<td><input style="background-color: #eee;" type="text"
										class="form-control" value="600,000" readonly></td>
									<th style="vertical-align: middle;">가용예산</th>
									<td><input style="background-color: rgb(200, 243, 241);"
										type="text" class="form-control" value="400,000" readonly></td>
								</tr>
								<tr>
									<th style="vertical-align: middle;">입금계좌</th>
									<td><input style="background-color: #eee;" type="text"
										class="form-control" value="은행명 [110234093945]" readonly></td>
									<th style="vertical-align: middle;">사용처</th>
									<td><input type="text" class="form-control"
										placeholder="ex) 2019/09/18 뉴욕출장"></td>
									<th style="vertical-align: middle;">환급비용</th>
									<td><input type="text" class="form-control"
										placeholder="400,000"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--END 비용환급 레이어-->

					<br>

					<p style="text-align: center;">
						<button id="ediRegBtn" type="button" class="btn btn-dark btn-lg">문서등록</button>
						<a id="ediCancelBtn" type="button" href="/ediList/1" class="btn btn-default btn-lg">작성취소</a>
					</p>

				</form>
				<!--END 전자결재 입력 폼 -->

			</div>
		</div>
		<!-- row end -->
	</div>
	<!-- container end -->


<div class="container">
	<!-- START 모달레이어 팝업(결재자 찾기)-->
	<div class="modal fade" id="edi_setter" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
					<!-- header title -->
					<h4 class="modal-title">결재자 검색</h4>
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
</div>

</div>

<jsp:include page="../include/footer.jsp" />
<jsp:include page="../include/plugin-js.jsp" />


<script>

$(function () {

    $("input:radio[name=ediType]").click(function () {
        let checked_radio = $("input:radio[name=ediType]:checked").val();
        if (checked_radio === '0002') {
            $('#work_date').css("display", "");
            $('#refund').css("display", "none");
        } else if (checked_radio === '0003') {
            $('#work_date').css("display", "none");
            $('#refund').css("display", "");
        } else {
            $('#work_date').css("display", "none");
            $('#refund').css("display", "none");
        }
    });

    $(document).ready(function () {
        $("#fileInput").on('change', function () {
            if (window.FileReader) {  // modern browser    
                var filename = $(this)[0].files[0].name;
            } else {  // old IE    
                var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출    
            }
            // 추출한 파일명 삽입    
            $("#userfile").val(filename);
        });
    });




    $("#seachSett").click(function () {
        $("#nameSett").css("display", "");
    });

    $(".modal-body .btn-nameSetter").click(function () {
        let setterName = $(".modal-body .btn-nameSetter").val();
        $("#edi_setter_main").val(setterName);
    });

    $("#co_work_dept_code_select").change(function () {

    	const deptCode = $("#co_work_dept_code_select option:selected").val();
    	let size = $("input[name='coWorkDeptCode']").length;
    	
    	for(i=0; i<size; i++) {   //동일부서가 있는 경우 리턴
    		let chkVal = $("input[name='coWorkDeptCode']").eq(i).val();    		
     		if(chkVal === deptCode) {
                return;
            }  
    	}    

        $("#co_work_dept_code_result")
        .append('<input type="button" class="btn btn-info glyphicon glyphicon-remove"'
               +   'name="coWorkDeptCode" style="margin-left: 5px;" onclick="$(this).remove()">' 
               +'</button>');
        
        $("input[name=coWorkDeptCode]").last().val(deptCode);
    });

    $("#inform_dept_code_select").change(function () {
    	
    	const deptCode = $("#inform_dept_code_select option:selected").val();
    	let size = $("input[name='informDeptCode']").length;
    	
    	for(i=0; i<size; i++) {   //동일부서가 있는 경우 리턴
    		let chkVal = $("input[name='informDeptCode']").eq(i).val();    		
     		if(chkVal === deptCode) {
                return;
            }  
    	}    	
        
        $("#inform_dept_code_result")
        .append('<input type="button" class="btn btn-default glyphicon glyphicon-remove"'
        	   +   'name="informDeptCode" style="margin-left: 5px;" onclick="$(this).remove()">' 	  
               +'</input>');  
        
        $("input[name=informDeptCode]").last().val(deptCode);
        
    });
    
    $("#ediRegBtn").click(function(e){
    	e.preventDefault();
    	$("#edi_write").submit();
    });
   

});
    
</script>

</body>
</html>