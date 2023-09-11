<%@ page import="service.MainService" %>
<%@ page import="java.util.List" %>
<%@ page import="model.BookmarkResponse" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>북마크 상세</title>
</head>
<style>
    th{
        width: 200px;
    }
    input{
        width: 200px;
        height: 40px;
    }
    thead{
        background-color: aquamarine;
    }
</style>
<body>
<%
    MainService mainService = new MainService();
    int bookmark_id = request.getParameter("bookmark_id") == null ? -1: Integer.parseInt(request.getParameter("bookmark_id"));
    String wifi_mgr = request.getParameter("mgr");
    String mark_id = request.getParameter("mark_id");

    if (bookmark_id != -1 && wifi_mgr != null) {
      mainService.insetWifiMark(wifi_mgr,bookmark_id);
    }

    if (mark_id != null) {
      mainService.deleteMarkID(Integer.parseInt(mark_id));
    }
    List<BookmarkResponse> wifiMarklist = mainService.getWifiMarkList();
%>
<h1 class="text-primary">내 위치기반 와이파이 정보 구하기</h1>
<div class="mb-2">
        <a type="button" class="btn btn-primary" href="index.jsp">홈 | </a>
        <a type="button" class="btn btn-primary" href="history.jsp">| 위치 히스토리 목록 |</a>
        <a type="button" class="btn btn-primary" href="wifiSuccess.jsp">| 와이파이 요청 |</a>
        <a type="button" class="btn btn-primary" href="bookmarkDetail.jsp">| 북마크 보기 |</a>
        <a type="button" class="btn btn-primary" href="bookmark.jsp">| 북마크 그룹 관리 |</a>
    </div>
<table class="mt-2">
    <thead>
    <tr>
        <th>ID</th>
        <th>북마크 이름</th>
        <th>와이파이 이름</th>
        <th>등록 일자</th>
        <th>비고</th>
    </tr>
    </thead>
    <tbody>
    <%
        if (wifiMarklist != null && !wifiMarklist.isEmpty()) {
          for (BookmarkResponse bookmarkResponse : wifiMarklist){
    %>
        <tr>
            <td><%=bookmarkResponse.getMark_id()%></td>
            <td><%=bookmarkResponse.getBookmark_name()%></td>
            <td><a href="wifiDetail.jsp?X_SWIFI_MGR_NO=<%=bookmarkResponse.getX_SWIFI_MGR_NO()%>"><%=bookmarkResponse.getX_SWIFI_MAIN_NM()%></a></td>
            <td><%=bookmarkResponse.getReg_dt()%></td>
            <td><button type="button" class="btn btn-primary opacity-75" onclick="deleteMark(<%=bookmarkResponse.getMark_id()%>)">삭제</button></td>
        </tr>
    <%
            }
        }
    %>
    </tbody>
</table>
<script>
    function deleteMark(index) {
        location.href = "bookmarkDetail.jsp?mark_id=" + index;
    }
</script>
</body>
</html>
