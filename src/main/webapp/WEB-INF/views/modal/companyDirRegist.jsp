<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<div class="container">
  <!-- Trigger the modal with a button -->
  <!-- Modal -->
  <div class="modal fade" id="com-dir-Reg" role="dialog" tabindex="-1"
    aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" id="detailModal">
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
                <input type="text" placeholder="이메일을 입력해주세요"
                  id="eMailDir" name="emailDir" class="regText">
                <p>기업정보 입력시 사용한 eMail을 입력해주세요</p>
              </div>
            </div>
            <div class="regDirTab" style="display: none">
              <h3 class="preExplainHead">대출 심사 & 기업평가를 위한 서류를 등록해
                주세요.</h3>
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
              <h3 class="preExplainHead">대출 심사 & 기업평가를 위한 기업정보를 입력해
                주세요.</h3>
              <h3 class="preExplain">
                모든 항목을 정확하게 입력해 주세요.<br> 정확한 평가와 대출심사를 위해 필요합니다.
              </h3>
              <div>
                <p>업종 분류</p>
                <!-- 대분류 -->
                <div class="firstSel" id="firstSel" >
                  <select class ="firstClass" name="firstClass">
                    <option value="" selected disabled hidden>1차
                      분류</option>
                    <option value="IT">IT</option>
                    <option value="nonIT">비IT</option>
                  </select>
                <!-- it기업 2차분류 -->
                <div class="secondSel" id="IT"
                  style="display: none;">
                  <select  class ="secondClass" id="ITSel" name="ITSel">
                    <option value="" selected disabled hidden>IT
                      2차 분류</option>
                    <option value="platForm">플랫폼</option>
                    <option value="ITdevelope">IT 개발</option>
                    <option value="security">보안</option>
                    <option value="game">게임</option>
                    <option value="ITetc">기타</option>
                  </select>
                </div>
                <!-- it기업 3차분류 platForm -->
                <div class="thirdSel" id="platForm"
                  style="display: none;">
                  <select class="thirdClass" id="platFormSel" name="platFormSel">
                    <option value="" selected disabled hidden>플랫폼
                      분류</option>
                    <option value="43">홍보/마케팅</option>
                    <option value="44">커머셜</option>
                    <option value="45">교육</option>
                    <option value="46">헬스케어</option>
                    <option value="47">소셜</option>
                    <option value="48">오피스</option>
                  </select>
                </div>
                <!-- it기업 3차분류 ITdevelope -->
                <div class="thirdSel" id="ITdevelope"
                  style="display: none;">
                  <select class="thirdClass" id="ITdevelopeSel" name="ITdevelopeSel">
                    <option value="" selected disabled hidden>IT 개발 분류</option>
                    <option value="49">하드웨어 개발</option>
                    <option value="50">소프트웨어 개발</option>
                  </select>
                </div>
                <!-- it기업 3차분류 game -->
                <div class="thirdSel" id="game"
                  style="display: none;">
                  <select class="thirdClass" id="gameSel" name="gameSel">
                    <option value="" selected disabled hidden>게임 분류</option>
                    <option value="51">웹&앱 게임</option>
                  </select>
                </div>
                <!-- it기업 3차분류 security -->
                <div class="thirdSel" id="security"
                  style="display: none;">
                  <select class="thirdClass" id="securitySel" name="securitySel">
                    <option value="" selected disabled hidden>보안 분류</option>
                    <option value="52">IT 보안</option>
                  </select>
                </div>
                
              <!-- it기업 3차분류 ITetc -->
                <div class="thirdSel" id="ITetc"
                  style="display: none;">
                  <input type="text" id="etcSel" name="thirdTypeByITByETC">업종을
                  입력해주세요
                </div>
                
                <!-- 비IT 2차 분류 -->
                <div class="secondSel" id="nonIT"
                  style="display: none;">
                  <select class ="secondClass"  id="nonITSel" name="nonITSel">
                    <option value="" selected disabled hidden>비
                      IT 2차 분류</option>
                    <option value="Food">요식</option>
                    <option value="Edu">교육</option>
                    <option value="broker">중개</option>
                    <option value="sales">판매</option>
                    <option value="inn">숙박</option>
                    <option value="beauty">미용</option>
                    <option value="medi">의료</option>
                    <option value="free">자유</option>
                    <option value="nonITetc">기타</option>
                  </select>
                </div>
                 <!-- 비IT 3차 분류 Food -->
                <div class="thirdSel" id="Food"
                  style="display: none;">
                  <select  class="thirdClass" id="FoodSel" name="thirdTypeByNonITByFood">
                    <option value="" selected disabled hidden>요식업
                      분류</option>
                    <option value="14">일식</option>
                    <option value="19">양식</option>
                    <option value="22">패스트푸드</option>
                    <option value="28">중식</option>
                    <option value="32">치킨</option>
                    <option value="37">분식</option>
                    <option value="38">주점/호프</option>
                    <option value="42">한식</option>
                  </select>
                </div>
                <!-- 비IT 3차 분류 Edu -->
                <div class="thirdSel" id="Edu"
                  style="display: none;">
                  <select   class="thirdClass" id="EduSel" name="thirdTypeByNonITByEdu">
                    <option value="" selected disabled hidden>교육업
                      분류</option>
                    <option value="9">외국어/취미</option>
                    <option value="18">입시/취직/보습</option>
                    <option value="30">유아 교육</option>
                    <option value="34">예체능</option>
                  </select>
                </div>
                <!-- 비IT 3차 분류 broker -->
                <div class="thirdSel" id="broker"
                  style="display: none;">
                  <select   class="thirdClass" id="brokerSel" name="thirdTypeByNonITByIntro">
                    <option value="" selected disabled hidden>중개/유통업
                      분류</option>
                    <option value="1">부동산 중개업</option>
                    <option value="27">유통/슈퍼/대형 마트</option>
                    <option value="39">편의점</option>
                  </select>
                </div>
                <!-- 비IT 3차 분류 sales -->
                <div class="thirdSel" id="sales"
                  style="display: none;">
                  <select  class="thirdClass"  name="thirdTypeByNonITBySale">
                    <option value="" selected disabled hidden>판매업
                      분류</option>
                    <option value="4">컴퓨터 판매/수리</option>
                    <option value="10">식품 판매</option>
                    <option value="11">휴대폰/기타 전자기기 판매</option>
                    <option value="12">문구잡화 판매</option>
                    <option value="13">패션 잡화</option>
                    <option value="24">정육/생물</option>
                    <option value="26">제과/재빵</option>
                    <option value="33">화장품</option>
                    <option value="36">의류</option>
                    <option value="40">커피음료</option>
                  </select>
                </div>
                <!-- 비IT 3차 분류 inn -->
                <div  class="thirdSel" id="inn"
                  style="display: none;">
                  <select   class="thirdClass" id="innSel" name="thirdTypeByNonITByInn">
                    <option value="" selected disabled hidden>숙박업
                      분류</option>
                    <option value="7">여관/모텔/호텔</option>
                  </select>
                </div>
                <!-- 비IT 3차 분류 beauty -->
                <div class="thirdSel" id="beauty"
                  style="display: none;">
                  <select  class="thirdClass" id="beautySel" name="thirdTypeByNonITByBeauty">
                    <option value="" selected disabled hidden>미용업
                      분류</option>
                    <option value="6">네일 샵</option>
                    <option value="16">피부관리</option>
                    <option value="41">헤어/미용</option>
                  </select>
                </div>
                <!-- 비IT 3차 분류 medi -->
                <div class="thirdSel" id="medi"
                  style="display: none;">
                  <select   class="thirdClass" id="mediSel" name="thirdTypeByNonITByMedi">
                    <option value="" selected disabled hidden>의료/건강사업
                      분류</option>
                    <option value="8">헬스클럽</option>
                    <option value="17">한의원</option>
                    <option value="20">치과의원</option>
                    <option value="25">일반의원</option>
                    <option value="31">제약/약국</option>
                  </select>
                </div>
                <!-- 비IT 3차 분류 free -->
                <div class="thirdSel" id="free"
                  style="display: none;">
                  <select   class="thirdClass" id="freeSel" name="thirdTypeByNonITByFree">
                    <option value="" selected disabled hidden>자유업종
                      분류</option>
                    <option value="2">PC방</option>
                    <option value="5">골프 연습장</option>
                    <option value="15">당구장</option>
                    <option value="21">세탁업</option>
                    <option value="23">자동차 수리</option>
                    <option value="29">노래방</option>
                    <option value="35">홈 인테리어</option>
                    <option value="3">자동차 미용</option>
                  </select>
                </div>
              <!-- 비IT 3차 분류 nonITetc -->
                <div class="thirdSel" id="nonITetc"
                  style="display: none;">
                  <input type="text" id="" name="thirdTypeByNonITByETC">업종을
                  입력해주세요
                </div>
              </div>

              <div>
                <p>회사 설립일</p>
                <input type="date" id="estDate" name="estDate"
                  class="regDirForm">
                <p>초기 자본금</p>
                <input type="date" id="estMoney" name="estMoney"
                  class="regDirForm">
                <p>투자 유치금 제외</p>
              </div>

              <div>
                <p>투자 유치 이력</p>
                <select name="investHis">
                  <option>없음</option>
                  <option>Seed(1회)</option>
                  <option>2회 이상</option>
                </select>
              </div>

              <div>
                <div id="firstInvest">
                  <p>1차 투자 유치액</p>
                  <input type="text" name="firstInvest" value="0">
                  <p>1차 투자 유치일</p>
                  <input type="date" name="firstInvestDate">
                </div>
                <div style="display: none">
                  <p>2차 투자 유치액</p>
                  <input type="text" name="secondInvest" value="0">
                  <p>2차 투자 유치일</p>
                  <input type="date" name="secondInvestDate">
                </div>
              </div>
            </div>
      </div>
            <div class="regDirTab" style="display: none">
              <h3 class="preExplainHead">대출 심사 & 기업평가를 위한 서류를 등록해
                주세요.</h3>
              <h3 class="preExplain">
                아래 항목중 보유한 모든 증명을 업로드 해주세요.<br> 정확한 평가와 대출심사를 위해
                필요합니다.
              </h3>
              <div>
                <p>사업자 등록증</p>
                <input type="file" id="bziReg" name="bizReg"
                  class="regForm">
              </div>
              <div>
                <p>사업 인증서</p>
                <input type="file" id="bizAuth" name="bizAuth"
                  class="regForm">
              </div>
              <div>
                <p>특허 인증서</p>
                <input type="file" id="patentReg" name="patentReg"
                  class="regForm">
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
