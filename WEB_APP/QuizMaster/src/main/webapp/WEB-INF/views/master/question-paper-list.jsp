<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--start top contents of page-->
<jsp:include page="/WEB-INF/views/import-top.jsp"/>
<!--end top contents of page-->

<!--start page content-->
<section class="content-header">
    <h1>
        Start New Quiz Session
        <small>manage question papers</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Quiz Master</a></li>
        <li class="active">Start New Quiz Session</li>
    </ol>
</section>

<section class="content">
    <!--start item basic information-->
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">Available Question Papers</h3>
        </div>

        <div class="box-body  no-padding" id="item-list">
            <!--content-->
            <table class="table table-hover">
                <thead>
                <th>#</th>
                <th>Description</th>
                <th>Last Used On</th>
                <th></th>
                </head>

                <tbody>
                    <c:forEach items="${paperlist}" var="paper">                    
                        <tr>
                            <td>${paper.indexNo}</td>
                            <td>${paper.description}</td>
                            <td>${paper.lastUsedOn}</td>
                            <td class="text-right">
                                <a class="btn btn-success btn-xs" href="${pageContext.request.contextPath}/master/question-paper/${paper.indexNo}">
                                    <span class="glyphicon glyphicon-play"></span> Start
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
