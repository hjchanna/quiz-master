<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--start top contents of page-->
<jsp:include page="/WEB-INF/views/import-top.jsp"/>
<!--end top contents of page-->

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
        <div class="box-header with-border">
            <h3 class="box-title">Available Question Papers</h3>

            <div class="pull-right" >
                <a class="btn btn-xs btn-success" href="${pageContext.request.contextPath}/admin/new-question-paper"><i class="fa fa-plus"></i>&nbsp;New Question Paper</a>
            </div>
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
                <c:forEach items="${paperlist}" var="paperlist">
                    <tr>
                        <td>${paperlist.indexNo}</td>
                        <td>${paperlist.description}</td>
                        <td>${paperlist.lastUsedOn}</td>
                        <td class="text-right">
                            <a class="btn btn-success btn-xs" href="${pageContext.request.contextPath}/admin/question-paper/${paperlist.indexNo}">
                                <span class="glyphicon glyphicon-play"></span> View
                            </a>
                        </td>
                    </tr>
                </c:forEach>
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
