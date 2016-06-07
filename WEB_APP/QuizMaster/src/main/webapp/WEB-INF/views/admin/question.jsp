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
        <li><a href="#"><i class="fa fa-dashboard"></i> Control Panel</a></li>
        <li class="active">Customer Control Panel</li>
    </ol>
</section>

<section class="content">
    <!--start item basic information-->
    <div class="box box-primary">
        <!--        <div class="box-header with-border">
                    <h3 class="box-title">Customer Information</h3>
                </div>-->

        <div class="box-body  no-padding">
            <!--start content-->
            <div class="container-fluid">
                <h1>Question</h1>


                <div class="row">
                    <!--start form-->

                    <form:form modelAttribute="question" >
                        <%--<form:input type="text" name="" path="indexNo" id="indexNo" />--%>
                        <form:input type="hidden"  name="" path="correctAnswer" id="correctAnswer" />
                        <c:if test="${not empty paperlist}">
                            <div class="container-fluid" >
                                <form:select path="questionPaper.indexNo" id="paperCombo" cssClass="form-control">     
                                    <c:forEach items="${paperlist}" var="paper" >
                                        <form:option value="${paper.indexNo}" label="${paper.description}"/>
                                    </c:forEach>
                                </form:select>
                            </div><br>
                        </c:if>
                        <div class="col-lg-9">
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
                        <div class="col-lg-3">
                            <div class="form-group">
                                <div class="input-group">
                                    <label class="input-group-addon" style="min-width: 106px;">Duration</label>                        
                                    <form:input type="text" path="duration" class="form-control" id="duration" aria-label="..."/>
                                </div>
                            </div>               
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <div class="input-group">
                                    <c:if test="${not empty question.indexNo}">
                                        <input type="submit" value="Update"  class="btn btn-warning btn-sm" aria-label="..."/>

                                    </c:if>
                                    <c:if test="${empty question.indexNo}">
                                        
                                    <input type="button" value="Save" id="btn-save" class="btn btn-success btn-sm" aria-label="..."/>&nbsp;
                                    </c:if>

                                </div>
                            </div>               
                        </div>         



                        <!--start answer A-->
                        <div class="col-sm-6">
                            <div class="panel panel-primary">
                                <div class="panel-heading text-center">
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
                                <div class="panel-footer">
                                    &nbsp;
                                </div>
                            </div>
                        </div>
                        <!--end answer D-->
                    </form:form>
                    <!--end form-->
                </div>
            </div>
        </div>
    </div>

</section>
<!--end page content-->

<script >
    <%--<jsp:include page="customer-form.js"/>--%>
</script>

<script type="text/javascript">
    $(document).ready(function () {
        var correctAnswer = '${question.correctAnswer}';
        if ("a" === correctAnswer) {
            $('#radio-A').attr('checked', true);
        }
        else if ("b" === correctAnswer) {
            $('#radio-B').attr('checked', true);
        }
        else if ("c" === correctAnswer) {
            $('#radio-C').attr('checked', true);
        }
        else if ("d" === correctAnswer) {
            $('#radio-D').attr('checked', true);
        } else {
            alert('Select Correct Answer');
        }
    });
    $("#btn-save").click(function () {
        var correctAnswer = null;
        if ($("#radio-A").is(":checked")) {
            correctAnswer = 'a';
        }
        else if ($("#radio-B").is(":checked")) {
            correctAnswer = 'b';
        }
        else if ($("#radio-C").is(":checked")) {
            correctAnswer = 'c';
        }
        else if ($("#radio-D").is(":checked")) {
            correctAnswer = 'd';
        }
        else {
            //type me....

        }
        alert(correctAnswer);


//        var data = {//set value to var data
//            questionPaper: $('#paperCombo').val(),
//            questionEn: $('#questionEn'),
//            questionSi: $('#questionSi'),
//            questionTa: $('#questionTa'),
//            answerAEn: $('#answerAEn'),
//            answerASi: $('#answerASi'),
//            answerATa: $('#answerATa'),
//            answerBEn: $('#answerBEn'),
//            answerBSi: $('#answerBSi'),
//            answerBTa: $('#answerBTa'),
//            answerCEn: $('#answerCEn'),
//            answerCSi: $('#answerCSi'),
//            answerCTa: $('#answerCTa'),
//            answerDEn: $('#answerDEn'),
//            answerDSi: $('#answerDSi'),
//            answerDTa: $('#answerDTa'),
//            correctAnswer: correctAnswer,
//            duration: $('#duration')
//        };
//        alert(data);
        $.ajax({
            type: "POST", //HTTP POST Method  
            url: "${pageContext.request.contextPath}/admin/save-question", // Controller/View   
            data: questions = {questionPaper: $('#paperCombo').val(),
                questionEn: $('#questionEn'),
                questionSi: $('#questionSi'),
                questionTa: $('#questionTa'),
                answerAEn: $('#answerAEn'),
                answerASi: $('#answerASi'),
                answerATa: $('#answerATa'),
                answerBEn: $('#answerBEn'),
                answerBSi: $('#answerBSi'),
                answerBTa: $('#answerBTa'),
                answerCEn: $('#answerCEn'),
                answerCSi: $('#answerCSi'),
                answerCTa: $('#answerCTa'),
                answerDEn: $('#answerDEn'),
                answerDSi: $('#answerDSi'),
                answerDTa: $('#answerDTa'),
                correctAnswer: correctAnswer,
                duration: $('#duration')},
            success: function (response) {
                console.log(data);
                alert(response);

            },
            error: function (data) {
                console.log(data);
                alert('error');
            }


        });
    });



</script>
<!--start bottom contents of page-->
<jsp:include page="/WEB-INF/views/import-bottom.jsp"/>
<!--end bottom contents of page-->





























