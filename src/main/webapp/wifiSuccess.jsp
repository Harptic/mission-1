<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="service.MainService" %>
<html>
<head>
    <title>와이파이 성공</title>
</head>
<body>
<%
  MainService mainService = new MainService();
%>
<h1 class="text-primary">내 위치기반 와이파이 정보 구하기</h1>
<div><a type="button" class="btn btn-primary" href="index.jsp">돌아가기</a></div>
<h1><%=mainService.insetWifi(1, 1000)%>개의 데이터를 성공적으로 가져오셨습니다.</h1>
</body>
</html>
