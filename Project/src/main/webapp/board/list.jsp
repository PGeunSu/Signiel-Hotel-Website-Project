<%@page import="mvc.model.BoardDTO"%>
<%@page import="java.util.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String sessionId = (String) session.getAttribute("sessionId");
	ArrayList<BoardDTO> boardList = (ArrayList<BoardDTO>) request.getAttribute("boardList");
	int totalPage = ((Integer) request.getAttribute("totalPage")).intValue();
	int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet" href="https://www.lottehotel.com/etc.clientlibs/lottehotel/clientlibs/clientlib-dependencies.min.ACSHASHd41d8cd98f00b204e9800998ecf8427e.css" type="text/css">
<link rel="stylesheet" href="https://www.lottehotel.com/etc.clientlibs/lottehotel/clientlibs/templates/clientlib-application.min.ACSHASH51a81fbda7b06de93c9f90f268cd5c56.css" type="text/css">
<link rel="stylesheet" href="https://www.lottehotel.com/etc.clientlibs/lottehotel/clientlibs/clientlib-base.min.ACSHASH985dfd4f4b8d35f936b21e46cd0c92c0.css" type="text/css">
<link rel="stylesheet" href="https://www.lottehotel.com/etc.clientlibs/lottehotel/clientlibs/clientlib-global/ko.min.ACSHASH90bb3e216f21b81b77438adfdac49bd1.css" type="text/css">
<script type="text/javascript" src="https://www.lottehotel.com/etc.clientlibs/lottehotel/clientlibs/clientlib-dependencies/library/common.min.ACSHASHc5c5b83d87f57a24c817c20db81839cf.js"></script>
<script type="text/javascript" src="https://www.lottehotel.com/etc.clientlibs/lottehotel/clientlibs/clientlib-dependencies.min.ACSHASHc05084d7f4367a8a4cca24c7b392c389.js"></script>
<link rel="stylesheet" href="http://localhost:8080/Project/css/slide.css" type="text/css">
<script type="text/javascript" src="http://localhost:8080/Project/js/Event.js"></script>
<title>게시판</title>
</head>
<body>
	<div class="root responsivergrid wrapper">
		<div class="aem-Grid aem-Grid--12 aem-Grid--default--12">
		 <%@ include file="/menu.jsp" %>
			<main class="main aem-GridColumn aem-GridColumn--default--12">
			  <div class="aem-Grid aem-Grid--12 aem-Grid--default--12">
			    <div id="container" class="ly-container">
			    	<div>
			    		<div class="d000 d000-">
					      <div class="location">
					            <span> <a href="#">홈</a> </span>
					          <span> <a href="#">시그니엘 서울 소개</a></span>
					              <span> 공지사항</span>
						 </div>
					      </div>
					</div>
					<form action='<c:url value="./boardListAction.do" />' method="post">
			      	<div class="responsivegrid aem-GridColumn aem-GridColumn--default--12">
			        <div class="aem-Grid aem-Grid--12 aem-Grid--default--12">
				        	<div class="s009-content-h1 aem-GridColumn aem-GridColumn--default--12">
							    <div class="s009  common-spacing-bottom--l">
							        <div class="s009__inner-area">
							                <h1 class="s009__headline">게시판</h1>
							        </div>
							    </div> 
							</div>
							<div class="d016-board-news-list aem-GridColumn aem-GridColum--deafault--12">
								<div class="d016 common-spacing-bottom--ss" id="newsListVueApp">
									<div class="d016-option">
									  <div class="d016-option__content">
									    <div class="d016-option__detail">
									      <div class="d016-option__select">
									        <div class="combobox combobox--2" style="z-index: 97">
									          <select name="items" class="combobox--2" style="width:100px; font-size: 16px; border:1px solid rgba(0, 0, 0, 0.3);">
									            <option value="subject">제목</option>
									            <option value="name">글쓴이</option>
									            <option value="content">내용</option>	
									          </select>
									        </div>
									      </div>
									      
									      <div class="d016-option__search">
									        <div class="input input--2">
									          <div class="input__wrap input__wrap--text">
									            <input name="text" type="text" class="o-input o-input--text" placeholder="검색어를 입력하세요" />
									          </div>
									        </div>
									        <input type="submit" class="d016-option__button" id="btnAdd" value="검색">
									          <span> 검색 </span>
									        
									      </div>
									    </div>
									  </div>
									</div>
									
									
									<div class="d016-list">
										<ul class="list__head">
										  <li class="list__row">
										    <p class="list__col list__col--1">번호</p>
										    <p class="list__col list__col--2">제목</p>
										    <p class="list__col list__col--3">조회</p>
										    <p class="list__col list__col--4">작성일</p>
										    <p class="list__col list__col--5">글쓴이</p>
										  </li>
										</ul>
										
										 <%
											for (int i = 0; i < boardList.size(); i++) {
												BoardDTO notice = boardList.get(i);
										%>
										<ul class="list_body">
											<li class="list__row">
												<p class="list__col list__col--1"><%=notice.getNum()%></p>
												<p class="list__col list__col--2"><a href="./boardViewAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>">
																						<%=notice.getSubject()%> </a></p>
												<p class="list__col list__col--3"><%=notice.getHit()%></p>
												<p class="list__col list__col--4"><%=notice.getRegist_day()%></p>
												<p class="list__col list__col--5"><%=notice.getName()%></p>
											</li>
											<%
												}
											%>
										</ul>
									</div>
										
									<div class="d016__paging" style="text-align:center; font-size:20px;">
										<!-- 페이지 수 표시 -->
										<c:set var="pageNum" value="<%=pageNum%>" />
										<!-- 페이지수를 jstl로 표시 -->
										<c:forEach var="i" begin="1" end="<%=totalPage%>">
											<a href=' <c:url value="./boardListAction.do?pageNum=${i}" />'>
												<c:choose>
													<c:when test="${pageNum==i}">
														<font style="background-color: #ad9e87; padding : 8px 15px; margin: 10px 10px;" 
														color="#f5f5f5">${i}</font>
													</c:when>
													<c:otherwise>
														<font color="4C5317">${i}</font>
													</c:otherwise>
												</c:choose>
											</a>
										</c:forEach>
									</div>
									<div class="s072__cta" style="float:right;">
									<a href="#" onclick="checkForm()" class="s072__button"><span>글쓰기</span></a>
									</div>
								</div>
							</div>
			          	</div>
					</div>
					 </form>
				</div>				
			</div>
		</main>
		<%@ include file="/footer.jsp" %>
		</div>
	</div>
</body>

<script type="text/javascript">
		function checkForm() {
			if (${ sessionId == null}) {
				alert("로그인 해주세요.");
				return false;
			}

			location.href = "./boardWriteForm.do?id=<%=sessionId%>"
		}
	</script>
</html>