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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Mohan
 */
@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/question-paper-list")
    public ModelAndView searchQuestionPaper(@RequestParam(required = false) String keyword) {
        ModelAndView modelAndView = new ModelAndView("admin/question-paper-list");
        modelAndView.addObject("paperlist", adminService.getQuestionPaperList(keyword));
        return modelAndView;
    }

    @RequestMapping("/toggle-enability-question-paper/{questionPaper}")
    public String toggleEnabilityQuestionPaper(@PathVariable Integer questionPaper) {

        adminService.toggleEnabilityQuestionPaper(questionPaper);

        return "redirect:/admin/question-paper-list";
    }

    @RequestMapping("/new-question-paper")
    public ModelAndView attemptNewQuestionPaper() {
        ModelAndView modelAndView = new ModelAndView("admin/question-paper");

        modelAndView.addObject("paper", new QuestionPaper());

        return modelAndView;
    }

    @RequestMapping("/question-paper/{questionPaper}")
    public ModelAndView attemptQuesionPaper(@PathVariable Integer questionPaper, @RequestParam(required = false) String keyword) {
        ModelAndView modelAndView = new ModelAndView("admin/question-paper");

        modelAndView.addObject("paper", adminService.getQuestionPaper(questionPaper));

        return modelAndView;
    }

    @RequestMapping("/save-question-paper")
    public String saveQuestionPaper(@ModelAttribute QuestionPaper questionPaper) {
        Integer index = adminService.saveQuestionPaper(questionPaper);

        return "redirect:/admin/question-paper/" + index;
    }

    @RequestMapping("/toggle-enability-question/{questionPaper}/{question}")
    public String toggleEnabilityQuestion(@PathVariable Integer questionPaper, @PathVariable Integer question) {

        adminService.toggleEnabilityQuestion(questionPaper, question);

        return "redirect:/admin/question-paper/" + questionPaper;
    }

    @RequestMapping("/question/{questionPaper}/{quesion}")
    public ModelAndView attemptQuestion(@PathVariable Integer questionPaper, @PathVariable Integer quesion) {
        ModelAndView modelAndView = new ModelAndView("admin/question");

        modelAndView.addObject("question", adminService.getQuestion(quesion));
        modelAndView.addObject("questionpaper", adminService.getQuestionPaper(questionPaper));
        modelAndView.addObject("paperlist", adminService.getQuestionPaperList(null));

        return modelAndView;
    }

    @RequestMapping("/new-question/{questionPaper}")
    public ModelAndView attemptNewQuestion(@PathVariable Integer questionPaper) {
        ModelAndView modelAndView = new ModelAndView("admin/question");
        modelAndView.addObject("paperlist", adminService.getQuestionPaperList(null));
        modelAndView.addObject("questionpaper", adminService.getQuestionPaper(questionPaper));
        modelAndView.addObject("question", new Question());

        return modelAndView;
    }

    @RequestMapping("/save-question/{paperId}")
    public String saveQuestion(@ModelAttribute Question question, @RequestParam Integer paperId) {
        System.out.println(question.getQuestionEn());

        Integer questionId = adminService.saveQuestion(question);

        return "forward:/admin/question/" + paperId + "/" + questionId;
    }
}
