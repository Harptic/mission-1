<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="service.MainService" %>
<%@ page import="model.Wifi" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="service.CommonService" %>
<html>
<body>
<head>
	<title>홈</title>
</head>
<h1 class="text-primary">내 위치기반 와이파이 정보 구하기</h1>
<div>
    <%
        MainService mainService = new MainService();
        float lat = request.getParameter("lat") == null ? 0 : Float.parseFloat(request.getParameter("lat"));
        float lng = request.getParameter("lng") == null ? 0 : Float.parseFloat(request.getParameter("lng"));
        List<Wifi> list = new ArrayList<>();
        if (lat != 0 && lng != 0) {
            list = mainService.getAround(lat, lng);
            mainService.insertHistory(lat, lng);
        }
    %>
    <div>
        <a type="button" class="btn btn-primary" href="index.jsp">홈</a>
        <a type="button" class="btn btn-primary" href="history.jsp">위치 히스토리 목록</a>
        <a type="button" class="btn btn-primary" href="wifiSuccess.jsp">와이파이 요청</a>
        <a type="button" class="btn btn-primary" href="bookmarkDetail.jsp">북마크 보기</a>
        <a type="button" class="btn btn-primary" href="bookmark.jsp">북마크 그룹 관리</a>
    </div>
    <input class="ms-2" value="" id="lat" placeholder="위도를 입력">
    <input value="" id="lng" placeholder="경도를 입력">
        <button type="button" class="btn btn-primary ms-2" onclick="getGeo()">자기 위치 가져오기</button>
        <button type="button" class="btn btn-primary" onclick="getWifi()">내 주변 와이파이</button>
    <table>
    <thead>
        <tr>
            <th>거리(km)</th>
            <th>관리번호</th>
            <th>자치구</th>
            <th>와이파이명</th>
            <th>도로명 주소</th>
            <th>상세 주소</th>
            <th>설치 위치(층)</th>
            <th>설치 유형</th>
            <th>설치 기관</th>
            <th>서비스 구분</th>
            <th>망 종류</th>
            <th>설치 년도</th>
            <th>실내외 구분</th>
            <th>WIFI 접속 환경</th>
            <th>X좌표</th>
            <th>Y좌표</th>
            <th>작업 일자</th>
        </tr>
        </thead>
        <tbody>
            <%
                if (!list.isEmpty()) {
                    for (Wifi wifi : list) {
            %>
                    <tr>
                        <td><%=wifi.getDISTANCE()%></td>
                        <td><a href="wifiDetail.jsp?X_SWIFI_MGR_NO=<%=wifi.getX_SWIFI_MGR_NO()%>"><%=wifi.getX_SWIFI_MGR_NO()%></a></td>
                        <td><%=wifi.getX_SWIFI_WRDOFC()%></td>
                        <td><%=wifi.getX_SWIFI_MAIN_NM()%></td>
                        <td><%=wifi.getX_SWIFI_ADRES1()%></td>
                        <td><%=wifi.getX_SWIFI_ADRES2()%></td>
                        <td><%=wifi.getX_SWIFI_INSTL_FLOOR()%></td>
                        <td><%=wifi.getX_SWIFI_INSTL_TY()%></td>
                        <td><%=wifi.getX_SWIFI_INSTL_MBY()%></td>
                        <td><%=wifi.getX_SWIFI_SVC_SE()%></td>
                        <td><%=wifi.getX_SWIFI_CMCWR()%></td>
                        <td><%=wifi.getX_SWIFI_CNSTC_YEAR()%></td>
                        <td><%=wifi.getX_SWIFI_INOUT_DOOR()%></td>
                        <td><%=wifi.getX_SWIFI_REMARS3()%></td>
                        <td><%=wifi.getLAT()%></td>
                        <td><%=wifi.getLNT()%></td>
                        <td><%=wifi.getWORK_DTTM()%></td>
                    </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>
</div>
</body>
</html>
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
<script>
    function getGeo() {
        window.navigator.geolocation.getCurrentPosition(function (position) {
            var lat = position.coords.latitude;
            var lng = position.coords.longitude;

            document.getElementById("lat").value = lat;
            document.getElementById("lng").value = lng;
        })
    }

    function getWifi() {
        var lat = document.getElementById("lat").value == null ? 0 : document.getElementById("lat").value;
        var lng = document.getElementById("lng").value == null ? 0 : document.getElementById("lng").value;
        location.href = "index.jsp?lat=" + lat + "&lng=" + lng;
    }

    function goDetail(idx) {
        location.href = "wifiDetail.jsp?X_SWIFI_MGR_NO=" + idx;
    }
</script>
