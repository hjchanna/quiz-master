<%-- 
    Document   : user-list
    Created on : Jun 16, 2016, 11:42:24 AM
    Author     : KAZA
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<!--start top contents of page-->
<jsp:include page="/WEB-INF/views/import-top.jsp"/>
<!--end top contents of page-->

<!--start page content-->
<section class="content-header">
    <h1>
        Connecting User
        <!--<small>manage question papers</small>-->
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Quiz Master</a></li>
        <li class="active">User List</li>
    </ol>
</section>

<section class="content">
    <!--start item basic information-->
    <div class="text-right">
        <a class="btn btn-success btn-sm" href="${pageContext.request.contextPath}/master/quiz-session-question">
            <span class="glyphicon glyphicon-play"></span> Start
        </a>
    </div>
    <div class="box box-primary">
        <!--        <div class="box-header with-border">
                    <h3 class="box-title">Available Question Papers</h3>
                </div>-->

        <div class="box-body  no-padding" id="item-list">
            <!--content-->
            <table class="table table-hover">
                <thead>
                <th>#</th>
                <th>User Name</th>
                
                <th></th>
                </head>

                <tbody>
                    <c:forEach items="${userList}" var="user" varStatus="count">                    
                        <tr>
                            <td>${count.count}</td>
                            <td>${user.name}</td>
                           
                            <td class="text-right ">
                                <a class="label label-success" href="#">
                                    <span class="glyphicon glyphicon-ok"></span> <b>Connected</b>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>

            </table>

        </div>
    </div>

</section>
<!--end page content-->

<script>
    <%--<jsp:include page="customer-form.js"/>--%>
</script>
<script>
    $(document).ready(function () {
        setInterval(function () {
            cache_clear();
        }, 5000);
    });
    function cache_clear()
    {
        window.location.reload(true);
    }
</script>
<!--start bottom contents of page-->
<jsp:include page="/WEB-INF/views/import-bottom.jsp"/>
<!--end bottom contents of page-->
