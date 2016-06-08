<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--start top contents of page-->
<jsp:include page="/WEB-INF/views/import-top.jsp"/>
<!--end top contents of page-->

<!--start page content-->
<section class="content-header">
    <h1>
        Start New Quiz Session
        <small>question paper information</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Quiz Master</a></li>
        <li class="active">Start New Quiz Session</li>
    </ol>



</section>

<section class="content">

    <div class="row">
        <div class="col-lg-12" >
            <div class="form-group pull-right">
                <a class="btn btn-success" href="${pageContext.request.contextPath}/master/question-paper-list"><i class="fa fa-backward"></i>&nbsp;Go Back</a>
                <a class="btn btn-success" href="${pageContext.request.contextPath}/master/new-quiz-session/${paper.indexNo}"><i class="glyphicon glyphicon-play"></i>&nbsp;Start</a>
            </div>
        </div>

        <!--start questions-->
        <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-aqua">
                <div class="inner">
                    <h3>10</h3>
                    <p>Question Count</p>
                </div>
                <div class="icon">
                    <i class="glyphicon glyphicon-sort-by-order"></i>
                </div>
                <div class="small-box-footer">
                    &nbsp;
                </div>
            </div>
        </div>
        <!--end questions-->

        <!--start duration-->
        <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-green">
                <div class="inner">
                    <h3>10</h3>
                    <p>Total Duration</p>
                </div>
                <div class="icon">
                    <i class="glyphicon glyphicon-time"></i>
                </div>
                <div class="small-box-footer">
                    &nbsp;
                </div>
            </div>
        </div>
        <!--end duration-->

        <!--start sessions-->
        <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-orange">
                <div class="inner">
                    <h3>10</h3>
                    <p>Quiz Sessions</p>
                </div>
                <div class="icon">
                    <i class="glyphicon glyphicon-send"></i>
                </div>
                <div class="small-box-footer">
                    &nbsp;
                </div>
            </div>
        </div>
        <!--end sessions-->

        <!--average score-->
        <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-red">
                <div class="inner">
                    <h3>75%</h3>
                    <p>Average Score</p>
                </div>
                <div class="icon">
                    <i class="glyphicon glyphicon-check"></i>
                </div>
                <div class="small-box-footer">
                    &nbsp;
                </div>
            </div>
        </div>
        <!--end average score-->

        <div class="col-lg-6">
            <div class="box box-success">
                <div class="box-header">
                    <h3 class="box-title">Recent Quiz Sessions</h3>
                </div>

                <div class="box-body">
                    <table class="table table-condensed">
                        <tbody>
                            <tr>
                                <th>Location</th>
                                <th>Date</th>
                                <th>Status</th>
                            </tr>

                            <tr>
                                <td>Kandy</td>
                                <td>20th Jan 2015</td>
                                <td><span class="badge bg-green">COMPLETED</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>


        <div class="col-lg-6">
            <div class="box box-success">
                <div class="box-header">
                    <h3 class="box-title">Question Information</h3>
                </div>

                <div class="box-body" id="item-list">
                    <!--content-->
                    <table class="table table-hover">
                        <tbody>
                            <tr>
                                <th style="width: 10px">#</th>
                                <th>Question</th>
                                <th>Quality</th>
                            </tr>

                            <c:forEach items="${questionlist}" var="question">                    
                                <tr>
                                    <td>${question.indexNo}</td>
                                    <td>${question.questionEn}</td>

                                    <td>
                                        <div class="progress progress-xs">
                                            <div class="progress-bar progress-bar-danger" style="width: 55%"></div>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
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
