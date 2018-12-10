<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  
<div class="container">  
  <!-- Trigger the modal with a button -->
  <!-- Modal -->
  <div class="modal fade" id="login-modal" role="dialog" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
          <form role="form" class="text-left" method="post" action="/login">
            <div class="form-group">
              <label><span class="glyphicon glyphicon-user"></span> 공인인증서 ID</label>
              <input type="text" class="form-control" name="username" id="id" placeholder="Enter ID" required>
            </div>
            <div class="form-group">
              <label><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="password" class="form-control" name="password" id="psw" placeholder="Enter Password" required>
              <span id="login-fail-text"></span>
            </div>
            <div style="margin-top: 3%;">
              <button type="button" class="btn btn-success btn-block" id="login-bt">Login</button>
              <button type="submit" class="btn btn-danger btn-default btn-cancel" id="login-cancel" data-dismiss="modal">Cancel</button>
            </div>
          </form>
          
        </div>
      </div>
    </div>
  </div> 
</div>

<script>
  	document.getElementById('login-bt').onclick = function () {
      	var userId = document.getElementById('id');
      	var password = document.getElementById('psw');
		var params = 'username=' + userId.value + '&password=' + password.value;
    	$.ajax({
        	url: '/user/login',
        	data: params,
        	success: function (data) {
        		var count = 0;
        		if(data.trim() == 'userNone') {
        			var selector = document.getElementById('login-fail-text');
        			messageView(selector, "로그인 정보를 다시 확인해주세요.");
        		} else if(data.trim() == 'nickNone') {
        			$('#login-modal').modal('hide');
              		$('#nickname-modal').modal('show');
              		$("body").css("overflow-y", "hidden");
        		} else if(data.trim() == 'admin'){
        			location.href="/admin";
        		} else {
        			window.location.reload();
        			sessionStorage.flag = "popup-message-login-success";
        		}
  	    	}
    	})
  	}
 </script>
