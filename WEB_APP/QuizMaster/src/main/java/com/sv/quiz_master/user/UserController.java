/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.quiz_master.user;

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

    @RequestMapping("/quiz-session-list")
    public ModelAndView attemptQuizSessionList() {
        ModelAndView modelAndView = new ModelAndView("user/quiz-session-list");

        modelAndView.addObject("quizsessionlist", userService.getQuizSessionList());
        return modelAndView;
    }

    @RequestMapping("/quiz-session-new-user/{quizSession}")
    public ModelAndView attemptNewUser(@PathVariable Integer quizSession) {
        ModelAndView modelAndView = new ModelAndView("user/quiz-session-new-user");
        modelAndView.addObject("user", new QuizSessionUser());
        return modelAndView;
    }

    @RequestMapping("/quiz-session-save-user")
    public String saveNewUser(HttpServletRequest servletRequest, @ModelAttribute QuizSessionUser quizSessionUser) {

        quizSessionUser = userService.saveQuizSessionUser(quizSessionUser);

        Integer quizSession = quizSessionUser.getQuizSession().getIndexNo();
        Integer quizUser = quizSessionUser.getIndexNo();
        Integer questionPaper = quizSessionUser.getQuizSession().getQuestionPaper().getIndexNo();

        servletRequest.getSession().setAttribute("quizsession", quizSession);
        servletRequest.getSession().setAttribute("questionpaper", questionPaper);
        servletRequest.getSession().setAttribute("quizuser", quizUser);

        return "forward:/quiz-session-pending/" + quizSession + "/" + quizUser;
    }

    @RequestMapping("/quiz-session-pending/{quizSession}/{quizSessionUser}")
    public ModelAndView attemptPendingScreen(@PathVariable Integer quizSession, @PathVariable Integer quizSessionUser) {
        ModelAndView modelAndView = new ModelAndView("user/quiz-pending");

        userService.startQuizSession(quizSession, quizSessionUser);

        return modelAndView;
    }

    @RequestMapping("/quiz-session-start")
    public ModelAndView startQuestionPaper(HttpServletRequest servletRequest) {
        ModelAndView modelAndView = new ModelAndView("user/quiz-session-question");

        Integer quizSession = (Integer) servletRequest.getSession().getAttribute("quiz-session");

        modelAndView.addObject("question", userService.getNextQuestion(quizSession, -1));

        return modelAndView;
    }

    @RequestMapping("/quiz-session-answer/{question}/{answer}/{duration}")
    public ModelAndView answerQuestion(HttpServletRequest servletRequest,
            @PathVariable Integer question,
            @PathVariable String answer,
            @PathVariable Integer duration) {

        Integer quizSession = (Integer) servletRequest.getSession().getAttribute("quiz-session");
        Integer quizUser = (Integer) servletRequest.getSession().getAttribute("quiz-user");
        Integer questionPaper = (Integer) servletRequest.getSession().getAttribute("question-paper");

        //save answer
        userService.saveAnswer(
                quizSession,
                quizUser,
                questionPaper,
                question,
                answer,
                duration
        );

        //attempt next question
        ModelAndView modelAndView = new ModelAndView("user/quiz-session-question");

        modelAndView.addObject("question", userService.getNextQuestion(quizSession, question));

        return modelAndView;
    }

}
