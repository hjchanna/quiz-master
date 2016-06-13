/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.quiz_master.user;

import com.sv.quiz_master.user.model.Question;
import com.sv.quiz_master.user.model.QuestionPaper;
import com.sv.quiz_master.user.model.QuizSessionUserAnswer;
import java.io.Serializable;
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
    public int saveQuizSessionUserAnswer(QuizSessionUserAnswer quizSessionUserAnswer) {
        Session session = sessionFactory.getCurrentSession();
        session.save(quizSessionUserAnswer);
        return quizSessionUserAnswer.getIndexNo();
    }

    @Override
    public Object getObject(Class c, Serializable id) {
        Session session = sessionFactory.getCurrentSession();

        return session.load(c, id);
    }

    @Override
    public Serializable saveObject(Object object) {
        Session session = sessionFactory.getCurrentSession();
        return session.save(object);
    }

    @Override
    public void updateObject(Object object) {
        Session session = sessionFactory.getCurrentSession();
        session.update(object);
    }

    @Override
    public Question getNextQuestion(QuestionPaper quizSession, Question question) {
        Session session = sessionFactory.getCurrentSession();
        return (Question) session.createCriteria(Question.class)
                .add(Restrictions.eq("questionPaper.indexNo", quizSession.getIndexNo()))
                .add(Restrictions.eq("indexNo", question.getIndexNo()));
    }

}
