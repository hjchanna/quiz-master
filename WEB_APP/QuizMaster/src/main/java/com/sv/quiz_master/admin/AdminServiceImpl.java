/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.quiz_master.admin;

import com.sv.quiz_master.admin.model.Question;
import com.sv.quiz_master.admin.model.QuestionPaper;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Mohan
 */
@Service
@Transactional
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminRepository adminRepository;

    @Override
    public List<QuestionPaper> getQuestionPaperList(String description) {
        return adminRepository.getQuestionPaperList(description);
    }

    @Override
    public QuestionPaper getQuestionPaper(Integer indexNo) {
        return adminRepository.getQuestionPaper(indexNo);
    }

    @Override
    public int saveQuestionPaper(QuestionPaper questionPaper) {
        if (questionPaper.getIndexNo()!=null) {
            questionPaper.setActive(true);
            return  adminRepository.updateQuestionPaper(questionPaper);
        }else{
            questionPaper.setActive(true);
            return adminRepository.saveQuestionPaper(questionPaper);
        }
    }

    @Override
    public int toggleEnabilityQuestionPaper(Integer indexNo) {
        QuestionPaper questionPaper = adminRepository.getQuestionPaper(indexNo);
        questionPaper.setActive(!questionPaper.isActive());

        adminRepository.saveQuestionPaper(questionPaper);

        return indexNo;
    }

//    @Override
//    public int updateQuestionPaper(QuestionPaper questionPaper) {
//        adminRepository.updateQuestionPaper(questionPaper);
//
//        return questionPaper.getIndexNo();
//    }
    @Override
    public List<Question> getQuestionList(Integer questionPaper, String question) {
        return adminRepository.getQuestionList(questionPaper, question);
    }

    @Override
    public Question getQuestion(Integer indexNo) {
        return adminRepository.getQuestion(indexNo);
    }

    @Override
    public Integer saveQuestion(Question question) {
        if (question.getIndexNo() != null) {
            question.setActive(true);
            return adminRepository.updateQuestion(question);
        } else {
            question.setActive(true);
            return adminRepository.saveQuestion(question);
        }
    }

//    @Override
//    public int updateQuestion(Question question) {
//        adminRepository.updateQuestion(question);
//        return question.getIndexNo();
//    }
    @Override
    public int toggleEnabilityQuestion(Integer questionPaperId, Integer questionId) {
        Question question = adminRepository.getQuestion(questionId);
        
        question.setActive(!question.isActive());

        adminRepository.saveQuestion(question);

        return questionPaperId;
    }

}
