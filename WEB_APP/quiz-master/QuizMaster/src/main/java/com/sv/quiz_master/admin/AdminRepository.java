/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.quiz_master.admin;

import java.util.List;

/**
 *
 * @author Mohan
 */
public interface AdminRepository {

    //question paper
    public List<QuestionPaper> getQuestionPaperList();

    public QuestionPaper getQuestionPaper(Integer indexNo);

    public void saveQuestionPaper(QuestionPaper questionPaper);

    public void updateQuestionPaper(QuestionPaper questionPaper);

    //question
    public List<Question> getQuestionList(Integer questionPaper);

    public Question getQuestion(Integer indexNo);

    public void saveQuestion(Question question);

    public void updateQuestion(Question question);

}
