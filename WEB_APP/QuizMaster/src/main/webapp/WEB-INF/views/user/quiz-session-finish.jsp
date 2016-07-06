<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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

        <style>
            .result-status{
                color: red;
            }
        </style>

    </head>

    <body class="hold-transition login-page">
        <div class="row">
            <div  class="col-sm-8 col-sm-offset-2" style="margin-top: 7%;">
                <div id="result" class="login-logo">
                    <div>
                        <img src="${pageContext.request.contextPath}/resources/image/dilmah-logo.jpg" width="88px" height="66px"/>
                    </div>
                    <b>Quiz</b>Master
                    <br/>
                    Result Sheet
                    <!--                    <div class="pull-right">
                                            <h2><label id="second"></label></h2>
                                        </div>-->
                    <br/>

                    <c:if test="${won}">
                        <b class="result-status">Congratulations ${sessionScope.quizuser.name}</b>
                        <embed src="${pageContext.request.contextPath}/resources/audio/win.wav" autostart=false loop=true style="height: 1px; width: 1px;">
                    </c:if>
                    <c:if test="${!won}">
                        <b  class="result-status">Try Again On Another Day</b>
                    </c:if>
                </div>
                <div class="box box-default">
                    <div class="box-header">
                        <h3>


                            <div class="col-xs-4 text-center">
                                <div class="col-lg-12">
                                    Correct Answers
                                </div>
                                <div class="col-lg-12 text-green">
                                    <b>${correctAnswers}/${totalAnswers}</b>
                                </div>
                            </div>

                            <div class="col-xs-4 text-center">
                                <div class="col-lg-12">
                                    Correct Percentage
                                </div>
                                <div class="col-lg-12 text-green">
                                    <b>${correctPercent}%</b>
                                </div>
                            </div>

                            <div class="col-xs-4 text-center">
                                <div class="col-lg-12">
                                    Total duration (sec.)
                                </div>
                                <div class="col-lg-12 text-green">
                                    <b>${totalDuration}</b>
                                </div>
                            </div>
                        </h3>

                    </div>

                    <div class="box-body">
                        <div class="col-xs-4 col-xs-offset-4" >
                            <a type="button" class="btn btn-success btn-block btn-lg" href="${pageContext.request.contextPath}/user/quiz-clear">Finish</a>
                        </div>
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

        <c:if test="${won}">

            <script src="${pageContext.request.contextPath}/resources/fireworks/jquery.fireworks.js"></script>
            <script>
            $("#result").fireworks();
            </script>
        </c:if>

    </body>
</html>