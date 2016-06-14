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
        <div class="login-box" style="margin-top: 2%;">
            <div class="login-logo">
                <div>
                    <img src="${pageContext.request.contextPath}/resources/image/dilmah-logo.jpg" width="88px" height="66px"/>
                </div>
                <b>Quiz</b>Master
            </div><!-- /.login-logo -->
            <div class="login-box-body">
                <p class="login-box-msg">Enter your identity information</p>
                
                <form:form action="${pageContext.request.contextPath}/user/quiz-session-save-user" method="post" modelAttribute="quizSessionUser">
                    <div class="form-group has-feedback">
                        <form:input type="text" class="form-control" placeholder="Name" path="name"/>
                        <span class="glyphicon glyphicon-user form-control-feedback"></span>
                    </div>
                    
                    <div class="form-group has-feedback">
                        <form:input type="text" class="form-control" placeholder="Identity Card Number" path="nicNo"/>
                        <span class="glyphicon glyphicon-certificate form-control-feedback"></span>
                    </div>
                    
                    <div class="form-group has-feedback">
                        <form:input type="text" class="form-control" placeholder="Telephone" path="mobileNo"/>
                        <span class="glyphicon glyphicon-phone form-control-feedback"></span>
                    </div>
                    
                    <div class="row">
                        <div class="col-xs-12 form-group">
                            <form:button type="submit" class="btn btn-success btn-block btn-flat">Register</form:button>
                        </div>
                        
                        <div class="col-xs-12 form-group">
                            <a class="btn btn-primary btn-block btn-flat" href="${pageContext.request.contextPath}/">Home</a>
                        </div>
                        
                        <div class="col-xs-12 form-group">
                            <a class="btn btn-warning btn-block btn-flat" href="${pageContext.request.contextPath}/user/quiz-session-finish">Finish Session</a>
                        </div>
                    </div>
                </form:form>
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