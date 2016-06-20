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
    public int newQuizSession(Integer questionPaper,String location) {
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
        return masterRepository.getUserList(quizSession);
    }

    @Override
    public List<QuizSessionUserAnswer> getQuestonAnswerList(Integer quizSession) {
        return masterRepository.getQuestonAnswerList(quizSession);
    }

}
