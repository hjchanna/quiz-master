/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.quiz_master.security;

import com.sv.quiz_master.security.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author KAZA
 */
public class SecurityController {

    @Autowired
    SecurityService sequrityService;

    @RequestMapping("new-sequrity-user")
    public ModelAndView attemptUser() {
        ModelAndView modelAndView = new ModelAndView("sequrity/register-user");
        modelAndView.addObject("user", new User());
        return modelAndView;
    }

    @RequestMapping("save-sequrity-user")
    public ModelAndView saveUser(@ModelAttribute User user) {
        ModelAndView modelAndView = new ModelAndView("sequrity/register-user");
        modelAndView.addObject("user", sequrityService.newSequrityUser(user));
        return modelAndView;
    }
}
