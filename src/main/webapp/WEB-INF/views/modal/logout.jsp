<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  
<div class="container">  
  <!-- Trigger the modal with a button -->
  <!-- Modal -->
  <div class="modal fade" id="logout-modal" role="dialog" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="text-center logout-text"><h4>정말 로그아웃 하시겠습니까?</h4></div>
        <div class="modal-body logout-body">
          <form method="get" action="/user/logout" class="logout-form">
            <input type="submit" class="btn btn-success btn-block" id="logout-bt" value="로그아웃">
            <button type="submit" class="btn btn-danger btn-default btn-cancel logout" data-dismiss="modal">취소</button>
          </form>
        </div>
      </div>
    </div>
  </div> 
</div>

<script>
	document.getElementById('logout-bt').onclick = function() {
		sessionStorage.flag = "popup-message-logout-success";
	}
</script>