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
		
			<br>

			<div class="card" style="width: 200%;">

				<div class="card-header text-white" style="background: #343A40;">
					<h2>전자결재 결재화면 (문서번호 : E19010100001)</h2>
				</div>

				<div class="card-body">


					<table class="table table-bordered">
						<colgroup>
							<col class="col-md-1">
							<col class="col-md-2">
							<col class="col-md-2">
							<col class="col-md-7">
						</colgroup>
						<tbody>
							<tr>
								<th>차수</th>
								<th>결재자</th>
								<th>결재일시</th>
								<th>결재자 첨언</th>
							</tr>
							<tr>
								<td>1</td>
								<td>오민철</td>
								<td>2019-10-08 13:41</td>
								<td>test1</td>
							</tr>
							<tr>
								<td>2</td>
								<td>차혜례</td>
								<td></td>
								<td style="color: blueviolet;">현재사용자가 결재하셔야 합니다.</td>
							</tr>
						</tbody>
					</table>				

					<br>

					<table class="table table-bordered">
						<colgroup>
							<col class="col-md-2">
							<col class="col-md-2">
							<col class="col-md-5">
							<col class="col-md-1">
							<col class="col-md-1">
						</colgroup>
						<tbody>
							<tr>
								<th>합의부서</th>
								<th>합의일시</th>
								<th>합의자 첨언</th>
								<th>요청자</th>
								<th>합의상태</th>
							</tr>
							<tr>
								<td>오민철[IT개발부]</td>
								<td></td>
								<td style="color: blueviolet;">현재사용자가 결재하셔야 합니다.</td>
								<td>오민철</td>
								<td></td>
							</tr>
							<tr>
								<td>차혜례[인사부]</td>
								<td>2019-10-08 17:05</td>
								<td>합의합니다.</td>
								<td>오민철</td>
								<td>합의</td>
							</tr>
						</tbody>

					</table>
					
					<form>
						<div style="text-align: right;">						
							<button id="ediAgree" class="btn btn-info" type="submit">결재하기</button>
							<button id="ediAgree" class="btn btn-warning" type="submit">결재마감</button>
							<button id="ediDeny" class="btn btn-danger" type="submit">반송하기</button>
						</div>
						<table class="table table-bordered">
							<colgroup>
								<col class="col-md-2">
								<col class="col-md-10">
							</colgroup>
							<tbody>
								<tr>
									<th style="vertical-align: middle;">상위결재자</th>
									<td>
										<input type="hidden" name="settEmpCode" value="H0002">
										<input type="button" id="edi_setter_main" 
											style="background-color: #eee; text-align: left;"
											class="form-control" data-target="#edi_setter" data-toggle="modal">
									</td>
								</tr>
								<tr>
									<th style="vertical-align: middle;">결재자 첨언</th>
									<td><textarea name="ediContents" class="form-control"
											rows="2" placeholder="결재내용에 대하여 첨언작성"></textarea></td>
								</tr>
							</tbody>
						</table>						
					</form>

					<form>
						<div style="text-align: right;">
							<button id="ediAgree" class="btn btn-info" type="submit">합의하기</button>
							<button id="ediDeny" class="btn btn-danger" type="submit">부결하기</button>
						</div>
						<table class="table table-bordered">
							<colgroup>
								<col class="col-md-2">
								<col class="col-md-10">
							</colgroup>
							<tbody>								
								<tr>
									<th style="vertical-align: middle;">합의자 첨언</th>
									<td><textarea name="ediContents" class="form-control"
											rows="2" placeholder="합의내용에 대하여 첨언작성"></textarea></td>
								</tr>
							</tbody>
						</table>						
					</form>

					<br>

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
								<td colspan="3"><input name="ediTitle" type="text"
									class="form-control" placeholder="문서 제목입니다"></td>
							</tr>
							<tr>
								<th style="vertical-align: middle;">작성자</th>
								<td><input name="ediTitle" type="text" class="form-control"
									value="오민철[IT개발부]"></td>
								<th style="vertical-align: middle;">작성일</th>
								<td><input name="ediTitle" type="text" class="form-control"
									value="2019-10-08 17:05"></td>
							</tr>
							<tr>
								<th style="vertical-align: middle;">문서유형</th>
								<td><input name="ediTitle" type="text" class="form-control"
									value="일반품의">
								</td>
								<th style="vertical-align: middle;">첨부파일</th>
								<td><input id="fileInput" type="file"
									data-class-button="btn btn-default"
									data-class-input="form-control" data-icon-name="fa fa-upload"
									class="form-control"
									style="position: absolute; clip: rect(0px, 0px, 0px, 0px);">
									<div class="bootstrap-filestyle input-group">
										<input type="text" id="userfile" class="form-control"
											name="fileName" disabled> <span
											class="group-span-filestyle input-group-btn" tabindex="0">
											<label for="fileInput" class="btn btn-default "> <span
												class="glyphicon glyphicon-plus"></span>
										</label>
										</span>
									</div></td>
							</tr>
							<tr>
								<th style="vertical-align: middle;">내용</th>
								<td colspan="3"><textarea name="ediContents"
										class="form-control" rows="7" placeholder="문서 내용입니다"></textarea>
								</td>
							</tr>
						</tbody>
					</table>

				</div>	<!-- end card-body -->
				

			</div>	<!-- End card -->
			
		</div>	<!-- END ROW-->	

	</div>  <!-- END Container-->

	<jsp:include page="../include/footer.jsp" />
	<jsp:include page="../include/plugin-js.jsp" />


	<script>


    
</script>

</body>
</html>