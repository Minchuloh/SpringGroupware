<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="formant" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/static-head.jsp" />

<style>
.virtual-box {
	margin-bottom: 120px !important;
}
th {
	background-color: #eee !important;
	vertical-align: middle !important;
}
td {
	vertical-align: middle !important;
}
</style>
</head>
<body>
	
<jsp:include page="../include/header.jsp" />

<!-- 전자결재 입력 양식 -->

<div class="container">

<div class="virtual-box"></div>
	
	<div class="row">
	
		<div class="card" style="width: 200%;">
		
		<div class="card-header text-white" style="background: #343A40;">
			<h2>전자결재 입력화면</h2>
		</div>
		
		
		<!--START 전자결재 입력 폼 -->
		<form style="" id="edi_write" action="/ediWrite" method="POST">					
		
			<div id="coWorkDeptCodeArr"></div>
			<div id="informDeptCodeArr"></div>
			
			<table class="table table-bordered">
				<colgroup>
					<col width="15%">
					<col width="35%">
					<col width="15%">
					<col width="35%">
				</colgroup>
				<tbody>
					<tr>
						<th>제목</th>
						<td colspan="3">
							<input name="ediTitle" type="text" class="form-control"	placeholder="문서 제목입니다">
						</td>
					</tr>
					<tr>
						<th>작성자</th>								
						<td>
							<input type="hidden" name="deptCode" value="${emp.deptCode}">
							<input style="background-color: #eee;" type="text"
								class="form-control" value="${emp.empName} [${emp.deptName}]" readonly>
							<input type="hidden" name="inpEmpCode" value="${emp.empCode}">
						</td>
						<th>결재자</th>
						<td>
							<input type="hidden" name="settEmpCode">
							<input type="button" id="edi_setter_main" style="text-align: left;"  
                                    class="form-control" data-target="#edi_setter" data-toggle="modal">
                        </td>
						
					</tr>
					<tr>
						<th>문서유형</th>
						<td>
							<div class="custom-control custom-radio custom-control-inline">
							    <input type="radio" class="custom-control-input" id="ediType1" name="ediType" value="0001" checked="checked">
							    <label class="custom-control-label" for="ediType1">일반품의</label>
						    </div>
						    <div class="custom-control custom-radio custom-control-inline">
						        <input type="radio" class="custom-control-input" id="ediType2" name="ediType" value="0002">
						        <label class="custom-control-label" for="ediType2">근태신청</label>
						    </div>
						    <div class="custom-control custom-radio custom-control-inline">
						        <input type="radio" class="custom-control-input" id="ediType3" name="ediType" value="0003">
						        <label class="custom-control-label" for="ediType3">비용환급</label>
						    </div>
						</td>
						<th>첨부파일</th>
						<td>
							<div class="custom-file">
							   <input type="file" class="custom-file-input" id="customFile">
							   <label class="custom-file-label" for="customFile">Choose file</label>
							</div>
						</td>
					</tr>
					<tr>
						<th>합의부서</th>
						<td style="vertical-align: top !important;" id="co_work_dept_code">
						<select class="form-control" id="co_work_dept_code_select">
						    <option value="#">===선택===</option>
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
						<th style="vertical-align: top !important;">경유부서</th>
						<td style="vertical-align: top !important;" colspan="3">
						<select class="form-control" id="inform_dept_code_select">
							<option value="#">===선택===</option>
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
								<input name="ediWorkDate" type="date" class="form-control">
					            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>										
							</div>
						</td>
						<th style="vertical-align: middle;">근태유형</th>
						<td>
							<select class="form-control" name="ediWorkType" id="work_type">
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
						<col width="11%">
						<col width="21%">
						<col width="11%">
						<col width="21%">
						<col width="11%">
						<col width="23%">
					</colgroup>
					<tbody>
						<tr>
							<th style="vertical-align: middle;">계획예산</th>
							<td><fmt:formatNumber>${budgetMgr.planTotalBudget}</fmt:formatNumber></td>
							<th style="vertical-align: middle;">사용예산</th>
							<td><fmt:formatNumber>${budgetMgr.planUseBudget}</fmt:formatNumber></td>
							<th style="vertical-align: middle;">가용예산</th>
							<td><fmt:formatNumber>${budgetMgr.availableBudget}</fmt:formatNumber></td>
						</tr>
						<tr>
							<th style="vertical-align: middle;">입금계좌</th>									
							<td><input style="background-color: #eee;" type="text"
								class="form-control" value="${emp.bankName} [${emp.bankAccount}]" readonly></td>
							<th style="vertical-align: middle;">환급일자</th>
							<td>
								<div class="input-group date">
									<input name="refundDate" type="date" class="form-control">
						            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>										
								</div>
							</td>
							<th style="vertical-align: middle;">환급비용</th>
							<td><input name="useBudget" type="text" class="form-control" placeholder="가용예산 범위 내 입력" value="0" numberOnly>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!--END 비용환급 레이어-->

			<br>

			<p style="text-align: center;">
				<button id="ediRegBtn" type="button" class="btn btn-dark btn-lg">문서등록</button>
				<a id="ediCancelBtn" type="button" href="/ediList/1" style="background-color: #eee;" class="btn btn-outline-secondary btn-lg">작성취소</a>
			</p>

		</form>
		<!--END 전자결재 입력 폼 -->
		
		</div>

	</div>
	
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
	
