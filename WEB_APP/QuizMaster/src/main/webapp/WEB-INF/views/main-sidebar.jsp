<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${pageContext.request.contextPath}/resources/theme/img/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>Sample User</p>
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

            <li class="active">
                <a href="${pageContext.request.contextPath}/admin/question-paper-list">
                    <i class="fa fa-bookmark"></i> <span>Question Papers</span>
                </a>
            </li>

            <li class="active">
                <a href="${pageContext.request.contextPath}/user/quiz-session-new-user">
                    <i class="fa fa-bell"></i> <span>Start Quiz Session</span>
                </a>
            </li>

            <!--start administration-->
            <!--            <li class="treeview">
                            <a href="#">
                                <i class="fa fa-dashboard"></i> <span>Administration</span> <i class="fa fa-angle-left pull-right"></i>
                            </a>
            
                            <ul class="treeview-menu">
                                <li><a href="${pageContext.request.contextPath}/admin/question-paper-list"><i class="fa fa-circle-o"></i> Question Papers</a></li>
                            </ul>
                        </li>-->
            <!--end administration-->


            <!--start master-->
<!--            <li class="treeview">
                <a href="#">
                    <i class="fa fa-dashboard"></i> <span>Quiz Master</span> <i class="fa fa-angle-left pull-right"></i>
                </a>

                <ul class="treeview-menu">
                    <li><a href="${pageContext.request.contextPath}/master/question-paper-list"><i class="fa fa-circle-o"></i> Question Papers</a></li>
                </ul>
            </li>-->
            <!--end master-->


            <!--start master-->
<!--            <li class="treeview">
                <a href="#">
                    <i class="fa fa-dashboard"></i> <span>User</span> <i class="fa fa-angle-left pull-right"></i>
                </a>

                <ul class="treeview-menu">
                    <li><a href="${pageContext.request.contextPath}/master/question-paper-list"><i class="fa fa-circle-o"></i> Question Papers</a></li>
                </ul>
            </li>-->
            <!--end master-->

        </ul>
    </section>
    <!-- /.sidebar -->
</aside>