/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.quiz_master.master;

import com.sv.quiz_master.master.model.Question;
import com.sv.quiz_master.master.model.QuestionPaper;
import com.sv.quiz_master.master.model.QuizSession;
import com.sv.quiz_master.master.model.QuizSessionUser;
import com.sv.quiz_master.master.model.QuizSessionUserAnswer;
import com.sv.quiz_master.zsystem.QuizSessionStatus;
import java.util.ArrayList;
import java.util.Date;
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
public class MasterServiceImpl implements MasterService {

    @Autowired
    private MasterRepository masterRepository;

    @Override
    public List<QuestionPaper> getQuestionPaperList() {
        return masterRepository.getQuestionPaperList();
    }

    @Override
    public List<QuizSession> getQuizSessionList(Integer questionPaper) {
        return masterRepository.getQuizSessionList(questionPaper);
    }

    @Override
    public QuestionPaper getQuestionPaper(Integer indexNo) {
        return masterRepository.getQuestionPaper(indexNo);
    }

    @Override
    public List<Question> getQuestionList(Integer questionPaper) {
        return masterRepository.getQuestionList(questionPaper);
    }

    @Override
    public int newQuizSession(Integer questionPaper, String location) {
        QuizSession quizSession = new QuizSession();

        //quizSession.setIndexNo(null); //auto increment
        quizSession.setQuestionPaper(masterRepository.getQuestionPaper(questionPaper));
        quizSession.setStartedOn(new Date());
        quizSession.setFinishedOn(null);
        quizSession.setLocation(location);
        quizSession.setStatus(QuizSessionStatus.ON_GOING);

        return masterRepository.saveQuizSession(quizSession);
    }

    @Override
    public List<QuizSessionUser> getUserList(int quizSession) {
        List<QuizSessionUser> userList = masterRepository.getUserList(quizSession);

        if (userList.isEmpty()) {
            userList = new ArrayList<QuizSessionUser>();
        }
        return userList;
    }

    @Override
    public List<QuizSessionUserAnswer> getQuestionAnswerList(Integer quizSession) {
        return masterRepository.getQuestonAnswerList(quizSession);
    }

    @Override
    public double getAverage(Integer paperId) {
        return masterRepository.getAverage(paperId);
    }

    @Override
    public List<Double> getAverageForQuestion(Integer paperId) {
        
        return masterRepository.getAverageForQuestion(paperId);
    }

    @Override
    public int getCorrectCount(Integer sessionId, Integer userId) {
        return masterRepository.getCorrectCount(sessionId, userId);
    }

    @Override
    public int getDuration(Integer sessionId, Integer userId) {
        int val=0;
        List<QuizSessionUserAnswer> list=  masterRepository.getDuration(sessionId, userId);
        for (QuizSessionUserAnswer userAnswer : list) {
            val=val+userAnswer.getDuration();
        }
        System.out.println("serv Impl "+val);
        return val;
    }

}
