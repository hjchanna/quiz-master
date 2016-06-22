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
import com.sv.quiz_master.user.model.QuizSessionUserAnswer;
import com.sv.quiz_master.zsystem.QuizSessionUserStatus;
import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

    @RequestMapping("/quiz-session")
    public String attemptQuizSession(HttpServletRequest servletRequest) {
//        QuizSession quizSession = (QuizSession) servletRequest.getSession().getAttribute("quizsession");
        QuizSession quizSession = getQuizSession(servletRequest);

        if (quizSession == null) {
            return "redirect:/user/quiz-session-new";
        } else {
            return "redirect:/user/quiz-session-new-user";
        }
    }

    @RequestMapping("/quiz-session-new")
    public ModelAndView attemptNewQuizSession() {
        ModelAndView modelAndView = new ModelAndView("user/quiz-session-new");

        modelAndView.addObject("quizsession", new QuizSession());

        return modelAndView;
    }

    @RequestMapping("/quiz-session-save")
    public String saveNewQuizSession(HttpServletRequest servletRequest, HttpServletResponse servletResponse, @ModelAttribute QuizSession quizSession) {

        quizSession = userService.newQuizSession(quizSession);
//        servletRequest.getSession().setAttribute("quizsession", quizSession);

        Cookie cookie = new Cookie("quizsession", String.valueOf(quizSession.getIndexNo()));
        servletResponse.addCookie(cookie);

        return "redirect:/user/quiz-session-new-user";
    }

    @RequestMapping("/quiz-session-finish")
    public String finishQuizSession(HttpServletRequest servletRequest, HttpServletResponse servletResponse) {
//        QuizSession quizSession = (QuizSession) servletRequest.getSession().getAttribute("quizsession");

        QuizSession quizSession = getQuizSession(servletRequest);
        userService.finishQuizSession(quizSession);
//        servletRequest.getSession().setAttribute("quizsession", null);

        Cookie cookie = new Cookie("quizsession", null);
        servletResponse.addCookie(cookie);

        return "redirect:/";
    }

    @RequestMapping("/quiz-session-new-user")
    public ModelAndView attemptNewUser() {
        ModelAndView modelAndView = new ModelAndView("user/quiz-session-new-user");

        modelAndView.addObject("quizSessionUser", new QuizSessionUser());

        return modelAndView;
    }

    @RequestMapping("/quiz-session-save-user")
    public String saveNewUser(HttpServletRequest servletRequest, @ModelAttribute QuizSessionUser quizSessionUser) {
//        QuizSession quizSession = (QuizSession) servletRequest.getSession().getAttribute("quizsession");
        QuizSession quizSession = getQuizSession(servletRequest);

        //set quiz sessin to user
        quizSessionUser.setQuizSession(quizSession);
        quizSessionUser.setStatus(QuizSessionUserStatus.CONNECTED);

        //save quiz session user
        quizSessionUser = userService.saveQuizSessionUser(quizSessionUser);

//        System.out.println(quizSessionUser.getQuizSession().getLocation());
//        System.out.println(quizSessionUser.getStatus());
        //assign session variables
        servletRequest.getSession().setAttribute("questionpaper", quizSessionUser.getQuestionPaper());
        servletRequest.getSession().setAttribute("quizuser", quizSessionUser);
        servletRequest.getSession().setAttribute("language", quizSessionUser.getLanguage());

        return "redirect:/user/quiz-session-pending";
    }

    @RequestMapping("/quiz-session-pending")
    public ModelAndView attemptPendingScreen(HttpServletRequest servletRequest) {
        ModelAndView modelAndView = new ModelAndView("user/quiz-session-pending");

        return modelAndView;
    }

    @RequestMapping("/quiz-session-start")
    public String startQuestionPaper(HttpServletRequest servletRequest) {
        //update question paper last used on
        QuestionPaper questionPaper = (QuestionPaper) servletRequest.getSession().getAttribute("questionpaper");
        userService.updateQuestionPaperLastUsed(questionPaper);

        return "redirect:/user/quiz-session-next-question";
    }

    @RequestMapping("/quiz-session-next-question")
    public ModelAndView attemptNextQuestion(HttpServletRequest servletRequest) {
        ModelAndView modelAndView;

        Boolean allowNext = (Boolean) servletRequest.getSession().getAttribute("allownext");

        QuestionPaper questionPaper = (QuestionPaper) servletRequest.getSession().getAttribute("questionpaper");
        Question question = (Question) servletRequest.getSession().getAttribute("question");
        QuizSessionUser quizSessionUser = (QuizSessionUser) servletRequest.getSession().getAttribute("quizuser");
        String language = (String) servletRequest.getSession().getAttribute("language");
        System.out.println(language);

        if (allowNext != null ? allowNext : true) { //attempt next question
            if (question == null) {//first question
                question = userService.getNextQuestion(questionPaper, null);
            } else {
                question = userService.getNextQuestion(questionPaper, question);
            }
        }

        if (question == null) {//LAST QUESTION
            modelAndView = new ModelAndView("user/quiz-session-finish");

            List<QuizSessionUserAnswer> answers = userService.listResults(quizSessionUser);
            Integer totalAnswers = 0;
            Integer correctAnswers = 0;
            Integer totalDuration = 0;
            for (QuizSessionUserAnswer answer : answers) {
                totalAnswers++;
                correctAnswers += answer.isCorrect() ? 1 : 0;
                totalDuration += answer.getDuration();
            }
            Double correctPercent = ((double) correctAnswers) / ((double) totalAnswers) * 100;

            modelAndView.addObject("totalAnswers", totalAnswers);
            modelAndView.addObject("correctAnswers", correctAnswers);
            modelAndView.addObject("correctPercent", String.format("%.2f", correctPercent));
            modelAndView.addObject("totalDuration", totalDuration);
        } else {
            modelAndView = new ModelAndView("user/quiz-session-question");
        }

        servletRequest.getSession().setAttribute("question", question);
        servletRequest.getSession().setAttribute("allownext", false);
        modelAndView.addObject("language", language);

        return modelAndView;
    }

    @RequestMapping("/quiz-session-answer/{answer}/{duration}")
    public String answerQuestion(HttpServletRequest servletRequest,
            @PathVariable String answer,
            @PathVariable Integer duration) {

//        QuizSession quizSession = (QuizSession) servletRequest.getSession().getAttribute("quizsession");
        QuizSession quizSession = getQuizSession(servletRequest);

        QuestionPaper questionPaper = (QuestionPaper) servletRequest.getSession().getAttribute("questionpaper");
        Question question = (Question) servletRequest.getSession().getAttribute("question");
        QuizSessionUser quizSessionUser = (QuizSessionUser) servletRequest.getSession().getAttribute("quizuser");

        servletRequest.getSession().setAttribute("allownext", true);

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

    @RequestMapping("/quiz-session-skip/{duration}")
    public String skipQuestion(HttpServletRequest servletRequest, @PathVariable Integer duration) {
//        QuizSession quizSession = (QuizSession) servletRequest.getSession().getAttribute("quizsession");

        QuizSession quizSession = getQuizSession(servletRequest);

        QuestionPaper questionPaper = (QuestionPaper) servletRequest.getSession().getAttribute("questionpaper");
        Question question = (Question) servletRequest.getSession().getAttribute("question");
        QuizSessionUser quizSessionUser = (QuizSessionUser) servletRequest.getSession().getAttribute("quizuser");

        servletRequest.getSession().setAttribute("allownext", true);

        //save answer
        userService.saveAnswer(
                quizSession,
                quizSessionUser,
                questionPaper,
                question,
                "N/A",
                duration
        );

        //attempt next question
        return "redirect:/user/quiz-session-next-question";
    }

    @RequestMapping("/quiz-clear")
    public String clearQuiz(HttpServletRequest servletRequest) {
        servletRequest.getSession().setAttribute("questionpaper", null);
        servletRequest.getSession().setAttribute("quizuser", null);
        servletRequest.getSession().setAttribute("question", null);
        servletRequest.getSession().setAttribute("allownext", null);

        return "redirect:/user/quiz-session-new-user";
    }

    private QuizSession getQuizSession(HttpServletRequest servletRequest) {
        Cookie cookie = null;
        for (Cookie cooky : servletRequest.getCookies()) {
            if (cooky != null) {
                if (cooky.getName().equals("quizsession")) {
                    cookie = cooky;
                }
            }
        }

        if (cookie == null) {
            return null;
        }

        if (cookie.getValue().isEmpty()) {
            return null;
        }

        return userService.getQuizSession(cookie.getValue());
    }

}
