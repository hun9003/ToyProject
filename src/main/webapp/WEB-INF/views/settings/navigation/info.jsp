<%--
  Created by IntelliJ IDEA.
  User: HOME
  Date: 2021-05-04
  Time: 오후 3:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
  <c:when test="${menu.men_parent != null}">
    <c:set var="menuTitle" value="메뉴"/>
  </c:when>
  <c:otherwise>
    <c:set var="menuTitle" value="메뉴 그룹"/>
  </c:otherwise>
</c:choose>
<h3 class="text-info">${menuTitle} 수정</h3>
<hr>
<form action="<c:url value="/settings/menu-info/${menu.men_id}"/> " method="POST">
  <div class="row gtr-uniform">
    <div class="col-9 col-12-xsmall">
      <label for="men_name">${menuTitle} 이름</label>
      <input type="text" name="men_name" id="men_name" value="${menu.men_name}">
    </div>
    <c:if test="${menu.men_parent != null}">
    <div class="col-9 col-12-xsmall">
      <label for="men_link">${menuTitle} 링크</label>
      <input type="text" name="men_link" id="men_link" value="${menu.men_link}">
    </div>
    <div class="col-9 col-12-xsmall">
      <input type="checkbox" id="men_target" name="men_target" value="_blank" <c:if test="${menu.men_target eq '_blank'}">checked</c:if>>
      <label for="men_target">새창으로 열기</label>
    </div>
    </c:if>
    <div class="col-9 col-12-xsmall">
      <input type="checkbox" id="men_desktop" name="men_desktop" value="1" <c:if test="${menu.men_desktop == 1}">checked</c:if>>
      <label for="men_desktop">데스크탑화면 숨기기</label>
    </div>
    <div class="col-9 col-12-xsmall">
      <input type="checkbox" id="men_mobile" name="men_mobile" value="1" <c:if test="${menu.men_mobile == 1}">checked</c:if>>
      <label for="men_mobile">모바일화면에서 숨기기</label>
    </div>
    <div class="col-12 col-12-medium">
      <input type="submit" style="width: 100%;" value="수정하기" class="primary">
    </div>
  </div>

  </form>


