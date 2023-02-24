<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="ko">

<head>
    <!--          meta 선언          -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--          link 선언          -->
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/style_join.css">

    <!--          script 선언          -->
    <script src="https://kit.fontawesome.com/e1bd1cb2a5.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

    <script src="../js/script.js"></script>

    <title>
        MASCOT CLAN PAGE
    </title>
</head>

<body>
    <!-- 헤더 include -->
<%@ include file= '/header.jsp'%>
   

    

    <div class="join_container">
        <h2>
            회원 가입
        </h2>
        <form method="post" action="/join_Action.jsp">
            <h3>아이디</h3>
            <div class="joinID">
                <input type="text" class="input" style="ime-mode:disabled;" placeholder="아이디" name="userID" title="아이디" maxlength="20">
            </div>
            <h3>비밀번호</h3>
            <div class="joinPassword">
                <input type="password" class="input" placeholder="비밀번호" name="userPassword" title="비밀번호" maxlength="20">
            </div>
            <h3>이름</h3>
            <div class="joinName">
                <input type="text" class="input" placeholder="이름" name="userName" title="이름" maxlength="20">
            </div>
            <h3>생년월일</h3>
            <div class="joinDate">
                <input type="date" class="input" placeholder="생년월일" name="userDate">
            </div>
            <h3>성별</h3>
            <div class="joinGender">
                <input type="radio" name="userGender" value="M" title="성별"> 남자
                <input type="radio" name="userGender" value="F" title="성별"> 여자
            </div>
            <input type="submit" class="bt_join" value="회원가입">
        </form>
    </div>

    <
<!--푸터 inlcude  -->
<%@ include file= '/footer.jsp'%>
</body>

</html>

