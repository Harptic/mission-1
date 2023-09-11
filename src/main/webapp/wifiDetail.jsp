<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="service.MainService" %>
<%@ page import="model.Wifi" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Bookmark" %>
<html>
<head>
    <title>와이파이 상세</title>
</head>
<body>
<%
    String wifiNumber = request.getParameter("X_SWIFI_MGR_NO");
    MainService mainService = new MainService();
    Wifi wifi = null;
    List<Bookmark> bookmarkList = null;
    if (wifiNumber != null) {
        wifi = mainService.getWifi(wifiNumber);
        bookmarkList = mainService.getBookmarkList(wifiNumber);
    }

%>
<h1 class="text-primary">내 위치기반 와이파이 정보 구하기</h1>
<div class="mb-2">
    <a type="button" class="btn btn-primary" href="index.jsp">홈</a>
    <a type="button" class="btn btn-primary" href="history.jsp">위치 히스토리 목록</a>
    <a type="button" class="btn btn-primary" href="wifiSuccess.jsp">와이파이 요청</a>
    <a type="button" class="btn btn-primary" href="bookmarkDetail.jsp">북마크 보기</a>
    <a type="button" class="btn btn-primary" href="bookmark.jsp">북마크 그룹 관리</a>
</div>
<div>
	<h3>북마크 그룹 관리에서 먼저 북마크 그룹을 생성해야 추가할 수 있습니다.</h3>
    <select name="bookMarkName" onchange="getNumber(this.value)">
        <option value="" selected>북마크 항목</option>
        <%
            if (!bookmarkList.isEmpty() && bookmarkList != null) {
                for (Bookmark book: bookmarkList) {
        %>
        <option value="<%=book.getBookmark_id()%>"><%=book.getBook_name()%></option>
        <%
                }
            }
        %>
    </select>
    <button onclick="goBookmarkDetail('<%=wifi.getX_SWIFI_MGR_NO()%>')">북마크에 추가하기</button>
</div>
<table class="mt-2">
    <tbody>
        <tr>
            <th>거리</th>
            <td><%=wifi.getDISTANCE()%></td>
        </tr>
        <tr>
            <th>관리번호</th>
            <td><%=wifi.getX_SWIFI_MGR_NO()%></td>
        </tr>
        <tr>
            <th>자치구</th>
            <td><%=wifi.getX_SWIFI_WRDOFC()%></td>
        </tr>
        <tr>
            <th>와이파이명</th>
            <td><%=wifi.getX_SWIFI_MAIN_NM()%></td>
        </tr>
        <tr>
            <th>도로명 주소</th>
            <td><%=wifi.getX_SWIFI_ADRES1()%></td>
        </tr>
        <tr>
            <th>상세 주소</th>
            <td><%=wifi.getX_SWIFI_ADRES2()%></td>
        </tr>
        <tr>
            <th>설치 위치</th>
            <td><%=wifi.getX_SWIFI_INSTL_FLOOR()%></td>
        </tr>
        <tr>
            <th>설치 유형</th>
            <td><%=wifi.getX_SWIFI_INSTL_TY()%></td>
        </tr>
        <tr>
            <th>설치 기관</th>
            <td><%=wifi.getX_SWIFI_INSTL_MBY()%></td>
        </tr>
        <tr>
            <th>서비스 구분</th>
            <td><%=wifi.getX_SWIFI_SVC_SE()%></td>
        </tr>
        <tr>
            <th>망 종류</th>
            <td><%=wifi.getX_SWIFI_CMCWR()%></td>
        </tr>
        <tr>
            <th>설치 년도</th>
            <td><%=wifi.getX_SWIFI_CNSTC_YEAR()%></td>
        </tr>
        <tr>
            <th>실내외 구분</th>
            <td><%=wifi.getX_SWIFI_INOUT_DOOR()%></td>
        </tr>
        <tr>
            <th>WIFI 접속 환경</th>
            <td><%=wifi.getX_SWIFI_REMARS3()%></td>
        </tr>
        <tr>
            <th>X좌표</th>
            <td><%=wifi.getLAT()%></td>
        </tr>
        <tr>
            <th>Y좌표</th>
            <td><%=wifi.getLNT()%></td>
        </tr>
        <tr>
            <th>작업 일자</th>
            <td><%=wifi.getWORK_DTTM()%></td>
        </tr>
    </tbody>
</table>
<script>
    let number = -1;
    function goBookmarkDetail(value) {
        if (number != -1){
            location.href = "bookmarkDetail.jsp?bookmark_id=" + number + "&mgr=" + value;
        }
    }
    function getNumber(value) {
        number = value;
    }
</script>
<style>
    th{
        width: 200px;
        background-color: aquamarine;
    }
</style>
</body>
</html>
