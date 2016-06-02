<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--start top contents of page-->
<jsp:include page="/WEB-INF/views/import-top.jsp"/>
<!--end top contents of page-->

<!--start page content-->
<section class="content-header">
    <h1>
        Question Paper
        <small>manage question papers</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Control Panel</a></li>
        <li class="active">Customer Control Panel</li>
    </ol>
</section>

<section class="content">
    <!--start item basic information-->
    <div class="box box-primary">
        <div class="box-header">
            <div class="col-lg-6">
                <label for="description"><h3 class="box-title">Question Paper</h3></label> 
                <input type="text" value="${paper.description}" class="form-control" id="description" aria-label="...">
            </div>

            <div class="col-lg-6">
                <div class="pull-right">
                    <h3 class="box-title">&nbsp;</h3>
                    <a href="#" class="btn btn-success"><span class="glyphicon glyphicon-floppy-save"></span> Save Changes</a>
                    <a href="#" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span> Add New Question</a>
                    <a href="#" class="btn btn-success"><span class="glyphicon glyphicon-chevron-left"></span> Back</a>
                </div>
            </div>
        </div>

        <div class="box-body">
            <table class="table table-hover ">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Question (EN)</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <!--jsp loop-->
                    <c:forEach items="${questionlist}" var="question">
                        <tr>
                            <td>${question.indexNo}</td>
                            <td>${question.questionEn}</td>
                            <td class="text-right">
                                <a class="btn btn-success btn-xs" href="<c:url value="/question/${paper.indexNo}/${questionlist.indexNo}" />">
                                    <span class="glyphicon glyphicon-edit"></span> Edit
                                </a>
                                <a class="btn btn-success btn-xs" href="#">
                                    <span class="glyphicon glyphicon-eye-close"></span> Disable
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    <!--end jsp loop-->
                </tbody>
            </table>
        </div>
    </div>

</section>
<!--end page content-->

<script>
    <jsp:include page="customer-form.js"/>
</script>

<!--start bottom contents of page-->
<jsp:include page="/WEB-INF/views/import-bottom.jsp"/>
<!--end bottom contents of page-->
