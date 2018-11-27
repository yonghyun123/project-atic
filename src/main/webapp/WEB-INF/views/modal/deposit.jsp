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

						<h1>Deposit</h1>

						<!-- One "tab" for each step in the form: -->
						<div class="tab">
							Name:
							<p>
								<input placeholder="First name..." oninput="this.className = ''">
							</p>
							<p>
								<input placeholder="Last name..." oninput="this.className = ''">
							</p>
						</div>

						<div class="tab">
							Contact Info:
							<p>
								<input placeholder="E-mail..." oninput="this.className = ''">
							</p>
							<p>
								<input placeholder="Phone..." oninput="this.className = ''">
							</p>
						</div>

						<div class="tab">
							Birthday:
							<p>
								<input placeholder="dd" oninput="this.className = ''">
							</p>
							<p>
								<input placeholder="mm" oninput="this.className = ''">
							</p>
							<p>
								<input placeholder="yyyy" oninput="this.className = ''">
							</p>
						</div>

						<div class="tab">
							Login Info:
							<p>
								<input placeholder="Username..." oninput="this.className = ''">
							</p>
							<p>
								<input placeholder="Password..." oninput="this.className = ''">
							</p>
						</div>

						<div style="overflow: auto;">
							<div style="float: right;">
								<button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
								<button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
							</div>
						</div>

						<!-- Circles which indicates the steps of the form: -->
						<div style="text-align: center; margin-top: 40px;">
							<span class="step"></span> <span class="step"></span> <span
								class="step"></span> <span class="step"></span>
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
