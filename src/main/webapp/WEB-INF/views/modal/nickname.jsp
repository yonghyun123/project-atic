<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">
  <!-- Trigger the modal with a button -->
  <!-- Modal -->
  <div class="modal fade" id="nickname-modal" role="dialog"
    tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true"
    data-toggle="modal" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
          <form role="form" class="text-left" method="post" action="#">
            <div class="form-group">
              <label><h4>닉네임</h4> 필수 입력사항입니다.</label> 
              <input type="text" class="form-control" name="nickname" id="nickname" placeholder="Enter Nickname" maxlength="12">
            </div>
            <span id="nickname-fail-text"></span>
            <button type="button" class="btn btn-success btn-block" id="nickname-bt">다음</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
 	document.getElementById('nickname-bt').onclick = function() {
		var nickname = document.getElementById('nickname').value;
		var id = document.getElementById('id').value;
		var selector = document.getElementById('nickname-fail-text');
		
		// 글자수 체크 및 유효성 검사 메서드 추가하기
		if(nicknameValidation(nickname, selector)) {
			$.ajax({
				url : '/users/id/' + id + '/nickname/' + nickname,
				type : 'get',
				success : function(data) {
					if (data.trim() == 'duplicate') {
						messageView(selector, '이미 존재하는 닉네임입니다.');
					} else {
						$('#nickname-modal').modal('hide');
						$('#deposit-menual-modal').modal('show');
						$("body").css("overflow-y", "hidden");
					}
				}
			})
		}
 	}
</script>
