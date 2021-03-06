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
				<div class="modal-body deposit-body">

					<form id="regForm" action="">

						<h1 class="text-center">DEPOSIT</h1>

						<!-- One "tab" for each step in the form: -->
						<div class="tab">
							deposit:
							<p>
								<input id="depositMoney" placeholder="적금 금액을 입력해주세요." oninput="this.className = ''">
							</p>
							password:
							<p>
								<input id="depositPasswd" type="password" placeholder="계좌의 비밀번호를 입력해주세요." oninput="this.className = ''">
							</p>
						</div>

						<div class="tab">
							E-mail:
							<p>
								<input type="text" placeholder="E-mail..." oninput="this.className = ''" id="email">
								<input type="button" id="auth" value="인증메일 보내기">
							</p>
							인증 번호:
							<p>
								<input type="text" placeholder="인증번호를 입력해주세요." oninput="this.className = ''" id="authNum">
								<input type="button" id="authB" value="인증하기">
							</p>
						</div>
						<div style="overflow: auto;">
							<div>
                                <button type="button" class="btn btn-success btn-block" id="nextBtn">Next</button>
							</div>
						</div>
					</form>
                    <div class="text-center">
                      <button type="submit" class="btn btn-danger btn-default btn-cancel deposit-cancel"
                        data-dismiss="modal">Cancel</button>
                    </div>
				</div>
			</div>
		</div>
	</div>
</div>
