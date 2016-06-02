/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.quiz_master.user;

import com.sv.quiz_master.user.model.Question;
import com.sv.quiz_master.user.model.QuizSession;
import com.sv.quiz_master.user.model.QuizSessionUser;
import com.sv.quiz_master.user.model.QuizSessionUserAnswer;
import java.util.List;
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
    public List<QuizSession> getQuizSessionList() {
        return userRepository.getQuizSessionList();
    }

    @Override
    public QuizSessionUser saveQuizSessionUser(QuizSessionUser quizSessionUser) {
        userRepository.saveQuizSessionUser(quizSessionUser);
        return quizSessionUser;
    }

    @Override
    public void startQuizSession(Integer quizSession, Integer quizSessionUser) {
//        QuizSessionUser 
//        userRepository.saveQuizSessionUser(null)
    }

    @Override
    public Question getNextQuestion(Integer quizSession, Integer currentQuestion) {
        return userRepository.getNextQuestion(quizSession, currentQuestion);
    }

    @Override
    public void saveAnswer(Integer quizSessionId, Integer quizSessionUserId, Integer quesionPaperId, Integer questionId, String answer, Integer duration) {

        QuizSession quizSession = userRepository.getQuizSession(quizSessionId);
        QuizSessionUser quizSessionUser = userRepository.getQuizSessionUser(quizSessionUserId);
        Question question = userRepository.getQuestion(questionId);

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
