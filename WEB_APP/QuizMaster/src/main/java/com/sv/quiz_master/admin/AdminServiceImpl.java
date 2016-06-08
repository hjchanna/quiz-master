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
    public List<QuestionPaper> getQuestionPaperList() {
        return adminRepository.getQuestionPaperList();
    }

    @Override
    public QuestionPaper getQuestionPaper(Integer indexNo) {
        return adminRepository.getQuestionPaper(indexNo);
    }

    @Override
    public int saveQuestionPaper(QuestionPaper questionPaper) {
        adminRepository.saveQuestionPaper(questionPaper);
        return questionPaper.getIndexNo();
    }

    @Override
    public int updateQuestionPaper(QuestionPaper questionPaper) {
        adminRepository.updateQuestionPaper(questionPaper);

        return questionPaper.getIndexNo();
    }

    @Override
    public List<Question> getQuestionList(Integer questionPaper) {
        return adminRepository.getQuestionList(questionPaper);
    }

    @Override
    public Question getQuestion(Integer indexNo) {
        return adminRepository.getQuestion(indexNo);
    }

    @Override
    public int saveQuestion(Question question) {
        adminRepository.saveQuestion(question);
        return question.getQuestionPaper().getIndexNo();
    }

    @Override
    public int updateQuestion(Question question) {
        adminRepository.updateQuestion(question);
        return question.getIndexNo();
    }

    @Override
    public List<Question> searchQuestionList(String question) {
        return adminRepository.searchQuestion(question);

    }

    @Override
    public int deleteQuestionPaper(Integer indexNo) {
        adminRepository.deleteQuestionPaper(indexNo);
        return indexNo;
    }

    @Override
    public List<QuestionPaper> searchQuestionPaper(String description) {
        return adminRepository.searchQuestionPaper(description);
    }
}
