/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.quiz_master.security;

import com.sv.quiz_master.security.model.User;
import javax.servlet.http.HttpServletRequest;
import javax.xml.ws.Dispatch;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author KAZA
 */
@Controller
public class SecurityController {

    @Autowired
    SecurityService securityService;

    @RequestMapping("/new-security-user")
    public ModelAndView attemptUser() {
        ModelAndView modelAndView = new ModelAndView("security/register-user");
        modelAndView.addObject("user", new User());
        return modelAndView;
    }

    @RequestMapping("/save-security-user")
    public ModelAndView saveUser(@ModelAttribute User user) {
        ModelAndView modelAndView = new ModelAndView("security/register-user");
        user.setActive(true);
        modelAndView.addObject("user", securityService.newSecurityUser(user));
        modelAndView.addObject("user", new User());
        return modelAndView;
    }

    
    @RequestMapping("/login")
    public ModelAndView attemptLogin() {
        ModelAndView modelAndView=new ModelAndView("security/login-user");
        modelAndView.addObject("user", new User());
        return modelAndView;
    }
    
    
    @RequestMapping("/login-user")
    public String loginUser(@ModelAttribute User user,HttpServletRequest servletRequest) {
        User securityUser = securityService.getSecurityUser(user);
        servletRequest.getSession().setAttribute("user", securityUser);
        return "forword:/";
    }

}
