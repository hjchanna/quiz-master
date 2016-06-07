<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!--start top contents of page-->
<jsp:include page="/WEB-INF/views/import-top.jsp"/>
<!--end top contents of page-->

<script type="text/javascript">
    $(document).ready(function () {
        $('#save').click(function () {
            var disc = $('#disc').val();
            var indexNo = $('#indexNo').val();
            if (disc != null) {
                if (null == indexNo || "" == indexNo) {

                    $.ajax({
                        url: "${pageContext.request.contextPath}/admin/save-question-paper",
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
                        url: "${pageContext.request.contextPath}/admin/update-question-paper",
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
        });
        $('#searchText').keyup(function () {
            $.ajax({
                url: "${pageContext.request.contextPath}/admin/update-question-paper",
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
            <label for="description"><h3>Question Paper</h3></label>
            <a class="btn btn-success pull-right" href="${pageContext.request.contextPath}/admin/new-question/${paper.indexNo}"><span class="fa fa-plus"></span>&nbsp;Question</a>

            <div class="form-group">
                <div class="input-group">
                    <form:form action=""  modelAttribute="paper">
                        <form:input path="description" id="disc" cssClass="form-control"></form:input>
                        <form:input type="hidden" path="indexNo" id="indexNo" name="indexNo" cssClass="form-control"></form:input>
                    </form:form>
                    <div class="input-group-btn">
                        <!--<a id="add" class="btn btn-success"><span  class="glyphicon glyphicon-plus" ></span></a>-->-->
                        <a id="save" class="btn btn-success"><span class="glyphicon glyphicon-floppy-save"></span></a>
                        <a href="${pageContext.request.contextPath}/admin/question-paper-list" class="btn btn-success"><span class="glyphicon glyphicon-chevron-left"></span></a>
                    </div>
                </div>
            </div>
            <c:if test="${not empty questionlist }">

                <div class="form-group ">
                    <div class="input-group col-lg-6">           
                        <input  id="searchText" class="form-control" placeholder="question name "/>
                        <div class="input-group-btn">
                            <a id="save" class="btn btn-primary" ><span class="glyphicon glyphicon-search"></span></a>
                        </div>
                    </div>
                </div>
            </c:if>

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
            <c:if test="${not empty questionlist }">

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
                                    <a class="btn btn-danger btn-xs" href="#">
                                        <span class="glyphicon glyphicon-trash"></span> 
                                    </a>
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
