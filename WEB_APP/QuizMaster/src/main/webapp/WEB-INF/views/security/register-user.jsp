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
            .control-button{
                right: 0px;
                top: 10%;
                position: absolute;
            }
        </style>
    </head>

    <body class="hold-transition login-page">
        <div class="control-button">
            <a class="btn btn-default" href="${pageContext.request.contextPath}/security/logout-user">
                <span class="fa fa-home"></span>
            </a>
        </div>
        <div class="login-box" style="margin-top: 2%;">
            <div class="login-logo">
                <div>
                    <img src="${pageContext.request.contextPath}/resources/image/dilmah-logo.jpg" width="88px" height="66px"/>
                </div>
                <b>Quiz</b>Master
            </div><!-- /.login-logo -->
            <div class="login-box-body">
                <p class="login-box-msg">Enter your identity information</p>

                <form:form action="${pageContext.request.contextPath}/security/save-security-user" method="post" modelAttribute="user">
                    <div class="form-group has-feedback">
                        <form:input type="text" class="form-control" placeholder="Name" path="name"/>
                        <span class="glyphicon glyphicon-user form-control-feedback"></span>
                    </div>

                    <div class="form-group has-feedback">
                        <form:input type="password" class="form-control" placeholder="Password" path="password"/>
                        <span class="glyphicon glyphicon-certificate form-control-feedback"></span>
                    </div>

                    <div class="form-group has-feedback">
                        <form:select path="type" cssClass="form-control">     
                            <form:option value="ADMIN" label="Admin"/>
                            <form:option value="QUIZ_MASTER" label="Quiz Master"/>
                            <form:option value="USER" label="User"/>
                        </form:select>
                    </div>

                    <div class="row">
                        <div class="col-xs-12 form-group">
                            <form:button type="submit" class="btn btn-success btn-block btn-flat">Register</form:button>
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