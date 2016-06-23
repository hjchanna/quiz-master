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


    </head>

    <body class="hold-transition login-page">
        <div class="row">
            <div class="col-sm-8 col-sm-offset-2" style="margin-top: 2%;">
                <div class="login-logo">
                    <div>
                        <img src="${pageContext.request.contextPath}/resources/image/dilmah-logo.jpg" width="88px" height="66px"/>
                    </div>

                    <div>
                        <b>Quiz</b>Master

                        <div class="pull-right">
                            <h2><label id="second"></label></h2>
                        </div>
                    </div>
                </div>
                <div class="box box-default">
                    <div class="box-header">
                        <div class="col-xs-12">
                            <c:choose>
                                <c:when test="${language=='English'}">
                                    <h3>${sessionScope.question.questionEn}</h3>
                                </c:when> 
                                <c:when test="${language=='Sinhala'}">
                                    <h3>${sessionScope.question.questionSi}</h3>
                                </c:when>
                                <c:otherwise>
                                    <h3>${sessionScope.question.questionTa}</h3>
                                </c:otherwise>
                            </c:choose>

                        </div>
                    </div>

                    <div class="box-body">

                        <div class="col-xs-6 form-group">
                            <a type="button" class="btn btn-success btn-block btn-lg" onclick="answer('A');">
                                <div class="text-left">   
                                    <c:choose>
                                        <c:when test="${language=='English'}">
                                            <b>A.</b> ${sessionScope.question.answerAEn}
                                        </c:when>
                                        <c:when test="${language=='Sinhala'}">
                                            <b>A.</b> ${sessionScope.question.answerASi}
                                        </c:when>
                                        <c:otherwise>
                                            <b>A.</b> ${sessionScope.question.answerATa}
                                        </c:otherwise>
                                    </c:choose>

                                </div>
                            </a>
                        </div>
                        <div class="col-xs-6 form-group">
                            <a type="button" class="btn btn-success btn-block btn-lg" onclick="answer('B');">
                                <div class="text-left">
                                    <c:choose>
                                        <c:when test="${language=='English'}">
                                            <b>B.</b> ${sessionScope.question.answerAEn}
                                        </c:when>
                                        <c:when test="${language=='Sinhala'}">
                                            <b>B.</b> ${sessionScope.question.answerASi}
                                        </c:when>
                                        <c:otherwise>
                                            <b>B.</b> ${sessionScope.question.answerATa}
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </a>
                        </div>
                        <div class="col-xs-6 form-group">
                            <a type="button" class="btn btn-success btn-block btn-lg" onclick="answer('C');">
                                <div class="text-left">
                                    <c:choose>
                                        <c:when test="${language=='English'}">
                                            <b>C.</b> ${sessionScope.question.answerAEn}
                                        </c:when>
                                        <c:when test="${language=='Sinhala'}">
                                            <b>C.</b> ${sessionScope.question.answerASi}
                                        </c:when>
                                        <c:otherwise>
                                            <b>C.</b> ${sessionScope.question.answerATa}
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </a>
                        </div>
                        <div class="col-xs-6 form-group">
                            <a type="button" class="btn btn-success btn-block btn-lg" onclick="answer('D');">
                                <div class="text-left">
                                    <c:choose>
                                        <c:when test="${language=='English'}">
                                            <b>D.</b> ${sessionScope.question.answerAEn}
                                        </c:when>
                                        <c:when test="${language=='Sinhala'}">
                                            <b>D.</b> ${sessionScope.question.answerASi}
                                        </c:when>
                                        <c:otherwise>
                                            <b>D.</b> ${sessionScope.question.answerATa}
                                        </c:otherwise>
                                    </c:choose>

                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="box-footer">
                        <div class="col-xs-12">
                            <div class="pull-right">
                                <a type="button" class="btn btn-success" onclick="skipQuestion();">Skip</a>
                            </div>
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

        <script>
                                    var duration = ${sessionScope.questionpaper.durationPerQuestion};
                                    var baseUrl = '${pageContext.request.contextPath}' + "/user";

                                    var seconds = 0;
                                    var timer = setInterval(timeStep, 1000);

                                    function timeStep() {
                                        if (seconds >= duration) {
                                            skipQuestion();
                                            return;
                                        }

                                        seconds++;

                                        $('#second').text(seconds + " s");
                                        console.log(seconds);
                                    }

                                    function answer(ans) {
                                        var url = baseUrl + "/quiz-session-answer/" + ans + "/" + seconds;
                                        document.location = url;
                                    }

                                    function skipQuestion() {
                                        var url = baseUrl + "/quiz-session-skip/" + seconds;
                                        document.location = url;
                                    }
        </script>

    </body>
</html>