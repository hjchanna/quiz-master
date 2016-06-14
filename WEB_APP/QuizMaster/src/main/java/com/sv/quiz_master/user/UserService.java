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

/**
 *
 * @author Mohan
 */
public interface UserService {

    public QuizSessionUser saveQuizSessionUser(QuizSessionUser quizSessionUser);

    public QuizSession newQuizSession();

    public QuizSession startQuizSession(QuizSession quizSession);

    public QuizSession finishQuizSession(QuizSession quizSession);

    public void updateQuestionPaperLastUsed(QuestionPaper questionPaper);

    public Question getNextQuestion(QuestionPaper questionPaper, Question currentQuestion);

    public void saveAnswer(
            QuizSession quizSession,
            QuizSessionUser quizSessionUser,
            QuestionPaper questionPaper,
            Question question,
            String answer,
            Integer duration);

}
