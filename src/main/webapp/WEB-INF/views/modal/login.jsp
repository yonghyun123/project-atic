<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<div class="container">  
  <!-- Trigger the modal with a button -->
  <!-- Modal -->
  <div class="modal fade" id="login-modal" role="dialog" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
          <form role="form" class="text-left" action="login.mall">
            <div class="form-group">
              <label><span class="glyphicon glyphicon-user"></span> 공인인증서 ID</label>
              <input type="text" class="form-control" name="inputId" id="id" placeholder="Enter ID" required>
            </div>
            <div class="form-group">
              <label><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="password" class="form-control" name="inputPasswd" id="psw" placeholder="Enter Password" required>
              
            </div>
            <div class="checkbox" id="nonUserBody">
              
            </div>
              <button type="button" class="btn btn-success btn-block" id="login-bt"><span class="glyphicon glyphicon-off"></span> Login</button>
          </form>
          <button type="submit" class="btn btn-danger btn-default btn-cancel" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
        </div>
      </div>
    </div>
  </div> 
</div>
