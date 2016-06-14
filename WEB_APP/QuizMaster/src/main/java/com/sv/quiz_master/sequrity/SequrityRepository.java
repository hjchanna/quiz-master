/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.quiz_master.sequrity;

import com.sv.quiz_master.sequrity.model.User;

/**
 *
 * @author KAZA
 */
public interface SequrityRepository {
    
    public void newSequrityUser(User user);
    
    public User getSequrityUser(User user);
    
}
