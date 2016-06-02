/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.quiz_master.master;

import com.sv.quiz_master.master.model.Question;
import com.sv.quiz_master.master.model.QuestionPaper;
import com.sv.quiz_master.master.model.QuizSession;
import java.util.List;

/**
 *
 * @author Mohan
 */
public interface MasterRepository {

    public List<QuestionPaper> getQuestionPaperList();

    public QuestionPaper getQuestionPaper(Integer indexNo);

    public List<Question> getQuestionList(Integer questionPaper);

    public int saveQuizSession(QuizSession quizSession);
}