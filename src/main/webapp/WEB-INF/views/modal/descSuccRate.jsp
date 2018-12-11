<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  
<div class="container">  
  <!-- Trigger the modal with a button -->
  <!-- Modal -->
  <div class="modal fade" id="desc-succ-rate" role="dialog" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="max-width: 530px !important;">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
          <label style="font-size: 24px;"><span class="glyphicon glyphicon-user"></span> 폐업률 상세</label>
          <div class="desc-text" style="margin-top: 10px;">
            <p style="padding: 20px; border: solid 1px #a5a2a2; box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);">
              A-TIC에서 수집한 데이터를 이용한 수치입니다.<br>
              산출식: (분기별 기간동안 폐업 점포수 / 전체 점포수) X 100<br>
              * 전체 점포수 : 현재 영업중인 전체 점포 수 + 당 기간 폐업 점포수
            </p>
          </div>
        </div>
      </div>
    </div>
  </div> 
</div>