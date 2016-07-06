/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.quiz_master.user;

import com.sv.quiz_master.user.model.Question;
import com.sv.quiz_master.user.model.QuestionPaper;
import com.sv.quiz_master.user.model.QuizSessionUser;
import com.sv.quiz_master.user.model.QuizSessionUserAnswer;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Mohan
 */
public interface UserRepository {
    
    public List getList(Class c);

    public Object getObject(Class c, Serializable id);

    public Serializable saveObject(Object object);

    public void updateObject(Object object);

    public QuestionPaper getRandomQuestionPaper();

    public Question getNextQuestion(QuestionPaper quizSession, Question question);

    public int saveQuizSessionUserAnswer(QuizSessionUserAnswer quizSessionUserAnswer);

    public List<QuizSessionUserAnswer> listResults(QuizSessionUser quizSessionUser);
    
    public List<QuizSessionUser> listQuizSessionUsers(Integer quizSession);

}
