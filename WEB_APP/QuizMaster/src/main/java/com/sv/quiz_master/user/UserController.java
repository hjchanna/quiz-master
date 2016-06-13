/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.quiz_master.user;

import com.sv.quiz_master.user.model.Question;
import com.sv.quiz_master.user.model.QuestionPaper;
import com.sv.quiz_master.user.model.QuizSession;
import com.sv.quiz_master.user.model.QuizSessionUser;
import javax.servlet.http.HttpServletRequest;
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
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/quiz-session-new-user")
    public ModelAndView attemptNewUser() {
        ModelAndView modelAndView = new ModelAndView("user/quiz-session-new-user");

        return modelAndView;
    }

    @RequestMapping("/quiz-session-save-user")
    public String saveNewUser(HttpServletRequest servletRequest, @ModelAttribute QuizSessionUser quizSessionUser) {

        QuizSession quizSession = userService.newQuizSession();   //create new question session and save

        //set quiz sessin to user
        quizSessionUser.setQuizSession(quizSession);

        //save quiz session user
        quizSessionUser = userService.saveQuizSessionUser(quizSessionUser);

        //assign session variables
        servletRequest.getSession().setAttribute("quizsession", quizSession);
        servletRequest.getSession().setAttribute("questionpaper", quizSession.getQuestionPaper());
        servletRequest.getSession().setAttribute("quizuser", quizSessionUser);

        return "redirect:/user/quiz-session-pending";
    }

    @RequestMapping("/quiz-session-pending")
    public ModelAndView attemptPendingScreen(HttpServletRequest servletRequest) {
        ModelAndView modelAndView = new ModelAndView("user/quiz-pending");

//        QuizSession quizSession = (QuizSession) servletRequest.getSession().getAttribute("quizsession");
//        QuestionPaper questionPaper = (QuestionPaper) servletRequest.getSession().getAttribute("questionpaper");
//        QuizSessionUser quizSessionUser = (QuizSessionUser) servletRequest.getSession().getAttribute("quizuser");
        return modelAndView;
    }

    @RequestMapping("/quiz-session-start")
    public String startQuestionPaper(HttpServletRequest servletRequest) {
        //update quiz session as started and re assign to the session
        QuizSession quizSession = (QuizSession) servletRequest.getSession().getAttribute("quizsession");
        quizSession = userService.startQuizSession(quizSession);
        servletRequest.getSession().setAttribute("quizsession", quizSession);

        //update question paper last used on
        QuestionPaper questionPaper = (QuestionPaper) servletRequest.getSession().getAttribute("questionpaper");
        userService.updateQuestionPaperLastUsed(questionPaper);

        return "redirect:/user/quiz-session-next-question";
    }

    @RequestMapping("/quiz-session-next-question")
    public ModelAndView attemptNextQuestion(HttpServletRequest servletRequest) {
        ModelAndView modelAndView;

        QuizSession quizSession = (QuizSession) servletRequest.getSession().getAttribute("quizsession");
        QuestionPaper questionPaper = (QuestionPaper) servletRequest.getSession().getAttribute("questionpaper");
        Question question = (Question) servletRequest.getSession().getAttribute("question");
        QuizSessionUser quizSessionUser = (QuizSessionUser) servletRequest.getSession().getAttribute("quizuser");

        if (question == null) {//first question
            question = userService.getNextQuestion(questionPaper, -1);
        } else {
            question = userService.getNextQuestion(questionPaper, question.getIndexNo());
        }

        if (question == null) {//LAST QUESTION
             modelAndView = new ModelAndView("user/quiz-session-finish");
             
             userService.finishQuizSession(quizSession);
             
             //TODO: add result values
        }else{
            modelAndView = new ModelAndView("user/quiz-session-question");
        }

        servletRequest.getSession().setAttribute("question", question);

        return modelAndView;
    }

    @RequestMapping("/quiz-session-answer/{answer}/{duration}")
    public String answerQuestion(HttpServletRequest servletRequest,
            @PathVariable String answer,
            @PathVariable Integer duration) {

        QuizSession quizSession = (QuizSession) servletRequest.getSession().getAttribute("quizsession");
        QuestionPaper questionPaper = (QuestionPaper) servletRequest.getSession().getAttribute("questionpaper");
        Question question = (Question) servletRequest.getSession().getAttribute("question");
        QuizSessionUser quizSessionUser = (QuizSessionUser) servletRequest.getSession().getAttribute("quizuser");

        //save answer
        userService.saveAnswer(
                quizSession,
                quizSessionUser,
                questionPaper,
                question,
                answer,
                duration
        );

        //attempt next question
        return "redirect:/user/quiz-session-next-question";
    }

}
