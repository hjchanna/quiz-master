<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
        <li><a href="#"><i class="fa fa-dashboard"></i> Administration</a></li>
        <li class="active">Question Papers</li>
        <li class="active">Question</li>
        <li class="active">${question.indexNo}</li>
    </ol>
</section>

<section class="content">
    <!--start item basic information-->

    <form:form modelAttribute="question" action="${pageContext.request.contextPath}/admin/save-question/${questionpaper.indexNo}" method="POST">

        <div class="box box-primary">
            <div class="box-header with-border">
                <div class="col-lg-9">
                    <form:select path="questionPaper.indexNo" id="paperCombo" cssClass="form-control">     
                        <c:forEach items="${paperlist}" var="paper" >
                            <form:option value="${paper.indexNo}" label="${paper.indexNo} - ${paper.description}"/>
                        </c:forEach>
                    </form:select>
                </div>

                <div class="col-lg-3">
                    <div class="pull-right">
                        <button class="btn btn-success"  type="submit" value="save" ><span class="fa fa-save"></span>&nbsp;Save</button>
                        <a href="${pageContext.request.contextPath}/admin/question-paper/${questionpaper.indexNo}" class="btn btn-success show_tip" data-original-title="back" ><span class="glyphicon glyphicon-chevron-left"></span>&nbsp;Back</a>          
                    </div>
                </div>
            </div>

            <div class="box-body">
                <!--start content-->
                <div class="content">
                    
                    <div class="row">
                        <!--start form-->

                        <form:input type="hidden" path="correctAnswer" id="correctAnswer" />
                        <form:input type="hidden" path="indexNo" />
                        <input type="hidden" value="${questionpaper.indexNo}" name="paperId" id="paperId"/>

                        <div class="col-lg-12">
                            <div class="form-group">
                                <div class="input-group">
                                    <label class="input-group-addon" style="min-width: 106px;">Question (EN)</label>                        
                                    <form:input type="text" path="questionEn" class="form-control" id="description" aria-label="..."/>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="input-group">
                                    <label class="input-group-addon" style="min-width: 106px;">Question (SI)</label>                        
                                    <form:input type="text" path="questionSi" class="form-control" id="description" aria-label="..."/>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="input-group">
                                    <label class="input-group-addon" style="min-width: 106px;">Question (TA)</label>                        
                                    <form:input type="text" path="questionTa" class="form-control" id="description" aria-label="..."/>
                                </div>
                            </div>
                        </div>

                        <!--start answer A-->
                        <div class="col-sm-6">
                            <div class="panel panel-primary">
                                <div class="panel-heading text-center sm">
                                    <div class="radio-inline">
                                        <label><input name="group" type="radio" id="radio-A"> Answer - A</label> 
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <div class="form-group input-group col-lg-12">
                                        <label class="input-group-addon" style="min-width: 45px;">EN</label>                        
                                        <form:input type="text" path="answerAEn" id="answerAEn" class="form-control"/>
                                    </div>
                                    <div class="form-group input-group col-lg-12">
                                        <label class="input-group-addon" style="min-width: 45px;">SI</label>                        
                                        <form:input type="text" path="answerASi" class="form-control" id="answerASi"/>
                                    </div>
                                    <div class="form-group input-group col-lg-12">
                                        <label class="input-group-addon" style="min-width: 45px;">TA</label>                        
                                        <form:input type="text" path="answerATa" class="form-control" id="answerATa"/>
                                    </div>
                                </div>
                                <!--                                <div class="panel-footer">
                                                                    &nbsp;
                                                                </div>-->
                            </div>
                        </div>
                        <!--end answer A-->

                        <!--start answer B-->
                        <div class="col-sm-6">
                            <div class="panel panel-primary">
                                <div class="panel-heading text-center">
                                    <div class="radio-inline">
                                        <label><input name="group" type="radio" id="radio-B"> Answer - B</label> 
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <div class="form-group input-group col-lg-12">
                                        <label class="input-group-addon" style="min-width: 45px;">EN</label>                        
                                        <form:input type="text" path="answerBEn" class="form-control" id="answerBEn"/>
                                    </div>
                                    <div class="form-group input-group col-lg-12">
                                        <label class="input-group-addon" style="min-width: 45px;">SI</label>                        
                                        <form:input type="text" path="answerBSi"  class="form-control" id="answerBSi"/>
                                    </div>
                                    <div class="form-group input-group col-lg-12">
                                        <label class="input-group-addon" style="min-width: 45px;">TA</label>                        
                                        <form:input type="text" path="answerBTa"  class="form-control" id="answerBTa"/>
                                    </div>
                                </div>
                                <!--                                <div class="panel-footer">
                                                                    &nbsp;
                                                                </div>-->
                            </div>
                        </div>
                        <!--end answer B-->

                        <!--start answer C-->
                        <div class="col-sm-6">
                            <div class="panel panel-primary">
                                <div class="panel-heading text-center">
                                    <div class="radio-inline">
                                        <label><input name="group" type="radio" id="radio-C"> Answer - C</label> 
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <div class="form-group input-group col-lg-12">
                                        <label class="input-group-addon" style="min-width: 45px;">EN</label>                        
                                        <form:input type="text" path="answerCEn" class="form-control" id="answerCEn"/>
                                    </div>
                                    <div class="form-group input-group col-lg-12">
                                        <label class="input-group-addon" style="min-width: 45px;">SI</label>                        
                                        <form:input type="text" path="answerCSi" class="form-control" id="answerCSi"/>
                                    </div>
                                    <div class="form-group input-group col-lg-12">
                                        <label class="input-group-addon" style="min-width: 45px;">TA</label>                        
                                        <form:input type="text" path="answerCTa" class="form-control" id="answerCTa"/>
                                    </div>
                                </div>
                                <!--                                <div class="panel-footer">
                                                                    &nbsp;
                                                                </div>-->
                            </div>
                        </div>
                        <!--end answer C-->

                        <!--start answer D-->
                        <div class="col-sm-6">
                            <div class="panel panel-primary">
                                <div class="panel-heading text-center">
                                    <div class="radio-inline">
                                        <label><input name="group" type="radio" id="radio-D"> Answer - D</label> 
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <div class="form-group input-group col-lg-12">
                                        <label class="input-group-addon" style="min-width: 45px">EN</label>                   
                                        <form:input type="text" path="answerDEn" class="form-control" id="answerDEn"/>
                                    </div>
                                    <div class="form-group input-group col-lg-12">
                                        <label class="input-group-addon" style="min-width: 45px;">SI</label>                        
                                        <form:input type="text" path="answerDSi" class="form-control" id="answerDSi"/>
                                    </div>
                                    <div class="form-group input-group col-lg-12">
                                        <label class="input-group-addon" style="min-width: 45px;">TA</label>                        
                                        <form:input type="text" path="answerDTa" class="form-control" id="answerDTa"/>
                                    </div>
                                </div>
                                <!--                                <div class="panel-footer">
                                                                    &nbsp;
                                                                </div>-->
                            </div>
                        </div>
                        <!--end answer D-->
                        <!--end form-->
                    </div>
                </div>
            </div>
        </div>

    </form:form>
