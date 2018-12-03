<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<div class="container">
  <!-- Trigger the modal with a button -->
  <!-- Modal -->
  <div class="modal fade" id="com-Reg" role="dialog" tabindex="-1"
    aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" id="detailModal" style="margin-top: 5%">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
          <form id="regComForm"  method="post" action="">
            <!-- Circles which indicates the steps of the form: -->
            <div style="text-align: center; margin-bottom: 40px;">
              <button type="button" class="close" data-dismiss="modal">
                <span>X</span>
              </button>
              <span class="step"></span> <span class="step"></span>
            </div>
            <!-- One "tab" for each step in the form: -->
            <div class="regTab">
              <h3 class="preExplainHead">기업정보를 등록해 주세요.</h3>
              <div>
              <p class="preExplain">대출 심사 진행전,</p>
              <p>고객님의 기업정보를 입력하시면 대출 상담이 진행됩니다.</p>
              </div>
              <p>이메일:</p>
               <div>
              <input type="text" placeholder="이메일을 입력해주세요"
                 id="eMail" name="email" class="regText">
                <p>고객님의 이메일로 대출 상세 절차가 전송됩니다.</p>
              </div>
            </div>
            <div class="regTab" style="display: none">
              <h3 class="preExplainHead">기업정보를 등록해 주세요.</h3>
              <h3 class="preExplain">
                아래의 모든 항목에 응답해주세요<br> 정확한 기업분석과 대출진행을 위해 필요합니다.
              </h3>
              <div>
              <p>회사명:</p>
              <input type="text" placeholder="회사명을 입력해주세요"
                id="comName" name="comName" class="regText">
                <p>ex)주식회사 현우상사</p>
              </div>
              <div>
              <p>사업형태:</p>
              <select name="bigCategory" class="comSelect">
                <option>법인 사업자</option>
                <option>개인 사업자</option>
                <option>사회적 기업</option>
                <option>기타</option>
              </select>
                <p>category: 법인/개인사업/사회적기업/기타</p>
              </div>
              <div>
               <p>사업자 번호:</p>
              <input type="text" placeholder="-빼고 입력"
                 id="comNum" class="regText">
                <p>사업자등록증 상의 사업자 번호를 입력해주세요.</p>
              </div>
            </div>
            
             <div class="regTab" style="display: none">
              <h3 class="preExplainHead">기업정보를 등록해 주세요.</h3>
              <h3 class="preExplain">
                아래의 모든 항목에 응답해주세요<br> 정확한 기업분석과 대출진행을 위해 필요합니다.
              </h3>
              <div>
              <p>설립년월:</p>
              <input type="text" placeholder="설립년월을 입력해주세요"
                id="regDate" name="regDate" class="regText">
                <p>ex)yyyy/mm/dd</p>
              </div>
              <div>
              <p>인증내역:</p>
              <select name="authType" class="comSelect">
                <option>이노비즈 인증</option>
                <option>메인비즈 인증</option>
                <option>밴처기업 인증</option>
                <option>기타(해당없음)</option>
              </select>
                <p>현재 보유한 인증서의 종류를 입력해주세요</p>
              </div>
              <div>
               <p>SNS 채널:</p>
              <input type="text" placeholder="url입력"
                 id="snsNum" class="regText">
                <p>보유하신 홈페이지 또는 SNS 채널을 입력해주세요.</p>
              </div>
            </div>

            <div style="overflow: auto;">
              <div style="float: right;">
                <button type="button" id="prevBtnReg"
                  onclick="nextPrev(-1)" class="btn">Previous</button>
                <button type="button" id="nextBtnReg"
                  onclick="nextPrev(1)" class="btn">Next</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>