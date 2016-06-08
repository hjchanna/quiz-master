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
public interface AdminRepository {

    //question paper
    public List<QuestionPaper> getQuestionPaperList(String description);

    public QuestionPaper getQuestionPaper(Integer indexNo);

    public void saveQuestionPaper(QuestionPaper questionPaper);

    public void updateQuestionPaper(QuestionPaper questionPaper);

    public void deleteQuestionPaper(Integer indexNo);

    //question
    public List<Question> getQuestionList(Integer questionPaper, String question);

    public Question getQuestion(Integer indexNo);

    public Integer saveQuestion(Question question);

    public Integer updateQuestion(Question question);
}
