<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  
<div class="container">  
  <!-- Trigger the modal with a button -->
  <!-- Modal -->
  <div class="modal fade" id="nickname-modal" role="dialog" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true" data-toggle="modal" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
          <form role="form" class="text-left" method="post" action="/login/loginPost">
            <div class="form-group">
              <label><span class="glyphicon glyphicon-user"></span> 닉네임</label>
              <input type="text" class="form-control" name="nickname" id="nickname" placeholder="Enter Nickname" required>
            </div>
            <button type="button" class="btn btn-success btn-block" id="nickname-bt"><span class="glyphicon glyphicon-off"></span>설정 완료</button>
          </form>
        </div>
      </div>
    </div>
  </div> 
</div>

<script>
  
  document.getElementById('nickname-bt').onclick = function () {
    var nickname = document.getElementById('nickname');
    var params = 'nickname=' + nickname.value;
    
    /* userUpdate */
    /* $.ajax({
      url: '/login/loginPost',
      data: params,
      success: function (data) {
      }
    }) */ 
    
  }
</script>
