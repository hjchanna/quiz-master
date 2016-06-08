<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!--start top contents of page-->
<jsp:include page="/WEB-INF/views/import-top.jsp"/>
<!--end top contents of page-->


<script type='text/javascript'>
    $(window).load(function () {
        $(function () {
            $("#mytable").on("click", ".remove", function () {
                $(this).closest('tr').remove();
            });
        });
        $(function () {
            $(".show_tip").tooltip({
                container: 'body'
            });
        });
        $(document).click(function () {
            $('.tooltip').remove();
            $('[title]').tooltip();
        });
    });
</script>




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
            <div class="col-sm-8">
                <form:form action="${pageContext.request.contextPath}/admin/search-question-paper" modelAttribute="paper">
                    <div class="input-group">
                        <form:input  placeholder="paper name"  class="form-control" path="description"></form:input>
                            <span class="input-group-btn">
                                <input type="submit"  value="search" class="btn btn-primary" />
                            </span>
                    </form:form>
                </div>
            </div>
            <div class="col-lg-2 pull-right">
                <a class="btn btn-success" href="${pageContext.request.contextPath}/admin/new-question-paper"><i class="fa fa-plus"></i>&nbsp;New Question Paper</a>
            </div>
        </div>
        <div class="box-body">
            <!--content-->

            <table class="table table-hover" id="mytable">
                <thead>
                <th>#</th>
                <th>Description</th>
                <th>Last Used On</th>
                <th>Question Count</th>
                <th></th>
                </head>
                <tbody>


                    <%
                        int val = 0;
                    %>

                    <c:forEach items="${paperlist}" var="paperlist">
                        <tr>
                            <td>${paperlist.indexNo}</td>
                            <td>${paperlist.description}</td>
                            <td>${paperlist.lastUsedOn}</td>
                            <c:forEach items="${questionsize}" var="sizes" end="<%=val%>" begin="<%=val%>">
                                <td>${sizes}</td>
                            </c:forEach>


                            <%
                                val++;
                            %>

                            <td class="text-right">
                                <a class="btn btn-success btn-xs" href="${pageContext.request.contextPath}/admin/question-paper/${paperlist.indexNo}">  
                                    <span class="glyphicon glyphicon-play"></span> View
                                </a>
                                <a class="btn btn-danger remove show_tip btn-xs" data-original-title="Delete" href="${pageContext.request.contextPath}/admin/delete-paper/${paperlist.indexNo}">
                                    <span ><i class="fa fa-trash-o"></i></span>
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
