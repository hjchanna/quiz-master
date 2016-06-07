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
import javax.servlet.http.HttpServletRequest;
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
        ArrayList<String> size = new ArrayList<String>();
        List<QuestionPaper> list = adminService.getQuestionPaperList();
        for (QuestionPaper questionPaper : list) {
            size.add(adminService.getQuestionList(questionPaper.getIndexNo()).size() + "");
        }
        modelAndView.addObject("paperlist", adminService.getQuestionPaperList());
        modelAndView.addObject("questionsize", size);

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
        QuestionPaper questionPaper = new QuestionPaper();

        questionPaper.setDescription(discription);
        questionPaper.setLastUsedOn(new Date());
        int indexNo = adminService.saveQuestionPaper(questionPaper);

        return "redirect:/admin/new-question/" + indexNo;
    }

    @RequestMapping(value = "/update-question-paper", method = RequestMethod.POST)
    public String updateQuestionPaper(@RequestParam("indexNo") String index, @RequestParam("disc") String disc) {
        QuestionPaper questionPaper = new QuestionPaper();

        questionPaper.setIndexNo(Integer.parseInt(index));
        questionPaper.setDescription(disc);
        questionPaper.setLastUsedOn(new Date());
        int indexNo = adminService.updateQuestionPaper(questionPaper);

        return "forward:/admin/question-paper/" + indexNo;

    }

    @RequestMapping("/question/{questionPaper}/{quesion}")
    public ModelAndView attemptQuestion(@PathVariable Integer questionPaper, @PathVariable Integer quesion) {
        ModelAndView modelAndView = new ModelAndView("admin/question");

        modelAndView.addObject("question", adminService.getQuestion(quesion));
        modelAndView.addObject("questionpaper", adminService.getQuestionPaper(questionPaper));
        modelAndView.addObject("paperlist", adminService.getQuestionPaperList());

        return modelAndView;
    }

    //copy
    @RequestMapping("/new-question")
    public ModelAndView attemptNewQuestion() {
        ModelAndView modelAndView = new ModelAndView("admin/question");

        modelAndView.addObject("paperlist", adminService.getQuestionPaperList());
        modelAndView.addObject("question", new Question());

        return modelAndView;
    }
//    @RequestMapping("/new-question/{questionPaper}")
//    public ModelAndView attemptNewQuestion(Integer questionPaper) {
//        ModelAndView modelAndView = new ModelAndView("admin/question");
//
//        modelAndView.addObject("questionpaper", adminService.getQuestionPaper(questionPaper));
//        modelAndView.addObject("question", new Question());
//
//        return modelAndView;
//    }

//    copy
    @RequestMapping(value = "/save-question", method = RequestMethod.POST)
    public String saveQuestion(HttpServletRequest hsr) {
        String[] attribute = (String[]) hsr.getAttribute("questions");

        System.out.println("ssssssssssssssssssssssssssss");
        System.out.println(attribute[0]);
        System.out.println(attribute[1]);
        System.out.println(attribute[2]);
        System.out.println(attribute[3]);
        return null;

//        return "forward:/admin/question-paper/" + indexNo;
    }

//    @RequestMapping("/save-question")
//    public String saveQuestion(@ModelAttribute Question question) {
//        int indexNo = adminService.saveQuestion(question);
//
//        return "forward:/admin/question-paper/" + indexNo;
//    }
    @RequestMapping("/update-question")
    public String updateQuestion(@ModelAttribute Question question) {
        int indexNo = adminService.updateQuestion(question);

        return "forward:/question/" + indexNo;
    }
    //end views
}
