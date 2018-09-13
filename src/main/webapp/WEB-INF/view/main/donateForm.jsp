<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<link rel="stylesheet" href="css/donateForm.css">
<script src="js/donateForm.js"></script>
<div id="point-box">
   <form id="donateForm">
      <div>
         <img src="images/money.jpg" id="money" />
      </div>
      <div id="content-box">
         <input type="hidden" name="point_receiver" value="${point_receiver }" />  
         <input type="text" name="point_donate" id="textpoint" placeholder="금액을 입력해주세요"/> P 
         <input type="button" id="donateBtn" value="선물" />
      </div>
   </form>

</div>