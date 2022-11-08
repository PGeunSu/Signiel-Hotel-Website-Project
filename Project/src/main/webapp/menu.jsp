<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<style>
	 
      a, a:hover{
      color : #333;
      text-decoration: none;
      }

</style>
<!-- ${pageContext.request.contextPath} : 다른 경로의 폴더로 include시 경로가 바뀌어 이미지를 못불러온 현상이 일어남 (절대경로로 값을 넣어줌으로 서 오류 해결) -->
<body>
	<div class="s598-gnb-pc" style="height:86px;">
	<div class="s598-gnb-top" style="position:fixed;">
		<div class="inner">
			<h1>
				<a class="s598-logo" href="${pageContext.request.contextPath}/main.jsp" target="_self"><img src="${pageContext.request.contextPath}/images/menu/gnb_logo_signiel.png" class="retinaimg"></a>
			</h1>
			<div class="s598-quick-combobox show">
				<div class="quick-list">
                        <a href="#" class="ico-global"><span>글로벌</span></a>
                        <a href="#" >호텔찾기</a>
                        <a href="#" ><span>멤버십</span></a>
                        <c:choose>
							<c:when test="${empty sessionId}">
								<a class="before-login-show" href="<c:url value="/member/login.jsp"/>">로그인</a>
								<a class="before-login-show" href="<c:url value="/member/signup.jsp"/>">회원가입</a>
							</c:when>
							<c:otherwise>
								<a class="before-login-show" href="<c:url value="/reservation/reserveinfo"/>">예약조회</a>
								<a class="before-login-show" href="<c:url value="/member/logoutMember.jsp"/>">로그아웃</a>
								<a class="before-login-show" href="<c:url value="/member/updateMember.jsp"/>">회원수정</a>
								<a class="nav-link" href="<c:url value="/boardListAction.do?pageNum=1"/>">게시판</a>
							</c:otherwise>
						</c:choose>
                    </div>
                    <div class="quick-site-ui-sel-wrapper"></div>
			</div>
		</div>
		</div>
		<!-- scroll시 fixed -->
		<div class="s598-gnb-wrap ui-public-scroll" style="top:0px; margin-top:45px; position:fixed;">
			<div>
			<div class="s598-rewards-btn"><a href="#" target="_self">LOTTE HOTEL<br class="br-1200"> REWARDS</a></div>
			<div class="navi" style="box-shadow: none; height:86px;">
				<nav>
					<ul class="s598-navi">
						<li class="menu-1depth reservation">
                                <a href="${pageContext.request.contextPath}/reservation/reservation1.jsp" class="menu-1depth-text ui-reservation-btn"><span>객실예약</span></a>
                            </li>
						<li class="menu-1depth">
							<a class="menu-1depth-text" href="#" target="_self" data-menu-idx="0"><span>시그니엘 서울 소개</span></a>
							<section class="menu-panel s598__menu-panel--not-1-5" data-section-idx="0">
								<div class="panel-wrap">
									<div class="panel-align panel-ttl">
										<div class="panel-1depth">
											<a class="menu-1depth-ttl" href="#" target="_self">시그니엘 서울 <br> 소개 </a>
										</div>
									</div>
									<div class="panel-align panel-category">
										<div class="panel-category-wrap">
											<ul class="menu-2depth-wrap" name="gnbSubMenu">
												<li><a href="#" class="menu-2depth f-bold">시그니엘 서울 소개</a></li>
												<li><a href="#" class="menu-2depth f-bold">시그니엘 서울 위치</a></li>
												<li><a href="#" class="menu-2depth f-bold">주요명소</a></li>
												<li><a href="#" class="menu-2depth f-bold">공지사항</a></li>
												<li><a href="#" class="menu-2depth f-bold">갤러리</a></li>
												<li><a href="#" class="menu-2depth f-bold">ART COLLECTION</a></li>
												<li><a href="#" class="menu-2depth f-bold">수상</a></li>
											</ul>
										</div>
									</div>	
								</div>
							</section>
						</li>
						<li class="menu-1depth">
							<a class="menu-1depth-text "href="${pageContext.request.contextPath}/room.jsp	" target="_self" data-menu-idx="1"><span>객실</span></a>
							<section class="menu-panel s598__menu-panel--not-1-5" data-section-idx="1">
							  <div class="panel-wrap">
							    <div class="panel-align panel-ttl">
							      <div class="panel-1depth">
							        <a class="menu-1depth-ttl" href="${pageContext.request.contextPath}/room.jsp" target="_self"> 객실 </a>
							      </div>
							    </div>
							    <div class="panel-align panel-category">
							      <div class="panel-category-wrap">
							        <ul class="menu-2depth-wrap" name="gnbSubMenu">
							          <li>
							            <a class="menu-2depth f-bold">그랜드 디럭스</a>
							            <ul class="menu-3depth-wrap">
							              <li>
							                <a class="menu-3depth" href="#" target="_self">그랜드 디럭스 룸</a>
							              </li>
							            </ul>
							          </li>
							          <li>
							            <a class="menu-2depth f-bold">프리미어</a>
							
							            <ul class="menu-3depth-wrap">
							              <li>
							                <a class="menu-3depth" href="#" target="_self">프리미어 룸</a>
							              </li>
							
							              <li>
							                <a class="menu-3depth" href="#" target="_self">코리안 프리미어 룸</a>
							              </li>
							            </ul>
							          </li>
							
							          <li>
							            <a class="menu-2depth f-bold">시그니엘 프리미어</a>
							
							            <ul class="menu-3depth-wrap">
							              <li>
							                <a class="menu-3depth" href="#" target="_self">시그니엘 프리미어 룸</a>
							              </li>
							
							              <li>
							                <a class="menu-3depth" href="#" target="_self">코리안 시그니엘 프리미어 룸</a>
							              </li>
							            </ul>
							          </li>
							
							          <li>
							            <a class="menu-2depth f-bold">스위트</a>
							
							            <ul class="menu-3depth-wrap">
							              <li>
							                <a class="menu-3depth" href="#" target="_self">디럭스 스위트 룸</a>
							              </li>
							
							              <li>
							                <a class="menu-3depth" href="#" target="_self">프리미어 스위트 룸</a>
							              </li>
							
							              <li>
							                <a class="menu-3depth" href="#" target="_self">코리안 스위트 룸</a>
							              </li>
							
							              <li>
							                <a class="menu-3depth" href="#" target="_self">프레지덴셜 스위트 룸</a>
							              </li>
							
							              <li>
							                <a class="menu-3depth" href="#" target="_self">로얄 스위트 룸</a>
							              </li>
							            </ul>
							          </li>
							        </ul>
							      </div>
							    </div>
							  </div>
							</section>
							
						</li>	
						<li class="menu-1depth">
						  <a class="menu-1depth-text" href="#" target="_self" data-menu-idx="2">
						    <span>스페셜 오퍼</span>
						  </a>
						  <section class="menu-panel s598__menu-panel--not-1-5" data-section-idx="2">
						    <div class="panel-wrap">
						      <div class="panel-align panel-ttl">
						        <div class="panel-1depth">
						          <a class="menu-1depth-ttl" href="#" target="_self"> 스페셜 오퍼 </a>
						        </div>
						      </div>
						      <div class="panel-align panel-category">
						        <div class="panel-category-wrap">
						          <ul class="menu-2depth-wrap" name="gnbSubMenu">
						            <li>
						              <a href="#" class="menu-2depth f-bold">객실 프로모션</a>
						            </li>
						
						            <li>
						              <a href="#" class="menu-2depth f-bold">식음 프로모션&nbsp;</a>
						            </li>
						
						            <li>
						              <a href="#" class="menu-2depth f-bold">호텔 이벤트</a>
						            </li>
						
						            <li>
						              <a href="#" class="menu-2depth f-bold">해온 베딩 시스템</a>
						            </li>
						          </ul>
						        </div>
						      </div>
						    </div>
						  </section>
						</li>
						<li class="menu-1depth">
						  <a class="menu-1depth-text" href="#" target="_self" data-menu-idx="3">
						    <span>다이닝</span>
						  </a>
						  <section class="menu-panel s598__menu-panel--not-1-5" data-section-idx="3">
						    <div class="panel-wrap">
						      <div class="panel-align panel-ttl">
						        <div class="panel-1depth">
						          <a class="menu-1depth-ttl" href="#" target="_self"> 다이닝 </a>
						        </div>
						      </div>
						      <div class="panel-align panel-category">
						        <div class="panel-category-wrap">
						          <ul class="menu-2depth-wrap" name="gnbSubMenu">
						            <li>
						              <a class="menu-2depth f-bold">레스토랑</a>
						
						              <ul class="menu-3depth-wrap">
						                <li>
						                  <a class="menu-3depth" href="#" target="_self">스테이, 모던 레스토랑</a>
						                </li>
						
						                <li>
						                  <a class="menu-3depth" href="#" target="_self">비채나</a>
						                </li>
						              </ul>
						            </li>
						
						            <li>
						              <a class="menu-2depth f-bold">멤버스 레스토랑</a>
						
						              <ul class="menu-3depth-wrap">
						                <li>
						                  <a class="menu-3depth" href="#" target="_self">SIGNIEL CLUB</a>
						                </li>
						              </ul>
						            </li>
						
						            <li>
						              <a class="menu-2depth f-bold">바&amp;라운지</a>
						
						              <ul class="menu-3depth-wrap">
						                <li>
						                  <a class="menu-3depth" href="#" target="_self">더 라운지</a>
						                </li>
						
						                <li>
						                  <a class="menu-3depth" href="#" target="_self">바81</a>
						                </li>
						              </ul>
						            </li>
						
						            <li>
						              <a class="menu-2depth f-bold">베이커리</a>
						
						              <ul class="menu-3depth-wrap">
						                <li>
						                  <a class="menu-3depth" href="#" target="_self">Pastry Salon</a>
						                </li>
						              </ul>
						            </li>
						          </ul>
						        </div>
						      </div>
						    </div>
						  </section>
						</li>
						<li class="menu-1depth">
						  <a class="menu-1depth-text" href="#" target="_self" data-menu-idx="4">
						    <span>부대시설</span>
						  </a>
						  <section class="menu-panel s598__menu-panel--not-1-5" data-section-idx="4">
						    <div class="panel-wrap">
						      <div class="panel-align panel-ttl">
						        <div class="panel-1depth">
						          <a class="menu-1depth-ttl" href="#" target="_self"> 부대시설 </a>
						        </div>
						      </div>
						      <div class="panel-align panel-category">
						        <div class="panel-category-wrap">
						          <ul class="menu-2depth-wrap" name="gnbSubMenu">
						            <li>
						              <a class="menu-2depth f-bold">스파&amp;피트니스</a>
						
						              <ul class="menu-3depth-wrap">
						                <li>
						                  <a class="menu-3depth" href="#" target="_self">호텔 사우나</a>
						                </li>
						
						                <li>
						                  <a class="menu-3depth" href="#" target="_self">피트니스센터</a>
						                </li>
						
						                <li>
						                  <a class="menu-3depth" href="#" target="_self">호텔 수영장</a>
						                </li>
						              </ul>
						            </li>
						
						            <li>
						              <a class="menu-2depth f-bold">서비스</a>
						
						              <ul class="menu-3depth-wrap">
						                <li>
						                  <a class="menu-3depth" href="#" target="_self">살롱 드 시그니엘</a>
						                </li>
						              </ul>
						            </li>
						          </ul>
						        </div>
						      </div>
						    </div>
						  </section>
						</li>
						<li class="menu-1depth">
						  <a class="menu-1depth-text" href="#" target="_self" data-menu-idx="5">
						    <span>웨딩&amp;컨벤션</span>
						  </a>
						  <section class="menu-panel s598__menu-panel--not-1-5" data-section-idx="5">
						    <div class="panel-wrap">
						      <div class="panel-align panel-ttl">
						        <div class="panel-1depth">
						          <a class="menu-1depth-ttl" href="#" target="_self"> 웨딩&amp;컨벤션 </a>
						        </div>
						      </div>
						      <div class="panel-align panel-category">
						        <div class="panel-category-wrap">
						          <ul class="menu-2depth-wrap" name="gnbSubMenu">
						            <li>
						              <a class="menu-2depth f-bold">호텔 웨딩</a>
						
						              <ul class="menu-3depth-wrap">
						                <li>
						                  <a class="menu-3depth" href="#none" target="_self">웨딩&amp;파티</a>
						
						                  <ul class="menu-4depth-wrap">
						                    <li>
						                      <a href="#" class="menu-4depth" target="_self">시그니엘 웨딩</a>
						                    </li>
						
						                    <li>
						                      <a href="#" class="menu-4depth" target="_self">프라이빗 파티</a>
						                    </li>
						                  </ul>
						                </li>
						
						                <li>
						                  <a class="menu-3depth" href="#" target="_self">문의</a>
						                </li>
						              </ul>
						            </li>
						
						            <li>
						              <a href="#" class="menu-2depth f-bold">호텔 컨벤션</a>
						
						              <ul class="menu-3depth-wrap">
						                <li>
						                  <a class="menu-3depth" href="#" target="_self">그랜드 볼룸</a>
						                </li>
						
						                <li>
						                  <a class="menu-3depth" href="#" target="_self">스튜디오 I-IV</a>
						                </li>
						
						                <li>
						                  <a class="menu-3depth" href="#" target="_self">시그니엘 포이어</a>
						                </li>
						
						                <li>
						                  <a class="menu-3depth" href="#" target="_self">문의</a>
						                </li>
						              </ul>
						            </li>
						          </ul>
						        </div>
						      </div>
						    </div>
						  </section>
						</li>
					</ul>
				</nav>
				<div class="s598_wrapper--block"></div>
			</div>
			<div class="rewards-menu">
				<nav></nav>
                </div> 
                <!-- div class="reserv-transform 위치 -->
		</div>
		</div>
	</div>
</body>
</html>