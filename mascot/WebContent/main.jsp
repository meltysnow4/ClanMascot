<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- <%@page import="java.util.*,elo.*" %> --%>
    <%@page import="java.util.*,elo.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

<!DOCTYPE html>

 <div class="main_container">
        <!-- <div class="conA">
            <div class="slide img1"></div>
            <div class="slide img2"></div>
            <div class="slide img3"></div>
        </div> -->
        <!-- <div class="conB">
            <div class="conB_title">
                <h3>About</h3>
            </div>
            <div class="conB_container">
                <div class="conB_small_container">
                    <div class="conB_icon">
                        <i class="fas fa-code icon"></i>
                    </div>
                    <div class="conB_content">
                        <h3>Title 1</h3>
                        <p>Index 1</p>
                    </div>
                </div>
                <div class="conB_small_container">
                    <div class="conB_icon">
                        <i class="fas fa-cogs icon"></i>
                    </div>
                    <div class="conB_content">
                        <h3>Title 2</h3>
                        <p>Index 2</p>
                    </div>
                </div>
                <div class="conB_small_container">
                    <div class="conB_icon">
                        <i class="fas fa-plane icon"></i>
                    </div>
                    <div class="conB_content">
                        <h3>Title 3</h3>
                        <p>Index 3</p>
                    </div>
                </div>
            </div>
        </div> -->
        
       
    
    
<script type="text/javascript">
	function send(form){
		if(form.search.value ==""){
			alert('검색어 입력 바람');
			form.search.focus();
			return false;
		}
		form.submit();
	}
</script>
<%-- 페이징 처리??Go ? no .. PASS --%> 
<div id="table title" class="table_title">
<table>
	<tr> 
		<td>ELO RANK</td>
	</tr>
</table> <!-- 상단 테이블 --><br>
</div>

<div id="elo_Table" class="elo_Table">
<table>
	<thead>
	<tr>
		<td width="10%"><a class="sortHeader" href="javascript:runAjax('rating')">등수</a></td>
		<td width="20%">아이디</td>
		<td width="10%"><a class="sortHeader"  href="javascript:runAjax('win_rate')">승률</a></td>
		<td width="5%"><a class="sortHeader"  href="javascript:runAjax('num_games')">게임수</a></td>
		<td width="5%"><a class="sortHeader"  href="javascript:runAjax('avg_kda')">KDA</a></td>
		<td width="5%"><a class="sortHeader" href="javascript:runAjax('user_position')">라인</a></td>
		<!-- <td width="7%"><a class="sortHeader" href="javascript:runAjax('user_lol_tear')">솔랭티어</a></td> -->
		<td width="10%"><a class="sortHeader">주요 챔피언</a></td>
		<td width="10%"><a class="sortHeader">챔피언 횟수</a></td>
		<td width="10%"><a class="sortHeader">Rating</a></td>
		
	</tr>
	</thead>
	<form id="myform">
	<tbody id="mydiv">
	<%@ include file= '/ajax.jsp'%>
	</tbody>
	</form>
</table><br>
	<!-- 검색 폼 -->
	<!-- <div align="center">
	<form action='search.jsp' method="post" name="searchform">
		<select name='type'>
			<option value=name>이름</option>
			<option value=title selected="selected">제목</option>
			<option value=content>내용</option>
		</select>
	
	<input type="text" name="search" size="20">
	<input type="button" value='찾기' onclick='send(this.form);'>
	</form>
	</div> -->
</div>

    </div>