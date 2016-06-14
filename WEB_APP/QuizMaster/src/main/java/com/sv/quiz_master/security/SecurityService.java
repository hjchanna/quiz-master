/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.quiz_master.security;

import com.sv.quiz_master.security.model.User;

/**
 *
 * @author KAZA
 */
public interface SecurityService {

    public int newSecurityUser(User user);

    public User getSecurityUser(User user);
}
