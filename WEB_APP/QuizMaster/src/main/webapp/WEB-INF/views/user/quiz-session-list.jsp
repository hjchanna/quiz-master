<%@page import="com.sv.quiz_master.admin.model.QuestionPaper"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!--start top contents of page-->
<jsp:include page="/WEB-INF/views/import-top.jsp"/>
<!--end top contents of page-->
<%
    //date format to format dates
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
%>

<!--start page content-->
<section class="content-header">
    <h1>
        Question Paper List
        <small>manage question papers</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Administration</a></li>
        <li class="active">Question Papers</li>
    </ol>
</section>

<section class="content">
    <!--start item basic information-->
    <div class="box box-primary">
        <div class="box-body">
            <!--content-->

            <table class="table table-hover" id="mytable">
                <thead>
                <th>#</th>
                <th>Location</th>
                <th>Started On</th>
                <th>Finished On</th>
                <th></th>
                </head>
                <tbody>


                    <c:forEach items="${quizSessions}" var="session">
                        <tr>
                            <td>${session.indexNo}</td>
                            <td>${session.location}</td>
                            <td>${session.startedOn}</td>
                            <td>${session.finishedOn}</td>

                            <td class="text-right">
                                <a class="btn btn-success btn-xs" href="${pageContext.request.contextPath}/user/quiz-session-user-list/${session.indexNo}">  
                                    <span class="glyphicon glyphicon-play"></span> View
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

<!--start bottom contents of page-->
<jsp:include page="/WEB-INF/views/import-bottom.jsp"/>
<!--end bottom contents of page-->
