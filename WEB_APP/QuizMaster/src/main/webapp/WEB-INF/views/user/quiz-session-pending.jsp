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
        <!--video js-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/video.js/video-js.min.css">

    </head>

    <body class="hold-transition login-page">
        <div class="row">
            <div class="col-sm-6 col-sm-offset-3" style="margin-top: 2%;">
                <div class="login-logo">
                    <div>
                        <img src="${pageContext.request.contextPath}/resources/image/logo.png" width="100px" height="66px"/>
                    </div>
                    <b>Quiz</b>Master
                </div>
                <div class="box box-default">
                    <div class="box-body">
                        <div class="col-lg-12">
                            <video id="video" class="video-js vjs-default-skin col-lg-12"
                                   data-setup='{"controls" : false, "autoplay" : true, "preload" : "auto"}'>
                                <source src="${pageContext.request.contextPath}/resources/video/dilmah.flv" type="video/x-flv">
                            </video>
                        </div>

                                <div class="col-xs-8 col-xs-offset-2" style="margin-top: 50px;">
                                    <a class="btn btn-primary btn-block" href="${pageContext.request.contextPath}/user/quiz-session-start">Start</a>
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
        <!--video.js-->
        <script src="${pageContext.request.contextPath}/resources/video.js/video.min.js"></script>

        <script>
            var baseUrl = '<c:out value="${pageContext.request.contextPath}"/>';
            videojs.options.flash.swf = baseUrl + "/resources/video.js/video-js.swf";
            
            function next() {
                var url = baseUrl + '/user/quiz-session-start';
                document.location = url;
            }

            var player = videojs('video', {}, function () {});
            player.ready(function () {
                this.on("ended", function () {
                    setTimeout(next(), 3000);
                });
            });
        </script>

    </body>
</html>