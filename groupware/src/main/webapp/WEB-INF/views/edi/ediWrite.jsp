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

<!-- 전자결재 입력 양식 -->

<div class="container">
    <div class="row">
         <div class="card" style="width:200%;">  
         
			<div class="card-header text-white" style="background: #343A40;">
				<h2><span style="color: gray;">MyCompany</span> 전자결재 입력화면</h2>
			</div>
			
			<div class="card-body">

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
                    <td colspan="3"><input type="text" class="form-control" placeholder="문서 제목입니다"></td>
                </tr>
                <tr>
                    <th style="vertical-align: middle;">작성자</td>
                    <td><input type="text" class="form-control" placeholder="작성자입니다"></td>
                    <th style="vertical-align: middle;">결재자</td>
                    <td><input type="text" class="form-control" placeholder="결재자입니다"></td>
                </tr>
                <tr>
                    <th style="vertical-align: middle;">문서유형</th>
                    <td>
                        <select class="form-control" name="ediType" id="edi_type">
                            <option value="0001">일반품의</option>
                            <option value="0002">근태신청</option>
                            <option value="0003">비용환급</option>
                        </select>
                    </td>
                    <th style="vertical-align: middle;">첨부파일</th>
                    <td>
                        <input id="fileInput" type="file" data-class-button="btn btn-default" data-class-input="form-control" 
                            data-button-text="" data-icon-name="fa fa-upload"  class="form-control" style="position: absolute; clip: rect(0px 0px 0px 0px);">
                        <div class="bootstrap-filestyle input-group">
                        <input type="text" id="userfile" class="form-control" name="userfile" disabled="">                            
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
                    <td>
                        <select class="form-control" name="deptCode" id="dept_code">
                            <option value="IT">IT개발부</option>
                            <option value="HR">인사부</option>
                            <option value="SALES">영업부</option>
                            <option value="FINANCE">재무관리부</option>
                            <option value="MARKETING">마케팅부</option>
                        </select>
                        <p></p>                        
                        <button class="btn btn-info glyphicon glyphicon-remove" style="margin-left: 5px;">합의부서1</button>  
                        <button class="btn btn-info glyphicon glyphicon-remove"style="margin-left: 5px;">합의부서2</button>
                    </td>
                    <th style="vertical-align: middle;">경유부서</th>
                    <td colspan="3">
                        <select class="form-control" name="deptCode" id="dept_code">
                            <option value="IT">IT개발부</option>
                            <option value="HR">인사부</option>
                            <option value="SALES">영업부</option>
                            <option value="FINANCE">재무관리부</option>
                            <option value="MARKETING">마케팅부</option>
                        </select>
                        <p></p>  
                        <button class="btn btn-light glyphicon glyphicon-remove" style="margin-left: 5px;">경유부서1</button>  
                        <button class="btn btn-light glyphicon glyphicon-remove"style="margin-left: 5px;">경유부서2</button>
                    </td>                        
                </tr>
                <tr id="workDay" style="display:none;">
                    <th style="vertical-align: middle;">근태일자</th>
                    <td>						
                        <div class="input-group date">
                            <input id="hireDate" name="hireDate" type="date" class="form-control">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i>
                            </span>
                        </div>			
                    </td>
                    <th style="vertical-align: middle;">근태유형</th>
                    <td>
                        <select class="form-control" name="workTyle" id="work_type">
                            <option value="01">연차계</option>
                            <option value="02">오전반차</option>
                            <option value="03">오후반차</option>
                            <option value="04">출장계</option>                            
                        </select>
                    </td>
                </tr>          
                <tr>
                    <th style="vertical-align: middle;">내용</th>
                    <td colspan="3"><textarea class="form-control" id="ta1" rows="9" placeholder="문서 내용입니다"></textarea></td>
                </tr>
                </tbody>
            </table>      
            
            </div>
            
            <br><br>

            <p style="text-align: center;">
                <button type="button" class="btn btn-dark btn-lg">문서등록</button>
                <button type="button" class="btn btn-default btn-lg">작성취소</button>
            </p>
            
            </div>  <!-- card-body end -->
    </div>	<!-- row end -->
</div>	<!-- container end -->

<jsp:include page="../include/footer.jsp" />
<jsp:include page="../include/plugin-js.jsp" />

<script>
$(function() {
    $(document).ready(function(){    
        $("#fileInput").on('change', function(){      
            if(window.FileReader){  // modern browser    
                var filename = $(this)[0].files[0].name;    
            } else {  // old IE    
                var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출    
            }        
            // 추출한 파일명 삽입    
            $("#userfile").val(filename);    
        });   
    });

    $('#edi_type').change(function() {
		var state = $('#edi_type option:selected').val();
		if ( state == '0002' ) {
			console.log(state == '0002');
			$('#workDay').css("display", "");
		} else {
			$('#workDay').css("display", "none");
		}
	});
});
    
</script>

</body>
</html>