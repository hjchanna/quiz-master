/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.quiz_master.admin;

import com.sv.quiz_master.admin.model.Question;
import com.sv.quiz_master.admin.model.QuestionPaper;
import java.util.List;

/**
 *
 * @author Mohan
 */
public interface AdminService {

    //question paper
    public List<QuestionPaper> getQuestionPaperList();

    public QuestionPaper getQuestionPaper(Integer indexNo);

    public int saveQuestionPaper(QuestionPaper questionPaper);

    public int updateQuestionPaper(QuestionPaper questionPaper);

    //question
    public List<Question> getQuestionList(Integer questionPaper);

    public Question getQuestion(Integer indexNo);

    public int saveQuestion(Question question);

    public int updateQuestion(Question question);

    public List<Question> searchQuestionList(String question);
}
