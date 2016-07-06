<%@page import="com.sv.quiz_master.user.model.QuizSession"%>
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
        Quiz Session Result Sheet
        <small>view results</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Reports</a></li>
        <li class="active">Quiz session result</li>
        <li class="active">${quizSession.location}</li>
    </ol>
</section>

<section class="content">
    <!--start item basic information-->
    <div class="box box-primary">
        <div class="box-header with-border">
            <b>Quiz Session at ${quizSession.location}, on  ${quizSession.startedOn}
            </b>
            <div class="col-lg-2 pull-right">
                <a class="btn btn-success" href="${pageContext.request.contextPath}/user/quiz-session-list"><i class="fa fa-backward"></i>&nbsp;Go Back</a>
            </div>
        </div>

        <div class="box-body">
            <!--content-->

            <table class="table table-hover" id="mytable">
                <thead>
                <th>#</th>
                <th>Name</th>
                <th>NIC No.</th>
                <th>Mobile No.</th>
                <th></th>
                </head>
                <tbody>


                    <c:forEach items="${quizSessionUsers}" var="user">
                        <tr>
                            <td>${user.indexNo}</td>
                            <td>${user.name}</td>
                            <td>${user.nicNo}</td>
                            <td>${user.mobileNo}</td>
                            <td>
                                <c:if test="${user.winner}">
                                    <div class="btn btn-sm btn-success">


                                        WINNER
                                    </div>
                                </c:if>

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
