/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.quiz_master.master;

import com.sv.quiz_master.master.model.Question;
import com.sv.quiz_master.master.model.QuestionPaper;
import com.sv.quiz_master.master.model.QuizSession;
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
public class MasterRepositoryImpl implements MasterRepository {

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
    public List<Question> getQuestionList(Integer questionPaper) {
        Session session = sessionFactory.getCurrentSession();
        return (List<Question>) session.createCriteria(Question.class)
                .add(Restrictions.eq("questionPaper", questionPaper)).list();
    }

    @Override
    public int saveQuizSession(QuizSession quizSession) {
        Session session = sessionFactory.getCurrentSession();
        session.save(quizSession);
        return quizSession.getIndexNo();    
    }

}
