<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<div class="container">
  <!-- Trigger the modal with a button -->
  <!-- Modal -->
  <div class="modal fade" id="com-Reg" role="dialog" tabindex="-1"
    aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog Regist" id="detailModal">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
          <form id="regComForm"  method="post" action="/company/demoregist">
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
              <p class="preExplain">심사 진행전,</p>
              <p>고객님의 기업정보를 입력하시면 상담이 진행됩니다.</p>
              </div>
              <p>이메일:</p>
               <div>
              <input type="text" placeholder="이메일을 입력해주세요"
                 id="eMail" name="email" class="regText" style="display: inline-block;">
                 <div style="display: inline-block;"><button type="button" id="dupleCheck" class="btn" >중복체크</button></div>
                <p id="authStatus" style="color:blue"></p>
                <p>고객님의 이메일로 상세 절차가 전송됩니다.</p>
              </div>
            </div>
            <div class="regTab" style="display: none">
              <h3 class="preExplainHead">기업정보를 등록해 주세요.</h3>
              <h3 class="preExplain">
                아래의 모든 항목에 응답해주세요<br> 정확한 기업분석과 심사 진행을 위해 필요합니다.
              </h3>
              <div>
              <p>회사명:</p>
              <input type="text" placeholder="회사명을 입력해주세요"
                id="comName" name="name" class="regText">
                <p>ex)주식회사 현우상사</p>
              </div>
              <div>
              <p>사업형태:</p>
              <select name="comType" class="comSelect">
                <option value="1">법인 사업자</option>
                <option value="2">개인 사업자</option>
                <option value="3">사회적 기업</option>
                <option value="4">기타</option>
              </select>
                <p>category: 법인/개인사업/사회적기업/기타</p>
              </div>
              <div>
               <p>사업자 번호:</p>
              <input type="text" placeholder="-빼고 입력"
                 id="comNum" name="busiNum" class="regText">
                <p>사업자등록증 상의 사업자 번호를 입력해주세요.</p>
              </div>
            </div>
            
             <div class="regTab" style="display: none">
              <h3 class="preExplainHead">기업정보를 등록해 주세요.</h3>
              <h3 class="preExplain">
                아래의 모든 항목에 응답해주세요<br> 정확한 기업분석과 심사 진행을 위해 필요합니다.
              </h3>
              <div>
              <p>설립년월:</p>
              <input type="date" placeholder="설립년월을 입력해주세요"
                id="regDate" name="createDate" class="regText">
              </div>
              <div>
              <p>인증내역:</p>
              <select name="certiNum" class="comSelect">
                <option value="1">이노비즈 인증</option>
                <option value="2">메인비즈 인증</option>
                <option value="3">밴처기업 인증</option>
                <option value="4">기타</option>
                <option value="5">해당없음</option>
                
              </select>
                <p>현재 보유한 인증서의 종류를 입력해주세요</p>
              </div>
              <div>
               <p>SNS 채널:</p>
              <input type="text" placeholder="url입력"
                 id="snsInfo" name="sns" class="regText">
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
