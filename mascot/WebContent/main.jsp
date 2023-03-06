<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- <%@page import="java.util.*,elo.*" %> --%>
    <%@page import="java.util.*,elo.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

<jsp:useBean id="eloDAO" class="elo.EloDAO"/>

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
		<td width="10%">&nbsp;등수</td>
		<td width="30%">&nbsp;아이디</td>
		<td width="10%">&nbsp;승률</td>
		<td width="10%">&nbsp;게임수</td>
		<td width="10%">&nbsp;KDA</td>
		<td width="10%">&nbsp;주요 챔피언</td>
		<td width="10%">&nbsp;챔피언 횟수</td>
		<td width="10%">&nbsp;Rating</td>
		
	</tr>
	</thead>
	<tbody>
	<%
	ArrayList list = eloDAO.getEloList(); 
	System.out.println("리스트 가져옴");
	// 빈 가져옴
	for(int i=0;i<list.size();i++){
		EloDTO eloDTO = (EloDTO)list.get(i);
		
	%>
	<tr>
		<c:set var="rowNum" value="<%=eloDTO.getRowNum() %>"/>
		<c:choose>
			<c:when test="${rowNum eq 1}">
				<td><img src="<%=request.getContextPath()%>/img/1st.png" style="width:40px; heigth:40px"></td>
			</c:when>
			<c:when test="${rowNum eq 2}">
				<td><img src="<%=request.getContextPath()%>/img/2nd.png" style="width:40px; heigth:40px"></td>
			</c:when>
			<c:when test="${rowNum eq 3}">
				<td><img src="<%=request.getContextPath()%>/img/3rd.png" style="width:40px; heigth:40px"></td>
			</c:when>
			<c:otherwise>
				<td><%=eloDTO.getRowNum() %></td>
			</c:otherwise>
		</c:choose>
		<td> <%=eloDTO.getUser_id() %></td><%-- <a href='content.jsp?idx=<%=EloDTO.getIdx()%>'></a> --%>
		<!-- 승률조건  -->
		<c:set var="winRate" value="<%=eloDTO.getWin_rate() %>"/>
		<c:if test="${winRate > 70}">
			<td style="font-weight:900; color:red;"> <%=eloDTO.getWin_rate() %>%</td>
		</c:if>
		<c:if test="${winRate > 50 && winRate <= 70}">
			<td style="font-weight:800; color:teal;"> <%=eloDTO.getWin_rate() %>%</td>
		</c:if>
		<c:if test="${winRate <= 50}">
			<td style="font-weight:600; color:#9370DB;"> <%=eloDTO.getWin_rate() %>%</td>
		</c:if>
		<td> <%=eloDTO.getNum_games() %></td>
		<!-- kda조건 -->
		<c:set var="kda" value="<%=eloDTO.getAvg_kda() %>"/>
		<c:if test="${kda > 4}">
			<td style="font-weight:900; color:red;"> <%=eloDTO.getAvg_kda() %></td>
		</c:if>
		<c:if test="${kda <= 4 && kda > 3}">
			<td style="font-weight:800; color:#FF7F50;"> <%=eloDTO.getAvg_kda() %></td>
		</c:if>
		<c:if test="${kda <= 3 && kda > 2}">
			<td style="font-weight:700; color:#0000CD;"> <%=eloDTO.getAvg_kda() %></td>
		</c:if>
		<c:if test="${kda <= 2 }">
			<td style="font-weight:500; color:DimGray;"> <%=eloDTO.getAvg_kda() %></td>
		</c:if>
		<td id="champion" class="champion"> <img src="<%=request.getContextPath()%>/img/champion/<%=eloDTO.getMost_played_champion() %>" style="width:40px;height:40px;"></td>
		<td> <%=eloDTO.getNum_games_most_played() %></td>
		<td> <%=eloDTO.getRating() %></td>
	
	</tr>
	<%} %>
	</tbody>
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