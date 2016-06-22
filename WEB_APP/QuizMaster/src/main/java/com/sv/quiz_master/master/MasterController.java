/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.quiz_master.master;

import com.sv.quiz_master.master.model.QuizSession;
import com.sv.quiz_master.master.model.QuizSessionUser;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
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
        
        return modelAndView;
    }

    @RequestMapping("/new-quiz-session/{questionPaper}")
    public String attemptNewSession(HttpServletRequest servletRequest,
            @PathVariable Integer questionPaper
            ,@RequestParam String location
    ) {
        Integer quizSessionId = masterService.newQuizSession(questionPaper, location);

        servletRequest.getSession().setAttribute("quizsession", quizSessionId);
        servletRequest.getSession().setAttribute("questionpaper", questionPaper);

        return "redirect:/master/quiz-session-info/" + quizSessionId;
    }

    @RequestMapping("/quiz-session-info/{quizSession}")
    public ModelAndView attemptSession(HttpServletRequest servletRequest) {
        Integer quizSession = (Integer) servletRequest.getSession().getAttribute("quizsession");
        Integer questionPaper = (Integer) servletRequest.getSession().getAttribute("questionpaper");

        ModelAndView modelAndView = new ModelAndView("master/user-list");
        List<QuizSessionUser> userList = masterService.getUserList(quizSession);
        modelAndView.addObject("userList", userList);
        modelAndView.addObject("questionPaper", questionPaper);

        return modelAndView;
    }

    @RequestMapping("/question-answer-list")
    public ModelAndView attemptQuestionAnswerList(HttpServletRequest servletRequest) {
        ModelAndView modelAndView = new ModelAndView("master/question-answer");
        Integer quizSession = (Integer) servletRequest.getSession().getAttribute("quizsession");
        modelAndView.addObject("QuestonAnswerList", masterService.getQuestonAnswerList(quizSession));

        return modelAndView;
    }
}
