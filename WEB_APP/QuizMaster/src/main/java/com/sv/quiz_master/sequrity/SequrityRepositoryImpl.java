/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.quiz_master.sequrity;

import com.sv.quiz_master.sequrity.model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author KAZA
 */
public class SequrityRepositoryImpl implements SequrityRepository {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void newSequrityUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        session.save(user);
    }

    @Override
    public User getSequrityUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        return (User) session.createCriteria(User.class)
                .add(Restrictions.eq("indexNo", user.getName()))
                .add(Restrictions.eq("password", user.getPassword()))
                .uniqueResult();
    }

}