</section>
<!--end page content-->

<script >
    <%--<jsp:include page="customer-form.js"/>--%>
</script>

<script type="text/javascript">
    $(document).ready(function () {
        var correctAnswer = '${question.correctAnswer}';
        if ("A" === correctAnswer) {
            $('#radio-A').attr('checked', true);
        } else if ("B" === correctAnswer) {
            $('#radio-B').attr('checked', true);
        } else if ("C" === correctAnswer) {
            $('#radio-C').attr('checked', true);
        } else if ("D" === correctAnswer) {
            $('#radio-D').attr('checked', true);
        } else {

        }
    });
    $("#radio-A").change(function () {
        if ($("#radio-A").is(":checked")) {
            $('#correctAnswer').val("A");
        }
    });
    $("#radio-B").change(function () {
        if ($("#radio-B").is(":checked")) {
            $('#correctAnswer').val("B");
        }
    });
    $("#radio-C").change(function () {
        if ($("#radio-C").is(":checked")) {
            $('#correctAnswer').val("C");
        }
    });
    $("#radio-D").change(function () {
        if ($("#radio-D").is(":checked")) {
            $('#correctAnswer').val("D");
        }
    });

</script>
<!--start bottom contents of page-->
<jsp:include page="/WEB-INF/views/import-bottom.jsp"/>
<!--end bottom contents of page-->





























