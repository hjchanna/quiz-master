/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.quiz_master;

import org.hibernate.SessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 *
 * @author Mohan
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:**/root-context.xml", "classpath:**/admin-context.xml"})
public class AdminServiceTest {

    @Autowired
//    private AdminService adminService;
    private SessionFactory sessionFactory;

    @Test
    public void testQuestionList() {
//        List list = adminService.getQuestionPaperList();

//        Assert.assertEquals(list.size(), 0);
    }

}
