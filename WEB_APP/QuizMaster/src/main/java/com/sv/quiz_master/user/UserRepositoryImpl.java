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
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
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
        Session session = sessionFactory.getCurrentSession();
        
        return session.createCriteria(QuizSession.class)
                .add(Restrictions.eq("status", QuizSessionStatus.ON_GOING))
                .list();
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
    public Question getNextQuestion(QuestionPaper questionPaper, Question question) {
        Session session = sessionFactory.getCurrentSession();

        Criteria criteria = session.createCriteria(Question.class)
                .add(Restrictions.eq("questionPaper", questionPaper));
        if (question != null) {
            criteria.add(Restrictions.gt("indexNo", question.getIndexNo()));
        }

        criteria.addOrder(Order.asc("indexNo"));
        criteria.setMaxResults(1);

        List<Question> questions = criteria.list();

        return questions.size() > 0 ? questions.get(0) : null;
    }

    @Override
    public int saveQuizSessionUserAnswer(QuizSessionUserAnswer quizSessionUserAnswer) {
        Session session = sessionFactory.getCurrentSession();
        session.save(quizSessionUserAnswer);
        return quizSessionUserAnswer.getIndexNo();
    }

    @Override
    public List<QuizSessionUserAnswer> listResults(QuizSessionUser quizSessionUser) {
        Session session = sessionFactory.getCurrentSession();

        Criteria criteria = session.createCriteria(QuizSessionUserAnswer.class)
                .add(Restrictions.eq("quizSessionUser", quizSessionUser));

        return criteria.list();
    }

}
