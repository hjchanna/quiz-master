/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.quiz_master.admin;

import com.sv.quiz_master.admin.model.Question;
import com.sv.quiz_master.admin.model.QuestionPaper;
import java.util.List;
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
public class AdminRepositoryImpl implements AdminRepository {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<QuestionPaper> getQuestionPaperList() {
        Session session = sessionFactory.getCurrentSession();
        
        return session.createCriteria(QuestionPaper.class).list();
    }

    @Override
    public QuestionPaper getQuestionPaper(Integer indexNo) {
        Session session = sessionFactory.getCurrentSession();
        
        return (QuestionPaper) session.createCriteria(QuestionPaper.class)
                .add(Restrictions.eq("indexNo", indexNo))
                .uniqueResult();
    }

    @Override
    public void saveQuestionPaper(QuestionPaper questionPaper) {
        Session session = sessionFactory.getCurrentSession();
        session.save(questionPaper);
    }

    @Override
    public void updateQuestionPaper(QuestionPaper questionPaper) {
        Session session = sessionFactory.getCurrentSession();
        session.update(questionPaper);
    }

    @Override
    public List<Question> getQuestionList(Integer questionPaper) {
        Session session = sessionFactory.getCurrentSession();
        return session.createCriteria(Question.class)
                .add(Restrictions.eq("indexNo", questionPaper))
                .list();
                
    }

    @Override
    public Question getQuestion(Integer indexNo) {
        Session session = sessionFactory.getCurrentSession();
        return (Question) session.createCriteria(Question.class)
                .add(Restrictions.eq("indexNo", indexNo))
                .uniqueResult();
    }

    @Override
    public void saveQuestion(Question question) {
        Session session = sessionFactory.getCurrentSession();
        session.save(question);
    }

    @Override
    public void updateQuestion(Question question) {
        Session session = sessionFactory.getCurrentSession();
        session.update(question);
    }

}
