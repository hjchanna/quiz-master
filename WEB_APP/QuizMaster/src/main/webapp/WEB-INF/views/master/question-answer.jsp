<%-- 
    Document   : question-answer
    Created on : Jun 17, 2016, 3:44:30 PM
    Author     : KAZA
--%>

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
        User Answer
        <small>select user</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Quiz Master</a></li>
        <li class="active">User Result</li>
    </ol>
</section>

<section class="content">
    <!--start item basic information-->
    <div class="col-lg-12 form-group" >
        <div class="form-group pull-right">
            <a class="btn btn-success" href="${pageContext.request.contextPath}/master/question-paper-list"><i class="fa fa-backward"></i>&nbsp;Go Back</a>
            <a class="btn btn-success " href="${pageContext.request.contextPath}/master/new-quiz-session/${paper.indexNo}"><i class="glyphicon glyphicon-play"></i>&nbsp;finish</a>
        </div>

    </div>
    <div class="box box-primary">

        <div class="box-body  no-padding" id="item-list">
            <!--content-->
            <table class="table table-hover">
                <thead>

                <th>#</th>
                <th>User Name</th>
                <th>correct Answer</th>
                <th>Total Duration</th>
                <th></th>

                </head>

                <tbody>
                    <%--<c:forEach items="${userList}" var="user" varStatus="count">--%>                    
                    <tr>
                        <td>${count.count}</td>
                        <td>name</td>
                        <td>15/15</td>
                        <td>12.54/sec.</td>
                        <td class="text-right ">
                            <input type="checkbox" name="" value="ON" />
                        </td>
                    </tr>
                    <%--</c:forEach>--%>
                </tbody>

            </table>

        </div>
    </div>

</section>
<!--end page content-->

<script>
    <%--<jsp:include page="customer-form.js"/>--%>
</script>
<!--start bottom contents of page-->
<jsp:include page="/WEB-INF/views/import-bottom.jsp"/>
<!--end bottom contents of page-->
