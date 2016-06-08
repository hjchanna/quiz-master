/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.quiz_master.admin;

import com.sv.quiz_master.admin.model.Question;
import com.sv.quiz_master.admin.model.QuestionPaper;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
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
    public List<QuestionPaper> getQuestionPaperList(String description) {
        Session session = sessionFactory.getCurrentSession();

        Criteria criteria = session.createCriteria(QuestionPaper.class);

        if (description != null) {
            criteria.add(Restrictions.ilike("description", description, MatchMode.ANYWHERE));
        }
        
        criteria.setFetchMode("questions", FetchMode.SELECT);

        return criteria.list();
    }

    @Override
    public QuestionPaper getQuestionPaper(Integer indexNo) {
        Session session = sessionFactory.getCurrentSession();

        return (QuestionPaper) session.createCriteria(QuestionPaper.class)
                .add(Restrictions.eq("indexNo", indexNo))
                .uniqueResult();
    }

    @Override
    public int saveQuestionPaper(QuestionPaper questionPaper) {
        Session session = sessionFactory.getCurrentSession();
        return (Integer) session.save(questionPaper);
    }

    @Override
    public int updateQuestionPaper(QuestionPaper questionPaper) {
        Session session = sessionFactory.getCurrentSession();
        session.update(questionPaper);
        return questionPaper.getIndexNo();
    }

    @Override
    public List<Question> getQuestionList(Integer questionPaper, String question) {
        Session session = sessionFactory.getCurrentSession();
        Criteria criteria = session.createCriteria(Question.class)
                .add(Restrictions.eq("questionPaper.indexNo", questionPaper));

        if (question != null) {
            criteria.add(Restrictions.or(
                    Restrictions.ilike("questionEn", question, MatchMode.ANYWHERE),
                    Restrictions.ilike("questionSi", question, MatchMode.ANYWHERE),
                    Restrictions.ilike("questionTa", question, MatchMode.ANYWHERE)
            ));
        }

        return criteria.list();

    }

    @Override
    public Question getQuestion(Integer indexNo) {
        Session session = sessionFactory.getCurrentSession();
        return (Question) session.createCriteria(Question.class)
                .add(Restrictions.eq("indexNo", indexNo))
                .uniqueResult();
    }

    @Override
    public Integer saveQuestion(Question question) {
        Session session = sessionFactory.getCurrentSession();
        return (Integer) session.save(question);
    }

    @Override
    public Integer updateQuestion(Question question) {
        Session session = sessionFactory.getCurrentSession();
        session.update(question);
        return question.getIndexNo();
    }
}
