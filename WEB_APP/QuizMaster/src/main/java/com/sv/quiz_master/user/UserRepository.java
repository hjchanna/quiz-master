/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.quiz_master.user;

import com.sv.quiz_master.user.model.Question;
import com.sv.quiz_master.user.model.QuestionPaper;
import com.sv.quiz_master.user.model.QuizSessionUserAnswer;
import java.io.Serializable;

/**
 *
 * @author Mohan
 */
public interface UserRepository {

    public Serializable saveObject(Object object);

    public void updateObject(Object object);

    public Question getNextQuestion(QuestionPaper quizSession, Question question);

    public int saveQuizSessionUserAnswer(QuizSessionUserAnswer quizSessionUserAnswer);

}
