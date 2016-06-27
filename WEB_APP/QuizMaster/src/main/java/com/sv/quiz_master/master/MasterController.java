/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.quiz_master.master;

import com.sv.quiz_master.master.model.QuestionPaper;
import com.sv.quiz_master.master.model.QuizSession;
import com.sv.quiz_master.master.model.QuizSessionUser;
import com.sv.quiz_master.master.model.QuizSessionUserAnswer;
import java.util.ArrayList;
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

        double average = masterService.getAverage(paperIndexNo) * 100;
        modelAndView.addObject("avaragescore", String.format("%.2f", average));
        modelAndView.addObject("average", masterService.getAverageForQuestion(paperIndexNo));
        modelAndView.addObject("paper", masterService.getQuestionPaper(paperIndexNo));
        modelAndView.addObject("questionlist", masterService.getQuestionList(paperIndexNo));
        modelAndView.addObject("quizsessions", masterService.getQuizSessionList(paperIndexNo));

        return modelAndView;
    }

    @RequestMapping("/new-quiz-session/{questionPaper}")
    public String attemptNewSession(HttpServletRequest servletRequest,
            @PathVariable Integer questionPaper, @RequestParam String location) {
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
    
    @RequestMapping("/quiz-session-question")
    public ModelAndView attemptQuestion() {
        ModelAndView modelAndView = new ModelAndView("master/quiz-session-question");
        return modelAndView;
    }

    @RequestMapping("/question-answer-list")
    public ModelAndView attemptQuestionAnswerList(HttpServletRequest servletRequest) {
        ModelAndView modelAndView = new ModelAndView("master/question-answer");
        Integer quizSession = (Integer) servletRequest.getSession().getAttribute("quizsession");
        List<QuizSessionUser> userList = masterService.getUserList(quizSession);
        Integer qPaper = masterService.getQuestionAnswerList(quizSession).get(0).getQuestionPaper().getIndexNo();
        QuestionPaper questionPaper = masterService.getQuestionPaper(qPaper);
        
        List<Integer> correctList=new ArrayList<Integer>();
        List<Integer> duration=new ArrayList<Integer>();
        for (QuizSessionUser users : userList) {
            correctList.add(masterService.getCorrectCount(quizSession, users.getIndexNo()));
            duration.add(masterService.getDuration(quizSession, users.getIndexNo()));
        }
        
        modelAndView.addObject("userList", userList);
        modelAndView.addObject("QuestionCount",questionPaper);
        modelAndView.addObject("correctList",correctList);
        modelAndView.addObject("duration",duration);

        modelAndView.addObject("QuestonAnswerList", masterService.getQuestionAnswerList(quizSession));

        return modelAndView;
    }
}