</div>	<!-- end Modal -->

<form id="hiddenFile" action="/addEdiFile" method="post" enctype="multipart/form-data">	<!-- 첨부파일 : 게시글 등록 후 성공 시 첨부파일 등록 함수 함께 실행-->
	<input type="file" name="fileName" style="display:none;" >
</form>

</div>	<!-- end Container -->
	

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


	$("#seachSett").click(function (e) {
	        
	    	e.preventDefault();
	    	
	    	$("a[name=nameSetter]").remove();
	    	
	    	let empName = $("input[name=empName]").val();
	    	
	    	$.getJSON('/empSett/' + empName + '.json', function(empList) {		
	
				for (let i in empList) {	
					
					$("#nameSett").
					append('<a id="nameSetter'+ i +'" name="nameSetter" class="btn btn-nameSetter" margin-right="3px"' 
	     			      +   'data-dismiss="modal" value="' + empList[i].empCode + '">'      			      
	     				  +    empList[i].empName + ' [' + empList[i].deptName + ']' 
	     				  +'</a>');				
				}  			
		
	    	});   	
		
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
        .append('<input type="button" class="btn btn-primary glyphicon glyphicon-remove"'
               +   'name="coWorkDeptCode" style="margin-left: 5px;" onclick="$(this).remove()">' 
               +'</button>');
        
        $("input[name=coWorkDeptCode]").last().val(deptCode);
        $("#coWorkDeptCodeArr").append('<input type="hidden" name="coWorkDeptCodeArr" value="'+ deptCode +'"</input> ');  
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
        .append('<input type="button" class="btn btn-info glyphicon glyphicon-remove"'
        	   +   'name="informDeptCode" style="margin-left: 5px;" onclick="$(this).remove()">' 	  
               +'</input>');  
        
        $("input[name=informDeptCode]").last().val(deptCode);
        $("#informDeptCodeArr").append('<input type="hidden" name="informDeptCodeArr" value="'+ deptCode +'"</input> ');         
        
    });
    
    $("#ediRegBtn").click(function(e){	
    	 		
    	$('input[name=useBudget]').val(removeComma($('input[name=useBudget]').val()));
        console.log("value: ", $('input[name=useBudget]').val());

    	$("#edi_write").submit();
    	
    });
    
    function removeComma(str) {
		n = parseInt(str.replace(/,/g,""));
		return n;
	}
    
    $("input:text[numberOnly]").on("keyup", function() {
        $(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));
    });
    
    function addCommas(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
     
    //모든 콤마 제거
    function removeCommas(x) {
        if(!x || x.length == 0) return "";
        else return x.split(",").join("");
    }

   
	$("#nameSett").on("click", "a[name=nameSetter]", function (e) {
    	
    	e.preventDefault();
    	
    	let settEmpCode = $(this).attr('value');
    	let empDeptName = $(this).text();
        
        $("input[name=settEmpCode]").val(settEmpCode);
        
        $("#edi_setter_main").val(empDeptName);
        
        $('#edi_setter').modal('hide');
        $('body').removeClass('modal-open');
        $('.modal-backdrop').remove();

    });
    
    $(".modal-footer .btn").click(function() {
    	$("a[name=nameSetter]").remove();
    });
    
    $(".custom-file-input").on("change", function() {
   	  const fileName = $(this).val().split("\\").pop();
   	  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
   	});
    

});
    
</script>

</body>
</html>