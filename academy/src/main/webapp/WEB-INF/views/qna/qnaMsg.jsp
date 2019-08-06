<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
window.alert('${msg}'); //경고창으로 학원등록결과 출력
opener.location.reload();//부모창 새로고침
window.close(); //알림페이지 닫기
</script>