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
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Mohan
 */
@Repository
public class UserRepositoryImpl implements UserRepository {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<QuizSession> getQuizSessionList() {
        Session session=sessionFactory.getCurrentSession();
        return session.createCriteria(QuizSession.class).list();
    }

    @Override
    public QuizSession getQuizSession(Integer indexNo) {
        Session session=sessionFactory.getCurrentSession();
        return (QuizSession) session.createCriteria(QuizSession.class)
                .add(Restrictions.eq("indexNo", indexNo));
        
    }

    @Override
    public int saveQuizSessionUser(QuizSessionUser quizSessionUser) {
        Session session=sessionFactory.getCurrentSession();
        session.save(quizSessionUser);
        return quizSessionUser.getIndexNo();
    }

    @Override
    public QuizSessionUser getQuizSessionUser(Integer indexNo) {
        Session session=sessionFactory.getCurrentSession();
        return (QuizSessionUser) session.createCriteria(QuizSessionUser.class)
                .add(Restrictions.eq("indexNo", indexNo));
    }

    @Override
    public Question getNextQuestion(Integer quizSession, Integer currentQuestion) {
        Session session=sessionFactory.getCurrentSession();
        QuizSession quizSession1 =(QuizSession) session.createCriteria(QuizSession.class)
                .add(Restrictions.eq("indexNo", quizSession));
        
        QuestionPaper questionPaper = quizSession1.getQuestionPaper();
        
        return (Question) session.createCriteria(Question.class)
                .add(Restrictions.eq("indexNo", currentQuestion+1))
                .add(Restrictions.eq("questionPaper.indexNo", questionPaper.getIndexNo()))
                .uniqueResult();
    }

    @Override
    public int saveQuizSessionUserAnswer(QuizSessionUserAnswer quizSessionUserAnswer) {
        Session session=sessionFactory.getCurrentSession();
        session.save(quizSessionUserAnswer);
        return quizSessionUserAnswer.getIndexNo();
    }

    @Override
    public Question getQuestion(Integer indexNo) {
        Session session=sessionFactory.getCurrentSession();
        return (Question) session.createCriteria(Question.class)
                .add(Restrictions.eq("indexNo", indexNo))
                .uniqueResult();
    }
}
