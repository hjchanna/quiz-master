/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.quiz_master.admin;

import com.sv.quiz_master.admin.model.Question;
import com.sv.quiz_master.admin.model.QuestionPaper;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

    //start views
    @RequestMapping("/question-paper-list")
    public ModelAndView attemptQuesionPaperList() {
        ModelAndView modelAndView = new ModelAndView("admin/question-paper-list");

        modelAndView.addObject("paperlist", adminService.getQuestionPaperList());

        return modelAndView;
    }

    @RequestMapping("/question-paper/{questionPaper}")
    public ModelAndView attemptQuesionPaper(@PathVariable Integer questionPaper) {
        ModelAndView modelAndView = new ModelAndView("admin/question-paper");

        modelAndView.addObject("paper", adminService.getQuestionPaper(questionPaper));
        modelAndView.addObject("questionlist", adminService.getQuestionList(questionPaper));

        return modelAndView;
    }

    @RequestMapping("/new-question-paper")
    public ModelAndView attemptNewQuestionPaper() {
        ModelAndView modelAndView = new ModelAndView("admin/question-paper");

        modelAndView.addObject("paper", new QuestionPaper());
        modelAndView.addObject("paperlist", new HashSet<Question>());

        return modelAndView;
    }

    @RequestMapping(value = "/save-question-paper", method = RequestMethod.POST)
    public String saveQuestionPaper(@RequestParam("discription") String discription) {

        System.out.println("ssssssssssssssssssssssssssssss");
        System.out.println(discription);
        QuestionPaper questionPaper = new QuestionPaper();

        questionPaper.setDescription(discription);
        questionPaper.setLastUsedOn(new Date());
        int indexNo = adminService.saveQuestionPaper(questionPaper);
        System.out.println(indexNo);

        return "redirect:/admin/new-question/" + indexNo;
    }

    @RequestMapping(value = "/update-question-paper", method = RequestMethod.POST)
    public String updateQuestionPaper(@RequestParam("indexNo") String index, @RequestParam("discription") String disc) {
        System.out.println("eeeeeeeeeeeeeeeeeeeeeeee 222222222");

        System.out.println(disc);
        System.out.println(index);
        System.out.println(index.split("discription=")[1]);
//        System.out.println(disc);

//        System.out.println(paperlist[0]);
//        for (String list : paperlist) {
//            System.out.println(list);
//        }
//        QuestionPaper questionPaper = new QuestionPaper();
//
//        questionPaper.setIndexNo(Integer.parseInt(paperlist[0]));
//        questionPaper.setDescription(paperlist[1]);
//        questionPaper.setLastUsedOn(new Date());
//        int indexNo = adminService.updateQuestionPaper(questionPaper);
//
        return "forward:/admin/question-paper/";
//        return "forward:/admin/question-paper/" + indexNo;

    }

    @RequestMapping("/question/{questionPaper}/{quesion}")
    public ModelAndView attemptQuestion(Integer questionPaper, Integer quesion) {
        ModelAndView modelAndView = new ModelAndView("admin/question");

        modelAndView.addObject("question", adminService.getQuestion(quesion));
        modelAndView.addObject("questionpaper", adminService.getQuestionPaper(questionPaper));

        return modelAndView;
    }

    @RequestMapping("/new-question/{questionPaper}")
    public ModelAndView attemptNewQuestion(Integer questionPaper) {
        ModelAndView modelAndView = new ModelAndView("admin/question");

        modelAndView.addObject("question-paper", adminService.getQuestionPaper(questionPaper));

        return modelAndView;
    }

    @RequestMapping("/save-question")
    public String saveQuestion(@ModelAttribute Question question) {
        int indexNo = adminService.saveQuestion(question);

        return "forward:/question/" + indexNo;
    }

    @RequestMapping("/update-question")
    public String updateQuestion(@ModelAttribute Question question) {
        int indexNo = adminService.updateQuestion(question);

        return "forward:/question/" + indexNo;
    }
    //end views
}
