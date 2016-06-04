<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!--start top contents of page-->
<jsp:include page="/WEB-INF/views/import-top.jsp"/>
<!--end top contents of page-->

<script type="text/javascript">
    $(document).ready(function () {
        $('#add').click(function () {
            var disc = $('#disc').val();
            if (disc != null) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/admin/save-question-paper",
                    type: 'POST',
                    data: "discription=" + disc,
                    cache: false,
                    success: function (data) {
                        if (data.status == "Success") {
                            alert(data);
                        } else {
                            alert("Error occurs on the Database level!");
                        }
                    },
                    error: function (data) {
                        console.log(data)
                        alert("An error has occured!!!");
                    }
                });
            }
        });
    });
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#update").click(function () {
            var index = $('#indexNo').val();
            var disc = $('#disc').val();
            $.ajax({
                url: "${pageContext.request.contextPath}/admin/update-question-paper",
                type: 'POST',
                data: "indexNo=" + index + "discription=" + disc,
                cache: false,
                success: function (data) {
                    if (data.status == "Success") {
                        alert(data);
                    } else {
                        alert("Error occurs on the Database level!");
                    }
                },
                error: function (data) {
                    console.log(data)
                    alert("An error has occured!!!");
                }
            });

        });
    });

</script>


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
        <div class="box-header with-border"> 
            <label for="description"><h2>Question Paper</h2></label>


            <div class="form-group">
                <div class="input-group">
                    <form:form action=""  modelAttribute="paper">
                        <form:input path="description" id="disc" cssClass="form-control"></form:input>
                        <form:input type="hidden" path="indexNo" id="indexNo" cssClass="form-control"></form:input>
                    </form:form>
                    <div class="input-group-btn">
                        <a id="add" class="btn btn-success"><span  class="glyphicon glyphicon-plus" ></span></a>-->
                        <a id="update" class="btn btn-success"><span class="glyphicon glyphicon-floppy-save"></span></a>
                        <a href="${pageContext.request.contextPath}/admin/question-paper-list" class="btn btn-success"><span class="glyphicon glyphicon-chevron-left"></span></a>
                    </div>
                </div>
            </div>

            <!--            
            <form:form action="${pageContext.request.contextPath}/admin/save-question-paper" method="POST" modelAttribute="paper">
                <div class="input-group ">
                <form:input path="description" id="discrip" cssClass="form-control"></form:input>
                    <div class="input-group-btn">
                        <input type="submit" value="Add" class="btn btn-success"/>
            </form:form>
            <form:form  action="${pageContext.request.contextPath}/admin/update-question-paper" modelAttribute="paper">
                <form:input type="hidden" path="indexNo" cssClass="form-control"></form:input>
                <form:input type="hidden"  path="description" cssClass="form-control"></form:input>
                    <input type="submit" value="save" class="btn btn-success"/>
            </form:form>
            <a href="${pageContext.request.contextPath}/admin/question-paper-list" class="btn btn-success"><span class="glyphicon glyphicon-chevron-left"></span></a>
            <a href="" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span></a>
            <a href="#" class="btn btn-success"><span class="glyphicon glyphicon-floppy-save"></span></a>
        </div>

    </div>-->
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
                                <a class="btn btn-success btn-xs"  href="${pageContext.request.contextPath}/admin/question/${paper.indexNo}/${question.indexNo}">
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
    <%--<jsp:include page="customer-form.js"/>--%>
</script>

<!--start bottom contents of page-->
<jsp:include page="/WEB-INF/views/import-bottom.jsp"/>
<!--end bottom contents of page-->
