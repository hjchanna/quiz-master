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
@Transactional
@Service
public class SecuritySerivceImpl implements SecurityService{

    @Autowired
    private SecurityRepository sequrityRepository;
    
    @Override
    public int newSequrityUser(User user) {
        sequrityRepository.newSequrityUser(user);
        return user.getIndexNo();
    }

    @Override
    public User getSequrityUser(User user) {
        return sequrityRepository.getSequrityUser(user);
    }
    
}
