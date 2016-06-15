<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${sessionScope.user==null}">
    <c:redirect url="security/login"/>
</c:if>

<!--start top contents of page-->
<jsp:include page="/WEB-INF/views/import-top.jsp"/>
<!--end top contents of page-->

<!--start page content-->


<section class="content">
    <div class="jumbotron text-center text-green panel panel-success">
        <h1>Quiz Master</h1>
        <p>Online Quiz Management System</p>
    </div>

</section>
<!--end page content-->

<!--start bottom contents of page-->
<jsp:include page="/WEB-INF/views/import-bottom.jsp"/>
<!--end bottom contents of page-->
