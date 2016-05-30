/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.quiz_master.user;

/**
 *
 * @author Mohan
 */
public interface UserService {

    public List<QuizSession> getQuizSessionList();

    public QuizSessionUser saveQuizSessionUser(QuizSessionUser quizSessionUser);

    public void startQuizSession(Integer quizSession, Integer quizSessionUser);

    public Question getNextQuestion(Integer quizSession, Integer currentQuestion);

    public void saveAnswer(
            Integer quizSession,
            Integer quizSessionUser,
            Integer quesionPaper,
            Integer question,
            String answer,
            Integer duration);

}
