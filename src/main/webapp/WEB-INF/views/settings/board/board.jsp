<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:import url="/settings/top"/>
<!-- Wrapper -->
<div id="wrapper">
	<!-- Main -->
		<div id="main">
			<div class="inner">
				<c:import url="/settings/header"/>
				<!-- Banner -->
					<section id="banner">
						<div class="content">
							<header>
								<h2><spring:message code="title.board"/></h2>
							</header>
							<div class="content">
								<section>
									<div class="box">
										<p><spring:message code="msg.settingBoard"/></p>
										<a href="javascript:void(0)" class="text-primary" onclick="boardCreate()"><spring:message code="button.create"/></a>
										<hr>

										<div class="row">
											<div class="col-6 col-6-xlarge">
												<ul class="alt">
													<c:forEach items="${boards}" var="board">
														<li><span id="board${board.brd_id}" class="hov board-item">${board.brd_name}</span></li>
													</c:forEach>
												</ul>
											</div>
											<div class="col-6 col-6-xlarge">
												<section id="board_container">
													<p class="text-info"><spring:message code="msg.settingInfoBoard"/></p>
												</section>
											</div>
										</div>

									</div>
								</section>
							</div>
						</div>
					</section>
			</div>
		</div>
	<c:import url="/settings/side"/>
</div>
<c:import url="/settings/bottom"/>
<script>
	// 게시판 클릭시 정보 호출
	$(document).on('click', '.board-item', function (){
		let brd_id = $(this).attr('id').replaceAll('board', '');
		$('#board_container').load('<c:url value="/settings/board-info/'+brd_id+'"/> ');
	});

	function boardCreate(){
		$('#board_container').load('<c:url value="/settings/board-create"/>');
	}

	function boardDelete(brd_id){
		let cf = confirm("정말로 게시판을 삭제하시겠습니까? 관련된 게시물도 모두 삭제처리 됩니다.");
		if(cf){
			location.href = '<c:url value="/settings/board-delete"/>?brd_id='+brd_id;
		}
	}
</script>