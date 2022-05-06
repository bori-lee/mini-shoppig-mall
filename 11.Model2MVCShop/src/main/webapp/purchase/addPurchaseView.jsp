<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	
	//============= "구매"  Event 연결 =============
	 $(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( "button.btn.btn-primary" ).on("click" , function() {
			fncAddPurchase();
		});
	});	
	
	
	//============= "취소"  Event 처리 및  연결 =============
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[href='#' ]").on("click" , function() {
			history.go(-1)
		});
	});	
	

	function fncAddPurchase(){
		
	 //Form 유효성 검증
    var receiverName =$("input[name='receiverName']").val();
    var receiverPhone= $("input[name='receiverPhone']").val();
    var divyAddr = $("input[name='divyAddr']").val();
   
    if(receiverName== null || receiverName.length<1){
      alert("구매자이름은 반드시 입력하여야 합니다.");
      return;
   }
    
    if(receiverPhone == null || receiverPhone.length<1){
        alert("구매자연락처는 반드시 입력하여야 합니다.");
        return;
     }
     if(divyAddr == null || divyAddr.length<1){
        alert("구매자주소는 반드시 입력하셔야 합니다.");
        return;
     }
		
     $("form").attr("method" , "POST").attr("action" , "/purchase/addPurchase").submit();
	}
		
</script>

</head>

<body>


<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
			<div class="page-header text-center">
	       <h3 class=" text-info">구매상세정보</h3>
	       <h5 class="text-muted">구매정보를 <strong class="text-danger">정확히 입력</strong>해 주세요.</h5>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">

 <div class="form-group">
    <label for="prodNo" class="col-sm-offset-1 col-sm-3 control-label">상품번호</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="prodNo" name="prodNo" value="${product.prodNo}"  readonly>
    </div>
  </div>
  
  <div class="form-group">
    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="prodName" name="pprodName" value="${product.prodName}"  readonly>
    </div>
  </div>
  
  <div class="form-group">
    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="prodDetail" name="prodDetail"  value="${product.prodDetail}"  readonly>
    </div>
  </div>
  
  <div class="form-group">
    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="manuDate" name="manuDate"  value="${product.manuDate}"  readonly>
    </div>
  </div>
  
    <div class="form-group">
    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="price" name="price"  value="${product.price}"  readonly>
    </div>
  </div>
  
  <div class="form-group">
    <label for="regDate" class="col-sm-offset-1 col-sm-3 control-label">등록일자</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="regDate" name="regDate"  value="${product.regDate}"  readonly>
    </div>
  </div>
  
  <div class="form-group">
    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">구매자아이디</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="userId"  name="userId"   value="${user.userId}" readonly>
    </div>
  </div>
  
    <div class="form-group">
    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
 <div class="btn-group" role="group" aria-label="...">
 <select 	name="paymentOption">
		<option value="1" selected="selected">현금구매</option>
		<option value="2">신용구매</option>
	</select>

</div>
 </div>
 
  <div class="form-group">
    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">구매자이름</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="receiverName"  name="receiverName"   value="${user.userName}" >
    </div>
  </div>
  
   <div class="form-group">
    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">구매자연락처</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="receiverPhone"  name="receiverPhone"  value="${user.phone}" >
    </div>
  </div>
  
  <div class="form-group">
    <label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">구매자주소</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="divyAddr"  name="divyAddr"  value="${user.addr}">
    </div>
  </div>
  
   <div class="form-group">
    <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">구매요청사항</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="divyRequest"  name="divyRequest" >
    </div>
  </div>
  
   <div class="form-group">
    <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="divyDate"  name="divyDate" >
    </div>
  </div>
   
<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >구매</button>
			  <a class="btn btn-primary btn" href="#" role="button">취소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>