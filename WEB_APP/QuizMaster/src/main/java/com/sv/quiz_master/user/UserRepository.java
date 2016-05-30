/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.quiz_master.user;

import java.util.List;

/**
 *
 * @author Mohan
 */
public interface UserRepository {

    public List<QuizSession> getQuizSessionList();

    public QuizSession getQuizSession(Integer indexNo);



    public int saveQuizSessionUser(QuizSessionUser quizSessionUser);

    public QuizSessionUser getQuizSessionUser(Integer indexNo);



    public Question getNextQuestion(Integer quizSession, Integer currentQuestion);
    

    
    public int saveQuizSessionUserAnswer(QuizSessionUserAnswer quizSessionUserAnswer)

}
