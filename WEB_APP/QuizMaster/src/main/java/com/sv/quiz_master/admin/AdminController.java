/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.quiz_master.admin;

import com.sv.quiz_master.admin.model.Question;
import com.sv.quiz_master.admin.model.QuestionPaper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Mohan
 */
@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    //start views
    @RequestMapping("/question-paper-list")
    public ModelAndView attemptQuesionPaperList() {
        ModelAndView modelAndView = new ModelAndView("admin/question-paper-list");

        modelAndView.addObject("paper-list", adminService.getQuestionPaperList());

        return modelAndView;
    }

    @RequestMapping("/question-paper/{questionPaper}")
    public ModelAndView attemptQuesionPaper(@PathVariable Integer questionPaper) {
        ModelAndView modelAndView = new ModelAndView("admin/question-paper");

        modelAndView.addObject("paper", adminService.getQuestionPaper(questionPaper));
        modelAndView.addObject("question-list", adminService.getQuestionList(questionPaper));

        return modelAndView;
    }

    @RequestMapping("/new-question-paper")
    public ModelAndView attemptNewQuestionPaper() {
        ModelAndView modelAndView = new ModelAndView("admin/question-paper");

        return modelAndView;
    }

    @RequestMapping("/save-question-paper")
    public String saveQuestionPaper(@ModelAttribute QuestionPaper questionPaper) {
        int indexNo = adminService.saveQuestionPaper(questionPaper);

        return "forward:/question-paper/" + indexNo;
    }

    @RequestMapping("/update-question-paper")
    public String updateQuestionPaper(@ModelAttribute QuestionPaper questionPaper) {
        int indexNo = adminService.updateQuestionPaper(questionPaper);

        return "forward:/question-paper/" + indexNo;
    }

    @RequestMapping("/question/{questionPaper}/{quesion}")
    public ModelAndView attemptQuestion(Integer questionPaper, Integer quesion) {
        ModelAndView modelAndView = new ModelAndView("admin/question");

        modelAndView.addObject("question", adminService.getQuestion(quesion));
        modelAndView.addObject("question-paper", adminService.getQuestionPaper(questionPaper));

        return modelAndView;
    }

    @RequestMapping("/new-question/{questionPaper}")
    public ModelAndView attemptNewQuestion(Integer questionPaper) {
        ModelAndView modelAndView = new ModelAndView("admin/question");

        modelAndView.addObject("question-paper", adminService.getQuestionPaper(questionPaper));

        return modelAndView;
    }

    @RequestMapping("/save-question-paper")
    public String saveQuestion(@ModelAttribute Question question) {
        int indexNo = adminService.saveQuestion(question);

        return "forward:/question/" + indexNo;
    }

    @RequestMapping("/update-question-paper")
    public String updateQuestion(@ModelAttribute Question question) {
        int indexNo = adminService.updateQuestion(question);

        return "forward:/question/" + indexNo;
    }
    //end views
}
