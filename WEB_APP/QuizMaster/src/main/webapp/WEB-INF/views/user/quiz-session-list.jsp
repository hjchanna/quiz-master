<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Quiz Master</title>

        <!-- Bootstrap 3.3.5 -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/theme/css/AdminLTE.min.css">
        <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/theme/css/skins/_all-skins.min.css">
        <!--jquery ui css-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.min.css">

        <!--        <style>
                    .control-button{
                        right: 0px;
                        top: 10%;
                        position: absolute;
                    }
                </style>-->
    </head>

    <body class="hold-transition">
        <div class="row">
            <div class="col-sm-8 col-sm-offset-2" style="margin-top: 2%;">
                <div class="login-logo">
                    <div>
                        <img src="${pageContext.request.contextPath}/resources/image/logo.png" width="250px" height="120px"/>
                    </div>

                    <div>
                        &nbsp;<b>Quiz</b>Master

                        <div class="pull-right">
                            <h2><label id="second"></label></h2>
                        </div>
                    </div>
                </div>
                <div class="box box-default">
                    <div class="box-header">
                        <div class="col-xs-12">
                            <h3>Select Your Location</h3>
                        </div>
                    </div>

                    <div class="box-body">
                        <table class="table table-hover">
                            <thead>
                            <th>#</th>
                            <th>Location</th>
                            <th></th>
                            </head>

                            <tbody>
                                <c:forEach items="${quizsessionlist}" var="quizsessions" varStatus="counter">   
                                    <c:if test="${quizsessions.status=='ON_GOING'}">
                                        <tr>
                                            <td>${counter.count}</td>
                                            <td>${quizsessions.location}</td>
                                            <td class="text-right">
                                                <a class="btn btn-success btn-xs" href="${pageContext.request.contextPath}/user/quiz-session-new-user/${quizsessions.indexNo}">
                                                    <span class="glyphicon glyphicon-play"></span> Start
                                                </a>
                                            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </tbody>

                        </table>
                    </div>


                </div>
            </div>

        </div>

        <!--start js import-->

        <!-- jQuery 2.1.4 -->
        <script src="${pageContext.request.contextPath}/resources/jquery/jQuery-2.1.4.min.js"></script>
        <!-- jQuery UI 1.11.4 -->
        <script src="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.min.js"></script>
        <!-- jQuery Toaster -->
        <script src="${pageContext.request.contextPath}/resources/jquery-toaster/jquery.toaster.js"></script>
        <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
        <script>
            $.widget.bridge('uibutton', $.ui.button);
        </script>
        <!-- Bootstrap 3.3.5 -->
        <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
        <!-- AdminLTE App -->
        <script src="${pageContext.request.contextPath}/resources/theme/js/app.min.js"></script>

    </body>
</html>