<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <div class="container">  
  <!-- Trigger the modal with a button -->
  <!-- Modal -->
  <div class="modal fade" id="id01" role="dialog" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog admin-modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
        <div class="container">
        <div class="col-10 my-deposit-inform">
		<div class="row">
 			  <ul class="nav nav-tabs" style="width: 100%">
 			    <li class="active admin-tab"><a data-toggle="tab" href="#company">기업 정보</a></li>
 			    <li class="admin-tab"><a data-toggle="tab" href="#company-desc">평가 정보</a></li>
 			  </ul>
 			  <div class="tab-content" style="width: 100%">
 			    <div id="company" class="tab-pane fade in active">
 			    <h2 class="ml-15">기업 정보</h2>
 			    <p class="preExplain">기업이름: {companyName}</p>
 			    <p class="preExplain">이메일: {email}</p>
 			    <p class="preExplain">설립일: {companyName}</p>
 			    <p class="preExplain">투자받은 날짜: {firstDate}, 1차 투자액: {firstFund}</p>
 			    <p class="preExplain">투자받은 날짜: {secondDate}, 2차 투자액: {secondFund}</p>
 			    <p class="preExplain">특허 보유: {hasPatent}</p>
 			    
 			    <p class="preExplain">사업자등록증: {fileBusiRegistration}</p>
 			    <p class="preExplain">기업 인증서: {fileCompCertification}</p>
 			    <p class="preExplain">특허 인증서: {filePatentCertification}</p>
 			    <p class="preExplain">투자유치 인증서: {fileInvestCertification}</p>
 			    
 			    <h1 style="color: green;">총 평가 점수 : {maxGrade}</h1>
				</div>
 			    <!-- 수익률 그래프 그려져야 하는 부분 -->
 			    <div id="company-desc" class="tab-pane fade my-graph">
 			      <h3 class="ml-15">평가 상세 정보</h3>
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