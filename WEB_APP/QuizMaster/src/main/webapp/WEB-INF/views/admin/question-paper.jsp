<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!--start top contents of page-->
<jsp:include page="/WEB-INF/views/import-top.jsp"/>
<!--end top contents of page-->

<script type="text/javascript">
    /*$(document).ready(function () {
     $('#save').click(function () {
     var disc = $('#disc').val();
     var indexNo = $('#indexNo').val();
     if (disc != null) {
     if (null == indexNo || "" == indexNo) {
     
     $.ajax({
     url: "{pageContext.request.contextPath}/admin/save-question-paper",
     type: 'POST',
     data: "discription=" + disc,
     cache: false,
     success: function (data) {
     alert(data + " added Successfully..");
     },
     error: function (data) {
     console.log(data);
     alert("An error has occured!!!");
     }
     });
     } else {
     alert('getValue' + indexNo + '  ' + disc);
     $.ajax({
     url: "{pageContext.request.contextPath}/admin/update-question-paper",
     type: 'POST',
     data: "indexNo=" + indexNo + "&disc=" + disc,
     cache: false,
     success: function (data) {
     alert(data + " Update Successfully..");
     },
     error: function (data) {
     console.log(data)
     alert("An error has occured!!!");
     }
     });
     }
     } else {
     alert("Paper Description is empty...");
     
     }
     });*/


</script>


<!--start page content-->
<section class="content-header">
    <h1>
        Question Paper
        <small>manage question papers</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Administration</a></li>
        <li class="active">Question Papers</li>
        <li class="active">${paper.description}</li>
    </ol>
</section>

<section class="content">
    <!--start item basic information-->
    <div class="box box-primary">
        <div class="box-header with-border">

            <div class="col-lg-9">
                <c:if test="${!paper.questions.isEmpty()}">
                    <form action="${pageContext.request.contextPath}/admin/question-paper/${paper.indexNo}">
                        <div class="input-group">           
                            <input name="keyword" id="searchText" class="form-control" placeholder="Question"/>
                            <div class="input-group-btn">
                                <button id="save" class="btn btn-success" ><span class="glyphicon glyphicon-search"></span></button>
                            </div>
                        </div>
                    </form>
                </c:if>
            </div>

            <form:form modelAttribute="paper" action="${pageContext.request.contextPath}/admin/save-question-paper">
                <div class="col-lg-3 pull-right">
                    <button class="btn btn-success"  type="submit" value="save" ><span class="fa fa-save"></span>&nbsp;Save</button>
                    <a class="btn btn-success" href="${pageContext.request.contextPath}/admin/new-question/${paper.indexNo}"><span class="fa fa-plus"></span>&nbsp;Question</a>
                    <a href="${pageContext.request.contextPath}/admin/question-paper-list" class="btn btn-success show_tip" data-original-title="back" ><span class="glyphicon glyphicon-chevron-left"></span>&nbsp;Back</a>
                </div>
            </div>

            <div class="box-body">
                <div class="col-lg-9">
                    <!--<label class="pull-left" for="description"><h3>Question Paper</h3></label>-->
                    <form:input path="description" type="text" cssClass="form-control"/>
                    <form:input path="indexNo" type="hidden" id="indexNo" name="indexNo" cssClass="form-control"/>
                </div>
                <div class="col-lg-3 pull-right">
                    <form:input path="durationPerQuestion" type="number" cssClass="form-control"/>
                </div>
            </form:form>

            <c:if test="${!paper.questions.isEmpty()}">
                <table class="table table-hover " id="tableQuestion">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Question (EN)</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <!--jsp loop-->
                        <c:forEach items="${paper.questions}" var="question">
                            <tr>
                                <td>${question.indexNo}</td>
                                <td>${question.questionEn}</td>
                                <td class="text-right">
                                    <a class="btn btn-success btn-xs"  href="${pageContext.request.contextPath}/admin/question/${paper.indexNo}/${question.indexNo}">
                                        <span class="glyphicon glyphicon-edit"></span> Edit
                                    </a>
                                    <c:choose>
                                        <c:when test="${question.active}">
                                            <a class="btn btn-success btn-xs" href="${pageContext.request.contextPath}/admin/toggle-enability-question/${paper.indexNo}/${question.indexNo}">
                                                <span ><i class="glyphicon glyphicon-eye-open"></i> Activated</span>
                                            </a> 
                                        </c:when>
                                        <c:otherwise>
                                            <a class="btn btn-danger btn-xs" href="${pageContext.request.contextPath}/admin/toggle-enability-question/${paper.indexNo}/${question.indexNo}">
                                                <span ><i class="glyphicon glyphicon-eye-close"></i> Deactivated</span>
                                            </a> 
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                        <!--end jsp loop-->
                    </tbody>
                </table>
            </c:if>
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
