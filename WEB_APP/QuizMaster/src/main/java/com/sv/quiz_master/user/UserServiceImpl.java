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
import com.sv.quiz_master.zsystem.QuizSessionStatus;
import java.io.Serializable;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Mohan
 */
@Transactional
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public QuizSessionUser saveQuizSessionUser(QuizSessionUser quizSessionUser) {
        Serializable userId = userRepository.saveObject(quizSessionUser);
        return (QuizSessionUser) userRepository.getObject(QuizSessionUser.class, userId);
    }

    @Override
    public QuizSession newQuizSession() {
        QuizSession quizSession = new QuizSession();
        quizSession.setStartedOn(new Date());
        quizSession.setStatus(QuizSessionStatus.PENDING);
        
        quizSession.setQuestionPaper(userRepository.getRandomQuestionPaper());
        
        Integer quizSessinId = (Integer) userRepository.saveObject(quizSession);
        quizSession = (QuizSession) userRepository.getObject(QuizSession.class, quizSessinId);
        return quizSession;
    }

    @Override
    public QuizSession startQuizSession(QuizSession quizSession) {
        quizSession.setStartedOn(new Date());
        quizSession.setStatus(QuizSessionStatus.ON_GOING);
        userRepository.saveObject(quizSession);
        return quizSession;
    }

    @Override
    public QuizSession finishQuizSession(QuizSession quizSession) {
        quizSession.setFinishedOn(new Date());
        quizSession.setStatus(QuizSessionStatus.COMPLETED);
        userRepository.updateObject(quizSession);
        return quizSession;
    }

    @Override
    public void updateQuestionPaperLastUsed(QuestionPaper questionPaper) {
        userRepository.updateObject(questionPaper);
    }

    @Override
    public Question getNextQuestion(QuestionPaper questionPaper, Question currentQuestion) {
        return userRepository.getNextQuestion(questionPaper, currentQuestion);
    }

    @Override
    public void saveAnswer(QuizSession quizSession, QuizSessionUser quizSessionUser, QuestionPaper questionPaper, Question question, String answer, Integer duration) {

//        QuizSession quizSession = userRepository.getQuizSession(quizSessionId);
//        QuizSessionUser quizSessionUser = userRepository.getQuizSessionUser(quizSessionUserId);
//        Question question = userRepository.getQuestion(questionId);
        QuizSessionUserAnswer quizSessionUserAnswer = new QuizSessionUserAnswer();

        //quizSessionUserAnswer.setIndexNo(null);   //auto increment
        quizSessionUserAnswer.setQuestionPaper(quizSession.getQuestionPaper());
        quizSessionUserAnswer.setQuestion(question);
        quizSessionUserAnswer.setQuizSession(quizSession);
        quizSessionUserAnswer.setQuizSessionUser(quizSessionUser);
        quizSessionUserAnswer.setAnswer(answer);
        quizSessionUserAnswer.setCorrect(question.getCorrectAnswer().equalsIgnoreCase(answer));
        quizSessionUserAnswer.setDuration(duration);

        userRepository.saveQuizSessionUserAnswer(quizSessionUserAnswer);
    }

}
