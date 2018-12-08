<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <div class="container">  
  <!-- Trigger the modal with a button -->
  
  <!-- Modal -->
  <div class="modal fade" id="adminCompany" role="dialog" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog admin-modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
        <div class="container">
        <div class="col-10 my-deposit-inform">
		<div class="row">
 			  <ul class="nav nav-tabs mb-15" style="width: 100%;">
   			    <li class="active" onclick="changeActive('1')"><a data-toggle="tab" href="#company"><h4 style="display: inline-box; color: #70c745;" id="tab1">기업 정보</h4></a></li>
 			    <li class="ml-15" onclick="changeActive('2')"><a data-toggle="tab" href="#company-desc"><h4 style="display: inline-box;" id="tab2">평가 정보</h4></a></li>

 			  </ul>
 			  <div class="tab-content" style="width: 100%">
 			    <div id="company" class="tab-pane fade in active">
				</div>
 			    <!-- 수익률 그래프 그려져야 하는 부분 -->
 			    <div id="company-desc" class="tab-pane fade">
 			      <h3 class="ml-15">평가 상세 정보</h3>
 			      
 			      <h6>전체 평가 상세 graph</h6>
 			      <canvas id="bar-horizontal" width="1000" height="700"></canvas>
 			      <div id="total-eval">
 			      
 			      </div>
 			    </div>
 			  </div>
 			</div>	
 			</div>
 			</div>
        </div>
      </div>
    </div>
  </div> 
</div>
