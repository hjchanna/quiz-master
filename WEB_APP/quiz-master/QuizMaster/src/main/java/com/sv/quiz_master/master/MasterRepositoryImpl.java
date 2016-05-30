/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.quiz_master.master;

import org.hibernate.SessionFactory;
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
}
