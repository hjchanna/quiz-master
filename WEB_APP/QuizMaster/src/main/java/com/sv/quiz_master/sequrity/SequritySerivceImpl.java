/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.quiz_master.sequrity;

import com.sv.quiz_master.sequrity.model.User;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author KAZA
 */
public class SequritySerivceImpl implements SequrityService{

    @Autowired
    private SequrityRepository sequrityRepository;
    
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
