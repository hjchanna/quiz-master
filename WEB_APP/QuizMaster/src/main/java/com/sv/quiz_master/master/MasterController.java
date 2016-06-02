/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.quiz_master.master;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Mohan
 */
@Controller
public class MasterController {

    @Autowired
    private MasterService masterService;

    @RequestMapping("/question-paper-list")
    public ModelAndView attemptQuestionPaperList() {
        ModelAndView modelAndView = new ModelAndView("master/question-paper-list");

        modelAndView.addObject("paperlist", masterService.getQuestionPaperList());
        System.out.println(masterService.getQuestionPaperList());

        return modelAndView;
    }

    @RequestMapping("/question-paper/{indexNo}")
    public ModelAndView attemptQuesionPaper(@PathVariable Integer paperIndexNo) {
        ModelAndView modelAndView = new ModelAndView("master/question-paper");

        modelAndView.addObject("paper", masterService.getQuestionPaper(paperIndexNo));
        modelAndView.addObject("questionlist", masterService.getQuestionList(paperIndexNo));

        return modelAndView;
    }

    @RequestMapping("/new-quiz-session/{questionPaper}")
    public String attemptNewSession(HttpServletRequest servletRequest, @PathVariable Integer questionPaper) {
        Integer quizSession = masterService.newQuizSession(questionPaper);

        servletRequest.getSession().setAttribute("quiz-session", quizSession);
        servletRequest.getSession().setAttribute("question-paper", questionPaper);

        return "forward:/quiz-session-info";
    }

    @RequestMapping("/quiz-session-info")
    public ModelAndView attemptSession(HttpServletRequest servletRequest) {
        Integer quizSession = (Integer) servletRequest.getSession().getAttribute("quiz-session");
        Integer questionPaper = (Integer) servletRequest.getSession().getAttribute("question-paper");

        ModelAndView modelAndView = new ModelAndView("master/question-session");

        return modelAndView;
    }

}
