<%-- 
    Document   : quiz-session-finish
    Created on : Jun 20, 2016, 4:42:14 AM
    Author     : KAZA
--%>
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
                        <img src="${pageContext.request.contextPath}/resources/image/logo.png" width="100px" height="66px"/>
                    </div>

                    <div>
                        <b>Quiz</b>Master
                    </div>
                </div>
                <div class="box box-default">
                    

                    <div class="box-body">
                        <div class="container-fluid">

                            <div class="row">
                                <div class="col-lg-12 form-group">

                                    <label for="description"><h2>Result sheet</h2></label>
                                    <!--<h4 class="text-success">Congratulation.. You have Selected for Winner</h4>-->
                                    <div class="text-right">
                                        <a href="${pageContext.request.contextPath}/user/quiz-clear" class="btn btn-success btn-sm"><span class="glyphicon glyphicon-queen"></span>&nbsp;Finish</a>
                                    </div>
                                    <table class="table">
                                        <tr>
                                            <td>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <label class="text-muted">correct Answer</label>
                                                        <p class="h4 text-success">${correctAnswers}/${totalAnswers}</p>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <label class="text-muted">correct percentage</label>
                                                        <p class="h4 text-success">${correctPercent}%</p>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="text-right">
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <label class="text-muted">Total Time</label>
                                                        <p class="h4 text-success">${totalDuration}/sec.</p>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>

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

    </body>
</html>