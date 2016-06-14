/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.quiz_master.security;

import com.sv.quiz_master.security.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author KAZA
 */

@Service
@Transactional
public class SecurityServiceImpl implements SecurityService{

    @Autowired
    private SecurityRepository sequrityRepository;
    
    @Override
    public int newSecurityUser(User user) {
        sequrityRepository.newSecurityUser(user);
        return user.getIndexNo();
    }

    @Override
    public User getSecurityUser(User user) {
        return sequrityRepository.getSecurityUser(user);
    }
    
}
