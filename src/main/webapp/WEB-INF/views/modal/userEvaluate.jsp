<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<div class="container">
  <!-- Trigger the modal with a button -->
  <!-- Modal -->
  <div class="modal fade" id="user-Eval" role="dialog" tabindex="-1"
    aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" id="detailModal" style="margin-top: 1%">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
          <form id="regPreForm"  method="post" action="/shop/preEval/${project.id}/${loginId}">
            <!-- Circles which indicates the steps of the form: -->
            <div style="text-align: center; margin-bottom: 40px;">
              <button type="button" class="close" data-dismiss="modal">
                <span>X</span>
              </button>
              <span class="step"></span> <span class="step"></span>
            </div>
            <!-- One "tab" for each step in the form: -->
            <div class="preTab">
              <h3 class="preExplainHead">오픈 알림을 신청하시겠어요?</h3>
              <h3 class="preExplain">push 알림을 위한 휴대폰 번호를 입력해주세요</h3>
              <p>휴대폰 번호:</p>
              <input type="text" placeholder="Phone..."
                oninput="this.className = ''" id="phonNum"> <input
                class="authBtn" type="button" id="authPre"
                value="휴대전화 인증"> <br>
              <p>인증 번호:</p>
              <input type="text" placeholder="인증번호를 입력해주세요."
                oninput="this.className = ''" id="authPreNum"> <input
                class="authBtn" type="button" id="authPreB" value="인증하기">
            </div>

            <div class="preTab" style="display: none">
              <h3 class="preExplainHead">예비 평가점수를 등록해주세요.</h3>
              <h3 class="preExplain">
                오픈 알림 신청이 완료되었습니다.<br> 정확한 기업분석을 위해 고객님의 사전 평가가 필요합니다.
              </h3>
              <div id="evalTable">
              <p class="preP">수익성</p>
              <div class="starRev">
                <span class="starR1 on">0.5</span> <span class="starR2">1.0</span>
                <span class="starR1">1.5</span> <span class="starR2">2.0</span>
                <span class="starR1">2.5</span> <span class="starR2">3.0</span>
                <span class="starR1">3.5</span> <span class="starR2">4.0</span>
                <span class="starR1">4.5</span> <span class="starR2">5.0</span>
                <div class="scoreTable">0.5</div>
                <input type="text" class="scoreTable" name="profit" value="0.5" style="display: none;">
                
              </div>
              <p class="preP">안정성</p>
              <div class="starRev">
                <span class="starR1 on">0.5</span> <span class="starR2">1.0</span>
                <span class="starR1">1.5</span> <span class="starR2">2.0</span>
                <span class="starR1">2.5</span> <span class="starR2">3.0</span>
                <span class="starR1">3.5</span> <span class="starR2">4.0</span>
                <span class="starR1">4.5</span> <span class="starR2">5.0</span>
                <div class="scoreTable">0.5</div>
                <input type="text" class="scoreTable" name="stable" value="0.5" style="display: none;">
              </div>
              <p class="preP">성장성</p>
              <div class="starRev">
                <span class="starR1 on">0.5</span> <span class="starR2">1.0</span>
                <span class="starR1">1.5</span> <span class="starR2">2.0</span>
                <span class="starR1">2.5</span> <span class="starR2">3.0</span>
                <span class="starR1">3.5</span> <span class="starR2">4.0</span>
                <span class="starR1">4.5</span> <span class="starR2">5.0</span>
                <div class="scoreTable" >0.5</div>
                        <input type="text" class="scoreTable" name="potential" value="0.5" style="display: none;">
              </div>
              <p class="preP">매력도</p>
              <div class="starRev">
                <span class="starR1 on">0.5</span> <span class="starR2">1.0</span>
                <span class="starR1">1.5</span> <span class="starR2">2.0</span>
                <span class="starR1">2.5</span> <span class="starR2">3.0</span>
                <span class="starR1">3.5</span> <span class="starR2">4.0</span>
                <span class="starR1">4.5</span> <span class="starR2">5.0</span>
                <div class="scoreTable" >0.5</div>
                        <input type="text" class="scoreTable" name="attraction" value="0.5" style="display: none;">
              </div>
              <p class="preP">호감도</p>
              <div class="starRev">
                <span class="starR1 on">0.5</span> <span class="starR2">1.0</span>
                <span class="starR1">1.5</span> <span class="starR2">2.0</span>
                <span class="starR1">2.5</span> <span class="starR2">3.0</span>
                <span class="starR1">3.5</span> <span class="starR2">4.0</span>
                <span class="starR1">4.5</span> <span class="starR2">5.0</span>
                <div class="scoreTable"  >0.5</div>
                <input type="text" class="scoreTable" name="favor" value="0.5" style="display: none;">
              </div>
            </div>
            </div>

            <div style="overflow: auto;">
              <div style="float: right;">
                <button type="button" id="prevBtnPre"
                  onclick="nextPrev(-1)" class="btn">Previous</button>
                <button type="button" id="nextBtnPre"
                  onclick="nextPrev(1)" class="btn">Next</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
