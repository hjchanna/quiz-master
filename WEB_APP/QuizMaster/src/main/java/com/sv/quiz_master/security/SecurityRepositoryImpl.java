/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.quiz_master.security;

import com.sv.quiz_master.security.model.User;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author KAZA
 */
@Repository
public class SecurityRepositoryImpl implements SecurityRepository {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void newSecurityUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        session.save(user);
    }

    @Override
    public User getSecurityUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        
        List<User> users = session.createCriteria(User.class)
                .add(Restrictions.eq("name", user.getName()))
                .add(Restrictions.eq("password", user.getPassword()))
                .list();
        
        return users.isEmpty()?null:users.get(0);
    }

}
