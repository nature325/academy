<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table style="width: 600px; height: 30px; text-align:center;">
   <tr>
      <th>강좌명</th>
      <th>수강료</th>
      <th>납부일자</th>
      <th>납부액</th>
   </tr>
   <c:if test="${ empty reciList}">
      <tr>
         <td colspan="4">
            납부한 내역이 없습니다.
         </td>
      </tr>
   </c:if>
   <c:forEach var="list" items="${reciList}">
      <tr>
         <td>${list.c_name}</td>
         <td>${list.c_price}</td>
         <td>${list.p_paydate}</td>
         <td>${list.p_pay}</td>
      </tr>
   </c:forEach>
</table>

</body>
</html>