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
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Mohan
 */
@Repository
public class MasterRepositoryImpl implements MasterRepository {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<QuestionPaper> getQuestionPaperList() {
        Session session = sessionFactory.getCurrentSession();
        return session.createCriteria(QuestionPaper.class).list();
    }

    @Override
    public List<QuizSession> getQuizSessionList(Integer questionPaper) {
        Session session = sessionFactory.getCurrentSession();
        return session.createCriteria(QuizSession.class)
                .add(Restrictions.eq("questionPaper.indexNo", questionPaper))
                .list();
    }

    @Override
    public QuestionPaper getQuestionPaper(Integer indexNo) {
        Session session = sessionFactory.getCurrentSession();
        return (QuestionPaper) session.createCriteria(QuestionPaper.class)
                .add(Restrictions.eq("indexNo", indexNo))
                .uniqueResult();
    }

    @Override
    public List<Question> getQuestionList(Integer questionPaper) {
        Session session = sessionFactory.getCurrentSession();
        return session.createCriteria(Question.class)
                .add(Restrictions.eq("questionPaper.indexNo", questionPaper))
                .list();
    }

    @Override
    public int saveQuizSession(QuizSession quizSession) {
        Session session = sessionFactory.getCurrentSession();
        session.save(quizSession);
        return quizSession.getIndexNo();
    }

    @Override
    public List<QuizSessionUser> getUserList(Integer quizSession) {
        Session session = sessionFactory.getCurrentSession();
        return session.createCriteria(QuizSessionUser.class)
                .add(Restrictions.eq("quizSession.indexNo", quizSession))
                //                .add(Restrictions.eq("status", "true"))
                .list();
    }

    @Override
    public List<QuizSessionUserAnswer> getQuestonAnswerList(Integer quizSession) {
        Session session = sessionFactory.getCurrentSession();
        return session.createCriteria(QuizSessionUserAnswer.class)
                .add(Restrictions.eq("quizSession.indexNo", quizSession))
                .list();
    }

    @Override
    public double getAverage(Integer paperId) {
        Session session = sessionFactory.getCurrentSession();

        return (Double) session.createCriteria(QuizSessionUserAnswer.class)
                .setProjection(Projections.avg("correct"))
                .add(Restrictions.eq("questionPaper.indexNo", paperId))
                .uniqueResult();

    }

    @Override
    public List<Double> getAverageForQuestion(Integer paperId) {
        Session session = sessionFactory.getCurrentSession();

        List<Question> list = getQuestionList(paperId);
        List<Double> values = new ArrayList<Double>();
        for (Question question : list) {
            values.add((Double) session.createCriteria(QuizSessionUserAnswer.class)
                    .setProjection(Projections.avg("correct"))
                    .add(Restrictions.eq("questionPaper.indexNo", paperId))
                    .add(Restrictions.eq("question.indexNo", question.getIndexNo()))
                    .uniqueResult());
        }
        return values;

    }

    @Override
    public int getCorrectCount(Integer sessionId, Integer userId) {
        Session session = sessionFactory.getCurrentSession();
        return session.createCriteria(QuizSessionUserAnswer.class)
                .add(Restrictions.eq("quizSession.indexNo", sessionId))
                .add(Restrictions.eq("quizSessionUser.indexNo", userId))
                .add(Restrictions.eq("correct", true))
                .list().size();
    }

    @Override
    public List<QuizSessionUserAnswer> getDuration(Integer sessionId, Integer userId) {
        Session session = sessionFactory.getCurrentSession();
        
         int ob=0;
        List<QuizSessionUserAnswer> list = session.createCriteria(QuizSessionUserAnswer.class)
//            .setProjection(Projections.sum("duration"))
                .add(Restrictions.eq("quizSession.indexNo", sessionId))
                .add(Restrictions.eq("quizSessionUser.indexNo", userId))
                .list();
        for (QuizSessionUserAnswer list1 : list) {
            ob=ob+list1.getDuration();
        }
        System.out.println("dao Impl "+list.size());
        System.out.println("dao Impl "+ob);
        return list;
    }

}
