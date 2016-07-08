<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${pageContext.request.contextPath}/resources/theme/img/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>${sessionScope.user.type}</p>
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>

        <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>

            <!--start home-->
            <li class="active">
                <a href="${pageContext.request.contextPath}/">
                    <i class="fa fa-th"></i> <span>Home</span>
                </a>
            </li>
            <!--end home-->
            <c:if test="${sessionScope.user.type == 'ADMIN' || sessionScope.user.type == 'USER'}">
            <li class="active">
                <a href="${pageContext.request.contextPath}/admin/question-paper-list">
                    <i class="fa fa-bookmark"></i> <span>Question Papers</span>
                </a>
            </li>
            </c:if>
            <c:if test="${sessionScope.user.type == 'ADMIN' || sessionScope.user.type == 'QUIZ_MASTER' }">

                <li class="active">
                    <a href="${pageContext.request.contextPath}/user/quiz-session">
                        <i class="fa fa-bell"></i> <span>Quiz Session</span>
                    </a>
                </li>
            </c:if>

            <c:if test="${sessionScope.user.type == 'ADMIN'}">
                <li class="active">
                    <a href="${pageContext.request.contextPath}/security/new-security-user">
                        <i class="fa fa-user"></i> <span>User Registration</span>
                    </a>
                </li>
            </c:if>
            <c:if test="${sessionScope.user.type == 'ADMIN' || sessionScope.user.type == 'QUIZ_MASTER'}">


                <li class="active">
                    <a href="${pageContext.request.contextPath}/user/quiz-session-list">
                        <i class="fa fa-print"></i> <span>Reports</span>
                    </a>
                </li>
            </c:if>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>