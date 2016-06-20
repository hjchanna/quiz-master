/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.quiz_master.user;

import com.sv.quiz_master.user.model.Question;
import com.sv.quiz_master.user.model.QuestionPaper;
import com.sv.quiz_master.user.model.QuizSession;
import com.sv.quiz_master.user.model.QuizSessionUser;
import com.sv.quiz_master.user.model.QuizSessionUserAnswer;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Mohan
 */
public interface UserRepository {

    public List<QuizSession> getQuizSessionList();

    public Object getObject(Class c, Serializable id);

    public Serializable saveObject(Object object);

    public void updateObject(Object object);

    public Question getNextQuestion(QuestionPaper quizSession, Question question);

    public int saveQuizSessionUserAnswer(QuizSessionUserAnswer quizSessionUserAnswer);

    public List<QuizSessionUserAnswer> listResults(QuizSessionUser quizSessionUser);

//    public List<QuizSession> getQuizSessionList();
//
//    public QuizSession getQuizSession(Integer indexNo);
//
//    public int saveQuizSessionUser(QuizSessionUser quizSessionUser);
//
//    public QuizSessionUser getQuizSessionUser(Integer indexNo);
//
//    public Question getNextQuestion(Integer quizSession, Integer currentQuestion);
//    
//    public Question getQuestion(Integer indexNo);
//
//    public int saveQuizSessionUserAnswer(QuizSessionUserAnswer quizSessionUserAnswer);
}
