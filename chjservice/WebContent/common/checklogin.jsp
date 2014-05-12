<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="url_interface" value="http://222.66.234.51/chjinterface/"/>
<c:set var="imageStorePath" value="http://222.66.234.51/chjservice/common!findPicture.action?path="/>
<c:choose>
	<c:when test="${user == null}">
	
		<script>
	if(top !=null)
		top.location.href="<%= request.getContextPath()%>";
	else
		location.href = "<%= request.getContextPath()%>";
		</script>
	</c:when>
</c:choose>