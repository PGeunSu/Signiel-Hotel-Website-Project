# 🏨 Signiel-Hotel-Website-Project
객실 예약 사이트 (개인 프로젝트)

<br>

## 🖥️ 프로젝트 소개 
시그니엘 서울 웹사이트 클론 코딩 및 객실 예약 사이트 입니다 
<br>

>📺 🎥 [기능 구현 영상](https://drive.google.com/file/d/1DszZpN0sRuT7cT4lxNiBSN7y7R2YeiN3/view?usp=share_link)


<br>

## 📅 프로젝트 기간 <br>
22.10.17 ~ 22.11.04 (1인)

<br>

## ⌨️ 개발 환경
* OS : Window
* Tool : Eclipse, HeidiSQL, Git
* Front-End : JSP, CSS, JavaSCript,Jquery
* Back-End : Java(1.8.0), ApacheTomcat
* DataBase : MySQL

<br>

## 🖱️ 기능 구현
1. 회원가입 및 로그인, 로그아웃
2. 회원 수정 및 탈퇴
3. 아이디, 이메일 중복검사
4. 게시글 작성 및 수정,삭제
5. 게시글 검색
6. 객실 예약
7. 예약 내역 조회 및 취소

<br>

## 💡 상세 기능 설명 💡

### 목차
* [메인화면](#-메인화면)
* [회원가입](#-회원가입)
* [로그인 및 회원수정](#-로그인-및-회원수정)
* [예약 기능](#-예약-기능)
* [예약 조회 및 취소](#-예약-조회-및-취소)

<br>

## 📖 메인화면
![메인화면](https://user-images.githubusercontent.com/110580350/210519095-85b15747-7e8c-43af-961d-3aa358091a92.gif)

### AutoSwiper
```javaScript
	 var swiper = new Swiper(".mySwiper", {
        spaceBetween: 30,
        centeredSlides: true,
        autoplay: {
          delay: 3000,
          disableOnInteraction: false,
        },
        loop : true,
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });
```

### 현재 날씨 및 기온
```javaScript
<script>
	 $.getJSON(
	            "https://api.openweathermap.org/data/2.5/weatherid=1835848&appid=079b8942e0b5aa9292436aca492ee8f0&units=metric",
    function (data) {

        var $cTemp = data.main.temp;


        $(".ctemp").prepend($cTemp);

        var $now = new Date();
        var $cDate = $now.getFullYear() + "년" + ($now.getMonth() + 1) + "월" + $now.getDate()
            + "일 " + $now.getHours() + " : " + $now.getMinutes() + "\n";

        $(".cDate")	.prepend($cDate);
    }
);
	
	</script>
```

### Map API 
```javaScript
//Kakao Map API 유료화로 인하여 표시 안됨
 <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=25865c9220776c3ab30a64088a76e6db"></script>
             <script>
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
          mapOption = {
              center: new kakao.maps.LatLng(37.8282, 127.0685), // 지도의 중심좌표
              level: 5 // 지도의 확대 레벨
          };

      // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
      var map = new kakao.maps.Map(mapContainer, mapOption); 
  </script>
```

<br>

## 📖 회원가입
![회원가입](https://user-images.githubusercontent.com/110580350/210520632-194ecd48-c930-47f3-91d6-916fb5debee6.gif)

### 회원 추가
```jsp
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("userID");
	String password = request.getParameter("userPassword");
	String email = request.getParameter("userEmail");
	String firstName = request.getParameter("userEnFirstName");
	String lastName = request.getParameter("userEnLastName");
	String koName = request.getParameter("userKoName");
	String birth = request.getParameter("userBirth");	
	String number = request.getParameter("userNumber");
%>
	<sql:setDataSource var="dataSource"
		url="jdbc:mysql://localhost:3307/ProjectDB"
		driver="com.mysql.jdbc.Driver" user="root" password="1234" />
	<sql:update dataSource="${dataSource}" var="resultSet">
		INSERT INTO member VALUES (?,?,?,?,?,?,?,?)
		<sql:param value="<%=id%>" />
		<sql:param value="<%=password%>" />
		<sql:param value="<%=email%>" />
		<sql:param value="<%=firstName%>" />
		<sql:param value="<%=lastName%>" />
		<sql:param value="<%=koName%>" />
		<sql:param value="<%=birth%>" />
		<sql:param value="<%=number%>" />
	</sql:update>	
```
### 아이디,이메일 중복확인
```jsp
String sql = "select * from member where UserID = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
<%
		if(rs.next()){%>
		<script>
			alert("중복된 아이디입니다.");
			location.href = "signup.jsp"; //회원가입 화면으로 이동 후 초기화
		</script>
	<%
		}else{%>
		<script>
			alert("사용가능한 아이디 입니다.")	
			window.history.back(); // 뒤로가기
		</script>
		<%} %>
    
    String sql = "select * from member where userEmail = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, email);
	rs = pstmt.executeQuery();
	
%>
<%
		if(rs.next()){%>
		<script>
			alert("중복된 이메일입니다.");
			location.href = "signup.jsp";
		</script>
	<%
		}else{%>
		<script>
			alert("사용가능한 이메일 입니다.")	
			window.history.back();
		</script>
		<%} %>
```

## 📖 로그인 및 회원수정
![로그인-및-회원-수정-_](https://user-images.githubusercontent.com/110580350/210522155-fbbb9488-aa65-4ce0-8d4b-f39a9eff57d6.gif)

### 로그인
```jsp
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("userID");
	String password = request.getParameter("userPassword");
	
%>
	<sql:setDataSource var="dataSource" url="jdbc:mysql://localhost:3307/ProjectDB"
	driver="com.mysql.jdbc.Driver" user="root" password="1234" />
	
	<!-- sql쿼리문 실행하는 코드. executeQuery() -->
	<sql:query dataSource="${dataSource}" var="resultSet">
	SELECT * FROM MEMBER WHERE userID =? and userPassword=?  
		<sql:param value="<%=id%>"/>
		<sql:param value="<%=password%>"/>
	</sql:query>
	
	<c:forEach var="row" items="${resultSet.rows}">
		<%
			session.setAttribute("sessionId",id);
			//로그인이 되면 사용자 아이디를 세션에 설정(저장)
		%>
		<c:redirect url="resultMember.jsp?msg=2"/>
		<!-- 로그인 의미로 사용할 것 -->
	</c:forEach>
```

### 로그아웃
```jsp
<%
	session.invalidate();//session 삭제하면 로그아웃
	response.sendRedirect("login.jsp");
%>
```

### 회원 수정
```jsp
<%
	request.setCharacterEncoding("UTF-8");
	
String id = request.getParameter("userID");
String password = request.getParameter("userPassword");
String email = request.getParameter("userEmail");
String firstName = request.getParameter("userEnFirstName");
String lastName = request.getParameter("userEnLastName");
String koName = request.getParameter("userKoName");
String birth = request.getParameter("userBirth");	
String number = request.getParameter("userNumber");
%>
	<sql:setDataSource var="dataSource"
		url="jdbc:mysql://localhost:3307/ProjectDB"
		driver="com.mysql.jdbc.Driver" user="root" password="1234" />
	<sql:update dataSource="${dataSource}" var="resultSet">
		update member set userEmail=?, userPassword=?, userEnFirstName=?, userEnLastName=?, userKoName=?, userBirth=?, userNumber=? where userID = ?
		<sql:param value="<%=email%>" />
		<sql:param value="<%=password%>" />
		<sql:param value="<%=firstName%>" />
		<sql:param value="<%=lastName%>" />
		<sql:param value="<%=koName%>" />
		<sql:param value="<%=birth%>" />
		<sql:param value="<%=number%>" />
		<sql:param value="<%=id%>" />
	</sql:update>	
```

### 회원 탈퇴
```jsp
<%
	String sessionId = (String) session.getAttribute("sessionId");
	
%>
	<sql:setDataSource var="dataSource" url="jdbc:mysql://localhost:3307/ProjectDB"
	driver="com.mysql.jdbc.Driver" user="root" password="1234" />
	
	<!-- sql쿼리문 실행하는 코드. executeQuery() -->
	<sql:update dataSource="${dataSource}" var="resultSet">
		delete from member where userID = ?
		<sql:param value="<%=sessionId %>"/>
	</sql:update>
	
	<c:if test="${resultSet >= 1 }">
		<c:import var="url" url="login.jsp"/>
		<c:redirect url="resultMember.jsp"/>
	</c:if>
```

<br>

## 📖 게시판 기능 
![게시판](https://user-images.githubusercontent.com/110580350/210522812-9d201a0f-c053-49ee-ac6e-aa9cc73e5189.gif)

Controller와 Command로 나눠서 구분

### Controller
```java
	public class BoardController extends HttpServlet {
		   private static final long serialVersionUID = 1L;
		 
		    public BoardController() {
		        
		    }


		   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		      actionDo(request, response);      
		   }

		   
		   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		      actionDo(request, response);
		   }
		   
		   
		   private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		      System.out.println("actionDo");
		      
		      String uri = request.getRequestURI();
		      String contextPath = request.getContextPath();
		      String command = uri.substring(contextPath.length());
		      response.setContentType("text/html; charse=utf-8");
		      request.setCharacterEncoding("UTF-8");
		      
		      BCommand com = null;
		      String viewPage = null;
		      
		    //command 패턴에 따라서 분기함
		      if(command.equals("/boardListAction.do")) {
					
		    	  com = new BListCommand();
		    	  com.execute(request, response);
		    	  viewPage = "./board/list.jsp";
		    	  
		      }else if(command.equals("/boardWriteForm.do")) {
					
					com = new BWriteFormCommand();
					com.execute(request, response);	
					viewPage = "./board/writeForm.jsp";
					
			  }else if(command.equals("/boardWriteAction.do")) {
					
					com = new BWriteCommand();
					com.execute(request, response);
					viewPage = "/boardListAction.do";
					
				}else if(command.equals("/boardViewAction.do")) {      //게시판에 있는 게시물 제목 클릭하여 상세내용보는 부분
					
			         com = new BViewCommand();
			         com.execute(request, response);
			      
			         
			         viewPage = "./board/view.jsp";
			      }else if(command.equals("/boardUpdateAction.do")) {      //게시판에 있는 게시물 제목 클릭하여 상세내용보는 부분
						
	                     com = new BUpdateCommand();
	                     com.execute(request, response);
	                     viewPage = "/boardListAction.do";
                  }else if(command.equals("/boardDeleteAction.do")) {      //게시판에 있는 게시물 제목 클릭하여 상세내용보는 부분
                        
                         com = new BDeleteCommand();
                         com.execute(request, response);
                         viewPage = "/boardListAction.do";
                      } 
		      //위의 분기문에서 설정된 view(.jsp)파일로 페이지 이동
		      RequestDispatcher rDispatcher = request.getRequestDispatcher(viewPage);
		      rDispatcher.forward(request, response);
		      
		      
		   }
```

### Command

#### 게시판 작성
```java
public class BWriteCommand implements BCommand {
	// 게시글을 작성하고 그 게시글을 DB에 저장해주는 커맨드 객체
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		BoardDAO bDAO = BoardDAO.getInstance();
		BoardDTO boardDTO = new BoardDTO();
		

		boardDTO.setId(request.getParameter("id"));
		boardDTO.setName(request.getParameter("name"));
		boardDTO.setSubject(request.getParameter("subject"));
		boardDTO.setContent(request.getParameter("content"));

		SimpleDateFormat sFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
		String regist_day = sFormat.format(new Date());

		boardDTO.setRegist_day(regist_day);
		boardDTO.setHit(0);
		boardDTO.setIp(request.getRemoteAddr());
		bDAO.insertBoard(boardDTO); // DB에 저장하는 메소드 호출
	}
```
#### 게시판 목록 
```java
public class BListCommand implements BCommand {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	// 게시판 리스트를 직접적으로 가져오는 커맨드 객체	
		BoardDAO bDao =  BoardDAO.getInstance();
		ArrayList<BoardDTO> boardlist = new ArrayList<>();
		
		int pageNum = 1;
		int limit = 5;			//한페이지에 나타낼 게시글 수
		
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			//페이지 값이 null이 아니라면 해당 페이지를 숫자로 변환하여 저장함.
		}	
		String items = request.getParameter("items");					//제목,본문, 글쓴이
		String text = request.getParameter("text");						//검색어
		
		int totalRecord = bDao.getListCount(items, text);				//DB저장되어 있는 게시글 총 갯수
		boardlist = bDao.getBoardList(pageNum, limit, items, text);// db에 저장되어 있는 실제 게시글 가져옴
		
		// 홈페이지 수 구하기
		int totalPage = 1;
		
		if(totalPage % limit == 0) {
			totalPage = totalRecord / limit;
			Math.floor(totalPage);
		}else {
			totalPage = totalRecord / limit;
			Math.floor(totalPage);
			totalPage += 1;
		}
		//Request 객체에 각가 해당하는 값 저장
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("boardList", boardlist);

		
	}


}
```

#### 게시판 상세보기 
```java
public class BViewCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		BoardDAO bDao = BoardDAO.getInstance();
		
		int num = Integer.parseInt(request.getParameter("num"));
		//보고자 하는 번호
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		//보고자하는 게시글이 있는 페이지수
		BoardDTO boardDTO = new BoardDTO();
		boardDTO =  bDao.getBoardByNum(num, pageNum);
		
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("boardDTO", boardDTO);
		
		
		
	}
```

#### 게시판 수정 및 삭제
```java
public class BUpdateCommand implements BCommand{
 @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
      
        int num = Integer.parseInt(request.getParameter("num"));
        
        BoardDAO bDao = BoardDAO.getInstance();
        BoardDTO boardDTO = new BoardDTO();
        
        boardDTO.setNum(num);
        boardDTO.setSubject(request.getParameter("subject"));
        boardDTO.setContent(request.getParameter("content"));
        
        SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String regist_day = sFormat.format(new Date());
        
        boardDTO.setRegist_day(regist_day);
        boardDTO.setIp(request.getRemoteAddr());   
        
        bDao.updateBoard(boardDTO);
    }
  }
    
    public class BDeleteCommand implements BCommand {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
      
        int num = Integer.parseInt(request.getParameter("num"));
        
        BoardDAO bDao = BoardDAO.getInstance();
        bDao.deleteBoard(num);
        
    }

}
```

<br>

## 📖 예약 기능
![예약기능](https://user-images.githubusercontent.com/110580350/210523871-a3947ea8-823a-4dfc-960d-f3da2738f4e3.gif)

### 예약 날짜 및 객실 선택
```java
@WebServlet(urlPatterns = {"/reservation/reserveroom"})
public class ReservationRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * reservation - reservation1.jsp에서 원하는 투숙 날짜, 인원수 정보를 받아 reservation2.jsp에게 조건에 맞는 객실 정보를 전송
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String r_checkin = request.getParameter("r_checkin");
		String r_checkout = request.getParameter("r_checkout");
		int r_adults = Integer.parseInt(request.getParameter("r_adults"));
		int r_kids = Integer.parseInt(request.getParameter("r_kids"));	

		String msg = "";
		ReservationDAO rDAO = new ReservationDAO();
		ArrayList<RoomDTO> room_type = rDAO.selectRoomByPeople(r_adults+r_kids);
		ArrayList<RoomDTO> totalroom = rDAO.selectRoomByDate(room_type, r_checkin, r_checkout);
		
		if(totalroom.size()==0){
			msg = "예약 가능하신 방이 없습니다.다시 선택해주세요";
		}
		
		String  str = "yyyy-MM-dd";
		SimpleDateFormat sdf = new SimpleDateFormat(str);
		long diffday = 0;
		try {
			Date checkin = sdf.parse(r_checkin);
			Date checkout = sdf.parse(r_checkout);
			
			diffday = (checkout .getTime() - checkin.getTime()) / (24*60*60*1000);
		
		} catch (ParseException e) {
			System.err.println("ReservationRoomServlet - doGet() err : " + e.getMessage());
		}
		
		request.setAttribute("diffday", diffday);
		request.setAttribute("r_checkin", r_checkin);
		request.setAttribute("r_checkout", r_checkout);
		request.setAttribute("r_adults", r_adults);
		request.setAttribute("r_kids", r_kids);
		request.setAttribute("totalroom", totalroom);
		request.setAttribute("msg", msg);
		
		RequestDispatcher rd = request.getRequestDispatcher("reservation2.jsp");
		rd.forward(request, response);
		
	}
```

### 옵션 선택 후 예약 확정
```java
/**
	 *  reservation - reservation3.jsp 에서 예약에 관련된 모든 정보를 가져와 db에 저장후 예약 완료 여부 결과를 reservationProc.jsp 에게 전달
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String r_id = (String)session.getAttribute("sessionId");
		int r_adults = Integer.parseInt(request.getParameter("r_adults"));
		int r_kids = Integer.parseInt(request.getParameter("r_kids"));
		String r_checkin = request.getParameter("r_checkin");
		String r_checkout = request.getParameter("r_checkout");
		String r_type = request.getParameter("r_type");
		int r_price = Integer.parseInt(request.getParameter("r_price"));
		
		ReservationDTO r = new ReservationDTO();
		r.setR_id(r_id);
		r.setR_adults(r_adults);
		r.setR_kids(r_kids);
		r.setR_checkin(r_checkin);
		r.setR_checkout(r_checkout);
		r.setR_type(r_type);
		r.setR_price(r_price);

		ReservationDAO dao = new ReservationDAO();
		int result = dao.insertRoom(r);
		
		request.setAttribute("result", result);
		RequestDispatcher rd = request.getRequestDispatcher("reservationProc.jsp");
		rd.forward(request, response);
	}
```
<br>

## 📖 예약 조회 및 취소
![예약-조회-및-취소](https://user-images.githubusercontent.com/110580350/210525529-7c193adb-8e97-44cf-852e-9b090091a88f.gif)

### 에약 조회
```java
@WebServlet(urlPatterns= {"/reservation/reserveinfo"})
public class UserReserveInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 각 header.jsp에서 예약내역 클릭시 회원의 예약내역 정보를 reservation - reserveInfo.jsp에게 전달 
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String sessionId = (String)session.getAttribute("sessionId");
		ReservationDAO dao = new ReservationDAO();
		ArrayList<ReservationDTO> dto = dao.selectReservation(sessionId);

		request.setAttribute("dto", dto);
		RequestDispatcher rd = request.getRequestDispatcher("/reservation/reserveInfo.jsp");
		rd.forward(request, response);
	}

	/**
	 * user - reserveInfo.jsp에서 예약취소 버튼 클릭시 회원의 모든 예약 정보를 reserveCancel.jsp에게 전달
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String sessionId = (String)session.getAttribute("sessionId");
		ReservationDAO dao = new ReservationDAO();
		ArrayList<ReservationDTO> dto = dao.selectReservation(sessionId);
		
		request.setAttribute("dto", dto);
		RequestDispatcher rd = request.getRequestDispatcher("/reservation/reserveCancel.jsp");
		rd.forward(request, response);
	}

}
```

### 예약 취소
```java
@WebServlet(urlPatterns= {"/reservation/reservecancel"})
public class UserReserveCancelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * user - reserveCancel.jsp에서 체크된 예약내역 번호들을 가져와서 db에 저장된 예약 내역을 삭제 후 reserveInfo.jsp로 이동
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] r_number = request.getParameterValues("reserve");
		int[] r_numbers = Arrays.stream(r_number).mapToInt(Integer::parseInt).toArray();
		
		ReservationDAO rdao = new ReservationDAO();
		int num = rdao.cancelReservation(r_numbers);
		request.setAttribute("num", num);

		RequestDispatcher rd = request.getRequestDispatcher("reserveinfo");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
```
