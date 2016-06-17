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

        return modelAndView;
    }

    @RequestMapping("/question-paper/{paperIndexNo}")
    public ModelAndView attemptQuesionPaper(@PathVariable Integer paperIndexNo) {
        ModelAndView modelAndView = new ModelAndView("master/question-paper");

        modelAndView.addObject("paper", masterService.getQuestionPaper(paperIndexNo));
        modelAndView.addObject("questionlist", masterService.getQuestionList(paperIndexNo));
        modelAndView.addObject("quizsessions", masterService.getQuizSessionList(paperIndexNo));
//        modelAndView.addObject("avaragescore", );

        return modelAndView;
    }

    @RequestMapping("/new-quiz-session/{questionPaper}")
    public String attemptNewSession(HttpServletRequest servletRequest, @PathVariable Integer questionPaper) {
        Integer quizSession = masterService.newQuizSession(questionPaper);

        servletRequest.getSession().setAttribute("quizsession", quizSession);
        servletRequest.getSession().setAttribute("questionpaper", questionPaper);

        return "redirect:/master/quiz-session-info";
    }

    @RequestMapping("/quiz-session-info")
    public ModelAndView attemptSession(HttpServletRequest servletRequest) {
        Integer quizSession = (Integer) servletRequest.getSession().getAttribute("quizsession");
        Integer questionPaper = (Integer) servletRequest.getSession().getAttribute("questionpaper");

        ModelAndView modelAndView = new ModelAndView("master/question-session");
//        modelAndView.addObject("quizsessionusers", ?);

        return modelAndView;
    }

}
