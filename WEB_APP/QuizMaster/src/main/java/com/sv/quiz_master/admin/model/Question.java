package com.sv.quiz_master.admin.model;
// Generated May 31, 2016 8:44:03 AM by Hibernate Tools 4.3.1

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Question generated by hbm2java
 */
@Entity(name = "com.sv.quiz_master.admin.model.Question")
@Table(name = "question")
public class Question implements java.io.Serializable {

    private Integer indexNo;
    private QuestionPaper questionPaper;
    private String questionEn;
    private String questionSi;
    private String questionTa;
    private String answerAEn;
    private String answerASi;
    private String answerATa;
    private String answerBEn;
    private String answerBSi;
    private String answerBTa;
    private String answerCEn;
    private String answerCSi;
    private String answerCTa;
    private String answerDEn;
    private String answerDSi;
    private String answerDTa;
    private String correctAnswer;
    private int duration;

    public Question() {
    }

    public Question(QuestionPaper questionPaper, String correctAnswer, int duration) {
        this.questionPaper = questionPaper;
        this.correctAnswer = correctAnswer;
        this.duration = duration;
    }

    public Question(QuestionPaper questionPaper, String questionEn, String questionSi, String questionTa, String answerAEn, String answerASi, String answerATa, String answerBEn, String answerBSi, String answerBTa, String answerCEn, String answerCSi, String answerCTa, String answerDEn, String answerDSi, String answerDTa, String correctAnswer, int duration) {
        this.questionPaper = questionPaper;
        this.questionEn = questionEn;
        this.questionSi = questionSi;
        this.questionTa = questionTa;
        this.answerAEn = answerAEn;
        this.answerASi = answerASi;
        this.answerATa = answerATa;
        this.answerBEn = answerBEn;
        this.answerBSi = answerBSi;
        this.answerBTa = answerBTa;
        this.answerCEn = answerCEn;
        this.answerCSi = answerCSi;
        this.answerCTa = answerCTa;
        this.answerDEn = answerDEn;
        this.answerDSi = answerDSi;
        this.answerDTa = answerDTa;
        this.correctAnswer = correctAnswer;
        this.duration = duration;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "index_no", unique = true, nullable = false)
    public Integer getIndexNo() {
        return this.indexNo;
    }

    public void setIndexNo(Integer indexNo) {
        this.indexNo = indexNo;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "question_paper", nullable = false)
    public QuestionPaper getQuestionPaper() {
        return this.questionPaper;
    }

    public void setQuestionPaper(QuestionPaper questionPaper) {
        this.questionPaper = questionPaper;
    }

    @Column(name = "question_en", length = 100)
    public String getQuestionEn() {
        return this.questionEn;
    }

    public void setQuestionEn(String questionEn) {
        this.questionEn = questionEn;
    }

    @Column(name = "question_si", length = 100)
    public String getQuestionSi() {
        return this.questionSi;
    }

    public void setQuestionSi(String questionSi) {
        this.questionSi = questionSi;
    }

    @Column(name = "question_ta", length = 100)
    public String getQuestionTa() {
        return this.questionTa;
    }

    public void setQuestionTa(String questionTa) {
        this.questionTa = questionTa;
    }

    @Column(name = "answer_a_en", length = 100)
    public String getAnswerAEn() {
        return this.answerAEn;
    }

    public void setAnswerAEn(String answerAEn) {
        this.answerAEn = answerAEn;
    }

    @Column(name = "answer_a_si", length = 100)
    public String getAnswerASi() {
        return this.answerASi;
    }

    public void setAnswerASi(String answerASi) {
        this.answerASi = answerASi;
    }

    @Column(name = "answer_a_ta", length = 100)
    public String getAnswerATa() {
        return this.answerATa;
    }

    public void setAnswerATa(String answerATa) {
        this.answerATa = answerATa;
    }

    @Column(name = "answer_b_en", length = 100)
    public String getAnswerBEn() {
        return this.answerBEn;
    }

    public void setAnswerBEn(String answerBEn) {
        this.answerBEn = answerBEn;
    }

    @Column(name = "answer_b_si", length = 100)
    public String getAnswerBSi() {
        return this.answerBSi;
    }

    public void setAnswerBSi(String answerBSi) {
        this.answerBSi = answerBSi;
    }

    @Column(name = "answer_b_ta", length = 100)
    public String getAnswerBTa() {
        return this.answerBTa;
    }

    public void setAnswerBTa(String answerBTa) {
        this.answerBTa = answerBTa;
    }

    @Column(name = "answer_c_en", length = 100)
    public String getAnswerCEn() {
        return this.answerCEn;
    }

    public void setAnswerCEn(String answerCEn) {
        this.answerCEn = answerCEn;
    }

    @Column(name = "answer_c_si", length = 100)
    public String getAnswerCSi() {
        return this.answerCSi;
    }

    public void setAnswerCSi(String answerCSi) {
        this.answerCSi = answerCSi;
    }

    @Column(name = "answer_c_ta", length = 100)
    public String getAnswerCTa() {
        return this.answerCTa;
    }

    public void setAnswerCTa(String answerCTa) {
        this.answerCTa = answerCTa;
    }

    @Column(name = "answer_d_en", length = 100)
    public String getAnswerDEn() {
        return this.answerDEn;
    }

    public void setAnswerDEn(String answerDEn) {
        this.answerDEn = answerDEn;
    }

    @Column(name = "answer_d_si", length = 100)
    public String getAnswerDSi() {
        return this.answerDSi;
    }

    public void setAnswerDSi(String answerDSi) {
        this.answerDSi = answerDSi;
    }

    @Column(name = "answer_d_ta", length = 100)
    public String getAnswerDTa() {
        return this.answerDTa;
    }

    public void setAnswerDTa(String answerDTa) {
        this.answerDTa = answerDTa;
    }

    @Column(name = "correct_answer", nullable = false, length = 25)
    public String getCorrectAnswer() {
        return this.correctAnswer;
    }

    public void setCorrectAnswer(String correctAnswer) {
        this.correctAnswer = correctAnswer;
    }

    @Column(name = "duration", nullable = false)
    public int getDuration() {
        return this.duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

}