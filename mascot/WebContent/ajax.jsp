<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- <%@page import="java.util.*,elo.*" %> --%>
    <%@page import="java.util.*,elo.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

<jsp:useBean id="eloDAO" class="elo.EloDAO"/>

<%
	String sort = null;
	if(request.getParameter("id") != null){
		sort = request.getParameter("id");
	}
	ArrayList list = eloDAO.getEloList(sort); 
	System.out.println("리스트 가져옴");
	// 빈 가져옴
	for(int i=0;i<list.size();i++){
		EloDTO eloDTO = (EloDTO)list.get(i);
		
	%>
	<tr>
		<!-- 등수 -->
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
		<!-- 유저아이디 -->
		<c:set var="descr" value="<%=eloDTO.getDescr() %>"/>
		<c:if test="${descr.equals('멤버')}">
		<td> <%=eloDTO.getUser_id() %></td>
		</c:if>
		<c:if test="${descr.equals('수습')}">
		<td> <%=eloDTO.getUser_id() %>(수습)</td><%-- <a href='content.jsp?idx=<%=EloDTO.getIdx()%>'></a> --%>
		</c:if>
		<c:if test="${!descr.equals('수습') && !descr.equals('멤버')}">
		<td> <%=eloDTO.getUser_id() %>(용병)</td><%-- <a href='content.jsp?idx=<%=EloDTO.getIdx()%>'></a> --%>
		</c:if>
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
		<!-- 게임수 -->
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
		<!-- 포지션 -->
		<td id="champion" class="champion"> <img src="<%=request.getContextPath()%>/img/포지션/<%=eloDTO.getUser_position() %>.jpg" style="width:40px;height:40px;"></td>
		<!-- 티어 -->
		<%-- <td id="champion" class="champion"> <img src="<%=request.getContextPath()%>/img/티어/<%=eloDTO.getUser_lol_tear() %>.png" style="width:40px;height:40px;"></td> --%>
		<!-- 주요 챔피언 -->
		<td id="champion" class="champion"> <img src="<%=request.getContextPath()%>/img/champion/<%=eloDTO.getMost_played_champion() %>" style="width:40px;height:40px;"></td>
		<!-- 챔피언 횟수  -->
		<td> <%=eloDTO.getNum_games_most_played() %></td>
		<!-- Rating -->
		<td> <%=eloDTO.getRating() %></td>
	
	</tr>
	<%} %>

