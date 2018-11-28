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
              <label><span class="glyphicon glyphicon-user"></span>
                닉네임</label> <input type="text" class="form-control" name="nickname" id="nickname" placeholder="Enter Nickname" required>
            </div>
            <span id="nickname-fail-text">이미 존재하는 닉네임입니다!</span>
            <button type="button" class="btn btn-success btn-block" id="nickname-bt">
              <span class="glyphicon glyphicon-off"></span>설정 완료
            </button>
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
		$.ajax({
			url : '/users/id/' + id + '/nickname/' + nickname,
			type : 'get',
			success : function(data) {
				var count = 0;
				if (data.trim() == 'duplicate') {
					var selector = document.getElementById('nickname-fail-text');
        			var fadeIn = setInterval( function() {
        				selector.style.visibility = 'visible';
        				if(count >= 5) {
        					selector.style.visibility = 'hidden';
        					clearInterval(fadeIn);
        					return ;
        				}
        				count++;
        			}, 500);
				} else {
					window.location.reload();
				}
			}
		})
	}
	
	/* document.getElementById('nickname-bt').onclick = function() {
		var nickname = document.getElementById('nickname').value;
		var id = document.getElementById('id').value;
		var params = 'id=' + id + '&nickname=' + nickname;
		$.ajax({
			url : '/users/nickname',
			type : 'get',
			data : params,
			success : function(data) {
				if (data.trim() == 'duplicate') {
					alert("중복!");
				} else {
					alert("gg");
					window.location.reload();
				}
			},
			error : function(data) {
				alert("error: " + data.responseText);
				alert(data.statusCode);
			}
		})
	} */
</script>
