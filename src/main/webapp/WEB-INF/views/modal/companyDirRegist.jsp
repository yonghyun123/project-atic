<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<div class="container">
  <!-- Trigger the modal with a button -->
  <!-- Modal -->
  <div class="modal fade" id="com-dir-Reg" role="dialog" tabindex="-1"
    aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" id="detailModal" >
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
          <form id="regDirComForm" method="post" action="">
            <!-- Circles which indicates the steps of the form: -->
            <div style="text-align: center; margin-bottom: 40px;">
              <button type="button" class="close" data-dismiss="modal">
                <span>X</span>
              </button>
              <span class="step"></span> <span class="step"></span>
            </div>
            <!-- One "tab" for each step in the form: -->
            <div class="regDirTab">
              <h3 class="preExplainHead">대출 심사 & 기업평가를 위한 서류를 등록해
                주세요.</h3>
              <div>
                <p class="preExplain">대출 심사 진행전,</p>
                <p>서류를 심사하여 펀딩 여부를 결정하게됩니다.</p>
              </div>
              <p>이메일:</p>
              <div>
                <input type="text" placeholder="이메일을 입력해주세요" id="eMailDir"
                  name="emailDir" class="regText">
                <p>기업정보 입력시 사용한 eMail을 입력해주세요</p>
              </div>
            </div>
            <div class="regDirTab" style="display: none">
              <h3 class="preExplainHead">대출 심사 & 기업평가를 위한 서류를 등록해 주세요.</h3>
              <h3 class="preExplain">
                요구되는 모든 서류를 업로드 해주세요.<br> 아래의 내용이 맞으시면 다음 버튼을 눌러주세요
              </h3>
              <div>
                <p>회사명:</p>
                <input type="text" placeholder="현우상사" id="comDirName"
                  name="comDirName" class="regText" disabled="disabled"
                  value="현우상사">
              </div>
              <div>
                <p>사업형태:</p>
                <input type="text" id="comDirType" name="comDirType"
                  class="regText" disabled="disabled" value="개인사업">
              </div>
              <div>
                <p>사업자 번호:</p>
                <input type="text" placeholder="-빼고 입력" id="comDirNum"
                  class="regText" disabled="disabled" value="1234-5678">
              </div>
            </div>

            <div class="regDirTab" style="display: none">
              <h3 class="preExplainHead">대출 심사 & 기업평가를 위한 서류를 등록해 주세요.</h3>
              <h3 class="preExplain">
                요구되는 모든 서류를 업로드 해주세요.<br> 정확한 평가와 대출심사를 위해 필요합니다.
              </h3>
              
               <div>
                <p>사업자 등록증</p>
                <input type="file" id="bziReg" name="bizReg" class="regForm">
              </div>
               <div>
                <p>사업 인증서</p>
                <input type="file" id="bizAuth" name="bizAuth" class="regForm">
              </div>
               <div>
                <p>심사 평가지</p>
                <input type="file" id="bizTest" name="bizTest" class="regForm">
              </div>
               <div>
                <p>사업 소개서</p>
                <input type="file" id="bizIntro" name="bizIntro" class="regForm">
              </div>
            </div>
            <div style="overflow: auto;">
              <div style="float: right;">
                <button type="button" id="prevBtnDirReg"
                  onclick="nextDirPrev(-1)" class="btn">Previous</button>
                <button type="button" id="nextBtnDirReg"
                  onclick="nextDirPrev(1)" class="btn">Next</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
