<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--start top contents of page-->
<jsp:include page="/WEB-INF/views/import-top.jsp"/>
<!--end top contents of page-->

<!--start page content-->
<section class="content-header">
    <h1>
        Questions
        <small>Manage Questions</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Control Panel</a></li>
        <li class="active">Customer Control Panel</li>
    </ol>
</section>

<section class="content">
    <!--start item basic information-->
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">Customer Information</h3>
        </div>

        <div class="box-body  no-padding" id="item-list">
             <!--start content-->
        <div class="container-fluid">
                <h1>Question</h1>
                <div class="row">
                    <div class="col-lg-10">
                        <div class="form-group">
                            <div class="input-group"> 
                                <label class="input-group-addon" style="min-width: 106px;">Question (EN)</label>                        
                                <input type="text" value="${question.questionEn}" class="form-control" id="description" aria-label="...">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="input-group">
                                <label class="input-group-addon" style="min-width: 106px;">Question (SI)</label>                        
                                <input type="text" value="${question.questionSi}" class="form-control" id="description" aria-label="...">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="input-group">
                                <label class="input-group-addon" style="min-width: 106px;">Question (TA)</label>                        
                                <input type="text" value="${question.questionTa}" class="form-control" id="description" aria-label="...">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <div class="input-group">
                                <label class="input-group-addon" style="min-width: 106px;">Duration</label>                        
                                <input type="text" value="${question.duration}" class="form-control" id="description" aria-label="...">
                            </div>
                        </div>               
                    </div>



                    <!--start answer A-->
                    <div class="col-sm-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading text-center">
                                <div class="radio-inline">
                                    <label><input name="group" type="radio"> Answer - A</label> 
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="form-group input-group col-lg-12">
                                    <label class="input-group-addon" style="min-width: 45px;">EN</label>                        
                                    <input type="text" value="${question.answerAEn}" class="form-control">
                                </div>
                                <div class="form-group input-group col-lg-12">
                                    <label class="input-group-addon" style="min-width: 45px;">SI</label>                        
                                    <input type="text" value="${question.answerASi}" class="form-control">
                                </div>
                                <div class="form-group input-group col-lg-12">
                                    <label class="input-group-addon" style="min-width: 45px;">TA</label>                        
                                    <input type="text" value="${question.answerATa}" class="form-control">
                                </div>
                            </div>
                            <div class="panel-footer">
                                &nbsp;
                            </div>
                        </div>
                    </div>
                    <!--end answer A-->

                    <!--start answer B-->
                    <div class="col-sm-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading text-center">
                                <div class="radio-inline">
                                    <label><input name="group" type="radio"> Answer - B</label> 
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="form-group input-group col-lg-12">
                                    <label class="input-group-addon" style="min-width: 45px;">EN</label>                        
                                    <input type="text" value="${question.answerBEn}" class="form-control">
                                </div>
                                <div class="form-group input-group col-lg-12">
                                    <label class="input-group-addon" style="min-width: 45px;">SI</label>                        
                                    <input type="text" value="${question.answerBSi}"  class="form-control">
                                </div>
                                <div class="form-group input-group col-lg-12">
                                    <label class="input-group-addon" style="min-width: 45px;">TA</label>                        
                                    <input type="text" value="${question.answerBTa}"  class="form-control">
                                </div>
                            </div>
                            <div class="panel-footer">
                                &nbsp;
                            </div>
                        </div>
                    </div>
                    <!--end answer B-->

                    <!--start answer C-->
                    <div class="col-sm-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading text-center">
                                <div class="radio-inline">
                                    <label><input name="group" type="radio"> Answer - C</label> 
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="form-group input-group col-lg-12">
                                    <label class="input-group-addon" style="min-width: 45px;">EN</label>                        
                                    <input type="text" value="${question.answerCEn}" class="form-control">
                                </div>
                                <div class="form-group input-group col-lg-12">
                                    <label class="input-group-addon" style="min-width: 45px;">SI</label>                        
                                    <input type="text" value="${question.answerCSi}" class="form-control">
                                </div>
                                <div class="form-group input-group col-lg-12">
                                    <label class="input-group-addon" style="min-width: 45px;">TA</label>                        
                                    <input type="text" value="${question.answerCTa}" class="form-control">
                                </div>
                            </div>
                            <div class="panel-footer">
                                &nbsp;
                            </div>
                        </div>
                    </div>
                    <!--end answer C-->

                    <!--start answer D-->
                    <div class="col-sm-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading text-center">
                                <div class="radio-inline">
                                    <label><input name="group" type="radio"> Answer - D</label> 
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="form-group input-group col-lg-12">
                                    <label class="input-group-addon" style="min-width: 45px;">EN</label>                        
                                    <input type="text" value="${question.answerDEn}" class="form-control">
                                </div>
                                <div class="form-group input-group col-lg-12">
                                    <label class="input-group-addon" style="min-width: 45px;">SI</label>                        
                                    <input type="text" value="${question.answerDSi}" class="form-control">
                                </div>
                                <div class="form-group input-group col-lg-12">
                                    <label class="input-group-addon" style="min-width: 45px;">TA</label>                        
                                    <input type="text" value="${question.answerDTa}" class="form-control">
                                </div>
                            </div>
                            <div class="panel-footer">
                                &nbsp;
                            </div>
                        </div>
                    </div>
                    <!--end answer D-->




                </div>
        </div>
        </div>
    </div>

</section>
<!--end page content-->

<script>
    <jsp:include page="customer-form.js"/>
</script>

<!--start bottom contents of page-->
<jsp:include page="/WEB-INF/views/import-bottom.jsp"/>
<!--end bottom contents of page-->
