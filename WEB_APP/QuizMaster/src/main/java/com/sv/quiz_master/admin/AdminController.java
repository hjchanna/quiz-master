/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.quiz_master.admin;

import com.sv.quiz_master.admin.model.Question;
import com.sv.quiz_master.admin.model.QuestionPaper;
import java.util.Date;
import java.util.HashSet;
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

    @RequestMapping("/question-paper-list")
    public ModelAndView searchQuestionPaper(@RequestParam(required = false) String keyword) {
        ModelAndView modelAndView = new ModelAndView("admin/question-paper-list");
        modelAndView.addObject("paperlist", adminService.getQuestionPaperList(keyword));
        return modelAndView;
    }

    @RequestMapping("/question-paper/{questionPaper}")
    public ModelAndView attemptQuesionPaper(@PathVariable Integer questionPaper, @RequestParam(required = false) String keyword) {
        ModelAndView modelAndView = new ModelAndView("admin/question-paper");

        modelAndView.addObject("paper", adminService.getQuestionPaper(questionPaper));

        return modelAndView;
    }

    @RequestMapping("/delete-paper/{questionPaper}")
    public String DeleteQuesionPaper(@PathVariable Integer questionPaper) {

        adminService.deleteQuestionPaper(questionPaper);
        return "redirect:/admin/question-paper-list";
    }

    @RequestMapping("/new-question-paper")
    public ModelAndView attemptNewQuestionPaper() {
        ModelAndView modelAndView = new ModelAndView("admin/question-paper");

        modelAndView.addObject("paper", new QuestionPaper());
        modelAndView.addObject("paperlist", new HashSet<Question>());

        return modelAndView;
    }

    @RequestMapping("/save-question-paper")
    public String saveQuestionPaper(@ModelAttribute QuestionPaper questionPaper) {

        int index = 0;
        if (questionPaper.getIndexNo() != null) {
            questionPaper.setLastUsedOn(new Date());
            index = adminService.updateQuestionPaper(questionPaper);
        } else {
            questionPaper.setLastUsedOn(new Date());
            index = adminService.saveQuestionPaper(questionPaper);
        }

        return "redirect:/admin/question-paper/" + index;
    }

    @RequestMapping(value = "/update-question-paper", method = RequestMethod.POST)
    public String updateQuestionPaper(@RequestParam("indexNo") String index, @RequestParam("disc") String disc) {
        QuestionPaper questionPaper = new QuestionPaper();

        questionPaper.setIndexNo(Integer.parseInt(index));
        questionPaper.setDescription(disc);
        questionPaper.setLastUsedOn(new Date());
        int indexNo = adminService.updateQuestionPaper(questionPaper);

        return "redirect:/admin/question-paper/" + indexNo;

    }

//    @RequestMapping(value = "/search-question-list", method = RequestMethod.POST, produces = "application/json")
//    public List<Question> searchQuestionPaperList(@RequestParam("searchText") String text) {
//        System.out.println("Description Text" + text);
//        List<Question> questionList = adminService.searchQuestionList(text);
//        return questionList;
//    }
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
//    @RequestMapping(value = "/save-question", method = RequestMethod.POST)
//    public String saveQuestion(HttpServletRequest hsr) {
//        String[] attribute = (String[]) hsr.getAttribute("questions");
//        return null;
//        return "forward:/admin/question-paper/" + indexNo;
//    }
//    @RequestMapping("/save-question")
//    public String saveQuestion(@ModelAttribute Question question) {
//        int indexNo = adminService.saveQuestion(question);
//
//        return "forward:/admin/question-paper/" + indexNo;
//    }
//    @RequestMapping("/update-question")
//    public String updateQuestion(@ModelAttribute Question question) {
//        int indexNo = adminService.updateQuestion(question);
//        return "forward:/question/" + indexNo;
//    }
    //end views
}
