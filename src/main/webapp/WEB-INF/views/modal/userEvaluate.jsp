<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container">
	<!-- Trigger the modal with a button -->
	<!-- Modal -->
	<div class="modal fade" id="deposit-modal" role="dialog" tabindex="-1"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-body">

					<form id="regForm" action="">

						<h1>DEPOSIT</h1>

						<!-- One "tab" for each step in the form: -->
						<div class="tab">
                            <h1>오픈 알림을 신청하시겠어요?</h1>
                            <h3>push 알림을 위한 휴대폰 번호를 입력해주세요</h3>
							휴대폰 번호:
							<p>
								<input type="text" placeholder="Phone..." oninput="this.className = ''" id="phonNum">
								<input type="button" id="auth" value="휴대전화 인증">
							</p>
							인증 번호:
							<p>
								<input type="text" placeholder="인증번호를 입력해주세요." oninput="this.className = ''" id="authNum">
								<input type="button" id="authB" value="인증하기">
							</p>
						</div>

                      <div class="tab">
                                      <h1>오픈 알림을 신청하시겠어요?</h1>
                                      <h3>오픈 알림 신청이 완료되었습니다.<br>
                                      더욱 정확한 투자정보를 위해 고객님의 사전 평가 점수가 필요합니다.
                                      고객을 위해 노력하는 하나은행이 되겠습니다. 감사합니다.</h3>
                        수익성:
                      <div class="starRev">
                        <span class="starR1 on">별1_왼쪽</span>
                        <span class="starR2">별1_오른쪽</span>
                        <span class="starR1">별2_왼쪽</span>
                        <span class="starR2">별2_오른쪽</span>
                        <span class="starR1">별3_왼쪽</span>
                        <span class="starR2">별3_오른쪽</span>
                        <span class="starR1">별4_왼쪽</span>
                        <span class="starR2">별4_오른쪽</span>
                        <span class="starR1">별5_왼쪽</span>
                        <span class="starR2">별5_오른쪽</span>
                      </div>      
                        안정성:
                         <div class="starRev">
                          <span class="starR on">별1</span>
                          <span class="starR">별2</span>
                          <span class="starR">별3</span>
                          <span class="starR">별4</span>
                          <span class="starR">별5</span>
                        </div>         
                        성장성:
                         <div class="starRev">
                          <span class="starR on">별1</span>
                          <span class="starR">별2</span>
                          <span class="starR">별3</span>
                          <span class="starR">별4</span>
                          <span class="starR">별5</span>
                        </div>         
                        매력성:
                         <div class="starRev">
                          <span class="starR on">별1</span>
                          <span class="starR">별2</span>
                          <span class="starR">별3</span>
                          <span class="starR">별4</span>
                          <span class="starR">별5</span>
                        </div>         
                        호감도:
                         <div class="starRev">
                          <span class="starR on">별1</span>
                          <span class="starR">별2</span>
                          <span class="starR">별3</span>
                          <span class="starR">별4</span>
                          <span class="starR">별5</span>
                        </div>         

                      </div>
						<div style="overflow: auto;">
							<div style="float: right;">
								<button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
								<button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
							</div>
						</div>

						<!-- Circles which indicates the steps of the form: -->
						<div style="text-align: center; margin-top: 40px;">
							<span class="step"></span> <span class="step"></span>
						</div>

					</form>


					<button type="submit" class="btn btn-danger btn-default btn-cancel"
						data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> Cancel
					</button>
				</div>
			</div>
		</div>
	</div>
</div>
