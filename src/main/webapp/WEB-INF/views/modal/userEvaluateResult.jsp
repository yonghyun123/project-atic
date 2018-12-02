<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<div class="container">
  <!-- Trigger the modal with a button -->
  <!-- Modal -->
  <div class="modal fade" id="user-Eval-Result" role="dialog" tabindex="-1"
    aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" id="detailModal" style="margin-top: 1%">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
      
            <!-- One "tab" for each step in the form: -->

            <div class="preTabResult">
              <h3 class="preExplainHead">님의 매력도 지수는 다음과 같습니다.</h3>
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
                <button type="button" id="close"
                 class="btn">Close</button>
              </div>
            </div>
        </div>
      </div>
    </div>
  </div>
</div>
