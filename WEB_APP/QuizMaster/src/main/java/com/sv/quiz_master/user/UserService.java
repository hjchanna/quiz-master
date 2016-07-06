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
import java.util.List;

/**
 *
 * @author Mohan
 */
public interface UserService {

    public QuizSessionUser saveQuizSessionUser(QuizSessionUser quizSessionUser);

    public QuizSession getQuizSession(String id);

    public QuizSession newQuizSession(QuizSession quizSession);

    public QuizSession finishQuizSession(Integer quizSessionId);

    public void updateQuestionPaperLastUsed(QuestionPaper questionPaper);

    public Question getNextQuestion(QuestionPaper questionPaper, Question currentQuestion);

    public void saveAnswer(
            QuizSession quizSession,
            QuizSessionUser quizSessionUser,
            QuestionPaper questionPaper,
            Question question,
            String answer,
            Integer duration);
    
    public void makeWinner(QuizSessionUser quizSessionUser);

    public List<QuizSessionUserAnswer> listResults(QuizSessionUser quizSessionUser);
    
    public List<QuizSession> listQuizSessions();
    
    public List<QuizSessionUser> listQuizSessionUsers(Integer quizSession);

}
