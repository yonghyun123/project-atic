<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  
<div class="container">  
  <!-- Trigger the modal with a button -->
  <!-- Modal -->
  <div class="modal fade" id="deposit-menual-modal" role="dialog"
    tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true"
    data-toggle="modal" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog deposit-menual-modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
          <div class="text-center"><h2>가상계좌 개설</h2></div>
          <div>
            <form id="menual-form">
              <div class="menual-container">
                <div class="dropdown">
                  <div>
                    <label class="dropdiv" id="1">
                      <input type="checkbox" class="check" id="check1"><h4>예금거래 기본약관(필수)</h4><br>
                    </label>
                  </div>
                  <div id="dropdown1" class="dropdown-content">
                    <div>
                      <h5>제 1 조 적용범위</h5><br>
                      이 약관은 입출금이 자유로운 예금, 거치식예금 및 적립식예금 거래에 적용한다.<br><br>
                      <h5>제 2 조 실명거래</h5><br>
                      1. 거래처는 실명으로 거래하여야 한다.<br>
                      2. 은행은 거래처의 실명확인을 위하여 주민등록증ㆍ사업자등록증 등 실명확인증표 또는 그밖에
                         필요한 서류의 제시나 제출을 요구할 수 있고, 거래처는 이에 따라야 한다.<br><br>
                      <h5>제 3 조 거래장소</h5><br>
                      거래처는 예금계좌를 개설한 영업점(이하 “개설점”이라 한다)에서 모든 예금거래를
                      한다. 다만, 은행이 정하는 바에 따라 다른 영업점이나 다른 금융기관, 또는 현금자동
                      지급기ㆍ현금자동입출금기· 컴퓨터ㆍ전화기 등(이하 “전산통신기기”)을 통하여 거래할 수 있다.<br><br>
                      <h5>제 4 조 거래방법</h5><br>
                      거래처는 은행에서 내준 통장(증서· 전자통장을 포함한다) 또는 수표· 어음용지로 거래하여야 한다.
                      그러나 입금할 때와, 자동이체약정ㆍ전산통신기기이용약정 등에 따라 거래할 때는 통장 없이도
                      할 수 있다. <br>
                    </div>
                    <button type="button" class="btn btn-success btn-block ok-btn">확인</button>
                  </div>
                </div>
                <div class="dropdown">
                  <div>
                    <label class="dropdiv" id="2">
                      <input type="checkbox" class="check" id="check2"><h4>적립식예금 약관(필수)</h4><br>
                    </label>
                  </div>
                  <div id="dropdown2" class="dropdown-content">
                    <div>
                      <h5>제1조 적용범위</h5><br>
                      1. 적립식예금(이하 '이 예금'이라 한다)이라 함은 기간을 정하고 그 기간중에 미리 정한 
                      금액이나 불특정 금액을 정기 또는 부정기적으로 입금하는 예금을 말한다.<br>
                      2. 이 약관에서 정하지 아니한 사항은 예금거래기본약관의 규정을 적용한다.<br><br>
                      <h5>제2조 지급시기</h5><br>
                      이 예금은 약정한 만기일 이후 거래처가 청구할 때 지급한다. 다만 거래처가 부득이한
                      사정으로 청구할 때에는 만기전이라도 지급할 수 있다.<br><br>
                      <h5>제3조 저축금의 입금</h5><br>
                      거래처는 계약기간 동안 매월 약정한 날짜에 월저축금을 입금하여야 한다<br><br>
                      <h5>제4조 이자 및 만기지급금과 지연입금</h5><br>
                      1. 이 예금의 월저축금을 매월 약정한 날짜에 입금하였을 때에는 은행은 저축금마다
                         입금일부터 만기일 전날까지의 기간에 대하여 계약일 당시 영업점에 게시한 이율로 셈한 
                         이자를 저축금 총액(이하 '원금' '이라 한다)에 더한 금액(이하 '계약금액'이라 한다)을
                         만기지급금으로서 지급한다.<br>
                      2. 이 예금중 변동금리를 적용하는 예금은 이율을 바꾼 때 바꾼 날부터 바꾼 이율로
                         셈하여 이자를 지급한다.<br>
                    </div>
                    <button type="button" class="btn btn-success btn-block ok-btn">확인</button>
                  </div>
                </div>
                <div class="dropdown">
                  <div>
                    <label class="dropdiv" id="3">
                      <input type="checkbox" class="check" id="check3"><h4>계좌간 자동이체 약관(필수)</h4><br>
                    </label>
                  </div>
                  <div id="dropdown3" class="dropdown-content">
                    <div>
                      <h5>제1조 약관의 적용</h5><br>
                      예금주가 하나은행계좌간 이체를 희망하는 경우에는 별도 지급표를 징구하지 않고 정해진 기일에
                      계정간에 이체처리하는 업무를 말한다.<br><br>
                      <h5>제2조 영업일</h5><br>
                      다음 각호의 휴일을 제외한 날을 영업일로 합니다.<br>
                      1. 대통령에 의한 관공서의 공휴일<br>
                      2. 토요일<br>
                      3. 근로자의 날<br><br>
                      <h5>제3조 신청, 변경 및 해지</h5><br>
                      ① 이체지정일 2일전까지 자동이체 신청서에 의해 신규 및 변경, 해지 할 수 있습니다.<br>
                      ② 입금계좌는 당좌, 가계당좌, 보통, 저축, 자유저축, 기업자유예금, MMDA, MMF,
                        수익증권, 적립식예금(신탁), 계좌 등입니다.<br><br>
                      <h5>제4조 출금</h5><br>
                      ① 은행의 예금약관이나 약정서의 규정에 불구하고 예금청구서 기타 관련증서 없이
                        자동이체 처리절차에 의하여 출금할수 있습니다.<br>
                      ② 이체지정일에 출금계좌의 지급자금이 이체금액에 미달 하면 부족자금이 채워지는
                        날에 이체처리 합니다.<br>
                      ③ 원(리)금은 부분 인출 가능합니다(상환 약정기일에 약정 금액이 납입되지
                        않은 경우, 연체 상태가 완전히 해소 될 때까지는 23시 40분까지 입금할 경우에 당일 
                        처리 가능합니다.<br>
                      ④ 자동이체대금으로 입금된 어음, 수표등이 부도처리되는 경우에는 현금이체분을 포함한 전액이 출금취소 됩니다.<br>
                      ⑤ 이체지정일(거래처가 지정한 날이 없는 월의 경우에는 해당 월의 말일 영업일) 이 휴일 등 영업일이
                        아닌 경우 익일 영업일에 이체 됩니다. 다만, 요구불계좌간자동이체는 
                        예금주가 전영업일과 익영업일 중 이체일을 선택할 수 있습니다.<br><br>
                    </div>
                    <button type="button" class="btn btn-success btn-block ok-btn">확인</button>
                  </div>
                </div>
              </div>
              <div class="text-center">
                <span id="menual-fail-text"></span>
              </div>
              <button type="button" class="btn btn-success btn-block" id="deposit-menual-bt">가상계좌 생성</button>
            </form>              
          </div>
          <div class="menual-cancel-bt">
            <button type="button" class="btn btn-danger btn-default btn-cancel" onclick="window.location.reload();" data-dismiss="modal">나중에 생성하기</button>
          </div>
        </div>
      </div>
    </div>
  </div> 
</div>

<script>
    var menualList = document.querySelectorAll('.dropdiv');
    var checkList = document.querySelectorAll('.check');
    
    for (var i = 0; i < menualList.length; i++) {
        menualList[i].addEventListener('change', function(event) {
        	var check = document.getElementById("check" + this.id);
        	// 약관에 동의했을 때 dropdown시킴
        	$('.ok-btn').trigger('click');
        	if(check.checked) {
        		myFunction(this.id);
        	}
        });
    }
    
    function myFunction(id) {
        document.getElementById("dropdown" + id).classList.toggle("show");
    }
    
    // Close the dropdown if the user clicks outside of it
    window.onclick = function(event) {
      if (event.target.matches('.ok-btn')) {
    
        var dropdowns = document.getElementsByClassName("dropdown-content");
        var i;
        for (i = 0; i < dropdowns.length; i++) {
          var openDropdown = dropdowns[i];
          if (openDropdown.classList.contains('show')) {
            openDropdown.classList.remove('show');
          }
        }
      }
    }

	/* 계좌 개설 버튼 클릭 이벤트 */
  	document.getElementById('deposit-menual-bt').onclick = function () {
  		var count = 0;
  		var id = document.getElementById('id').value;
		for (var i = 0; i < checkList.length; i++) {
  			if(checkList[i].checked) {
  				count++;
  			}
  	    }
		
		if(count == 3) {
			// 최초 로그인 후, 계좌 생성
			if(id) {
				$.ajax({
					url : '/users/vt/' + id,
					success : function(data) {
						window.location.reload();
						sessionStorage.flag = "popup-message-create-deposit-success";
					}
				});	
				// 상세페이지에서 투자하기로 계좌 생성
			} else {
				$.ajax({
					url : '/users/vt/' + "${loginId}",
					success : function(data) {
						window.location.reload();
						sessionStorage.flag = "popup-message-create-deposit-success";
					}
				});
			}
		} else {
			var selector = document.getElementById('menual-fail-text');
			messageView(selector, '동의하지 않은 약관이 있습니다.');
		}
  	}
 </script>