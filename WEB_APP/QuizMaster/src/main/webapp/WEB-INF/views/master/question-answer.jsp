<%-- 
    Document   : question-answer
    Created on : Jun 17, 2016, 3:44:30 PM
    Author     : KAZA
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.Integer"%>
<%-- 
    Document   : user-list
    Created on : Jun 16, 2016, 11:42:24 AM
    Author     : KAZA
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    <ol class="breadcrumb pull-right">
        <li><a href="#"><i class="fa fa-dashboard"></i> Quiz Master</a></li>
        <li class="active">User Result</li>
    </ol>
    <div class="pull-right">
        <!--<a class="btn btn-success" href="${pageContext.request.contextPath}/master/question-paper-list"><i class="fa fa-backward"></i>&nbsp;Go Back</a>-->
        <a class="btn btn-success " href="#"><i class="glyphicon glyphicon-king"></i>&nbsp;Select</a>
    </div>

</section>
<br>
<section class="content">
    <!--start item basic information-->
    <div>

    </div>
    <div></div>
    <div class="box box-body box-primary">

        <div class="box-body  no-padding" id="item-list">
            <!--content-->
            <%
                int i = 0;

            %>
            <table class="table table-hover">
                <thead>

                <th>#</th>
                <th>User Name</th>
                <th>correct Answer</th>
                <th>correct percentage</th>
                <th>Total Duration</th>
                <th>Select</th>

                </head>

                <tbody>
                    <c:forEach items="${userList}" var="user" varStatus="counter">                    
                        <tr>
                            <td>${counter.count}</td>
                            <td>${user.name}</td>
                            <td>${(correctList[counter.count-1])} / ${QuestionCount.questions.size()}</td>
                            <td>
                                <fmt:formatNumber type="number" 
                                                  maxFractionDigits="2" value="${((correctList[counter.count-1])/QuestionCount.questions.size())*100}" />
                                %
                            </td>
                            <td>

                                <%                                    
                                    ArrayList<Integer> duration = (ArrayList<Integer>) request.getAttribute("duration");
                                    Integer total = duration.get(i);
                                    Integer min = (Math.abs(total / 60));
                                    Integer sec = (total % 60);
                                    if (min != 0) {
                                        out.println(min + ":" + String.format("%02d", sec) + "/min.");
                                    } else {
                                        out.println(String.format("%02d", sec) + "/min.");
                                    }
                                    i++;
                                %>
                            </td>
                            <td>
                                <input type="checkbox" name="" value="ON" />
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
