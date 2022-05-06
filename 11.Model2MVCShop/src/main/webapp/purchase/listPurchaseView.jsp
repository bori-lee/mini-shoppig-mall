<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
   
<head>
   <meta charset="EUC-KR">
   
   <!-- ���� : http://getbootstrap.com/css/   ���� -->
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
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   
   <!--  ///////////////////////// CSS ////////////////////////// -->
   <style>
     body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
   <script type="text/javascript">
   
      //=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============   
      function fncGetUserList(currentPage) {
         $("#currentPage").val(currentPage)
         $("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();
      }
      
      
      //============= "�˻�"  Event  ó�� =============   
       $(function() {
          //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
          $( "button.btn.btn-default" ).on("click" , function() {
            fncGetUserList(1);
         });
       });
      
      
      //============= userId �� ȸ����������  Event  ó��(Click) =============   
       $(function() {
      
         //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
         $( "td:nth-child(1)" ).on("click" , function() {
             self.location ="/purchase/getPurchase?tranNo="+$(this).attr("tranNo");
         });
                  
         //==> userId LINK Event End User ���� ���ϼ� �ֵ��� 
         $( "td:nth-child(2)" ).css("color" , "red");
         
      });  
      
       $(function() {
             
           //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
           $( "td:nth-child(2)" ).on("click" , function() {
               self.location ="/user/getUser?userId="+$(this).text().trim();
           });
                             
        });  
      
      
      //============= userId �� ȸ����������  Event  ó�� (double Click)=============
       $(function() {
         
         //==> userId LINK Event End User ���� ���ϼ� �ֵ��� 
         $( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
         $("h7").css("color" , "red");
         
         //==> �Ʒ��� ���� ������ ������ ??
         $(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
      });   
   
   </script>
   
</head>

<body>
   
   <!-- ToolBar Start /////////////////////////////////////-->
   <jsp:include page="/layout/toolbar.jsp" />
      <!-- ToolBar End /////////////////////////////////////-->
   
   <!--  ȭ�鱸�� div Start /////////////////////////////////////-->
   <div class="container">
   
      <div class="page-header text-info">
          <h3>���Ÿ����ȸ</h3>
       </div>
       
       <!-- table ���� �˻� Start /////////////////////////////////////-->
       <div class="row">
       
          <div class="col-md-6 text-left">
             <p class="text-primary">
                ��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
             </p>
          </div>
          
          <div class="col-md-6 text-right">
             <form class="form-inline" name="detailForm">
             
              
              <!-- PageNavigation ���� ������ ���� ������ �κ� -->
              <input type="hidden" id="currentPage" name="currentPage" value=""/>
              
            </form>
          </div>
          
      </div>
      <!-- table ���� �˻� Start /////////////////////////////////////-->
      
      
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >ȸ�� ID</th>
            <th align="left">ȸ����</th>
            <th align="left">��ȭ��ȣ</th>
            <th align="left">�����Ȳ</th>
            <th align="left">��������</th>
          </tr>
        </thead>
       
      <tbody>
      
        <c:set var="i" value="0" />
        <c:forEach var="purchase" items="${list}">
         <c:set var="i" value="${ i+1 }" />
         <tr>
           <td align="center" title="Click : �������� Ȯ��" tranNo="${purchase.tranNo}"">${ i }</td>
           <td align="left"  title="Click : ȸ������ Ȯ��">${user.userId}</td>
           <td align="left">${purchase.receiverName}</td>
           <td align="left">${purchase.receiverPhone}</td>
           <td align="left">
           
           <c:if test="${purchase.tranCode.trim()=='1'}">
            ���� ���ſϷ� ���� �Դϴ�. 
         </c:if>
         <c:if test="${purchase.tranCode.trim()=='2'}">
            ���� ����� ���� �Դϴ�. 
         </c:if>
         <c:if test="${purchase.tranCode.trim()=='3'}">
            ���� ��ۿϷ� ���� �Դϴ�.
         </c:if>   
         
           </td>
           <td align="left">
           
              <c:if test="${purchase.tranCode.trim()=='2'}">
            <a href="/purchase/updateTranCode?prodNo=${purchase.purchaseProd.prodNo}&tranCode=3">���ǵ���</a>
         </c:if>
         
           </td>
         </tr>
          </c:forEach>
        
        </tbody>
      
      </table>
     <!--  table End /////////////////////////////////////-->
     
    </div>
    <!--  ȭ�鱸�� div End /////////////////////////////////////-->
    
    
    <!-- PageNavigation Start... -->
   <jsp:include page="../common/pageNavigator_new.jsp"/>
   <!-- PageNavigation End... -->
   
</body>

</html>