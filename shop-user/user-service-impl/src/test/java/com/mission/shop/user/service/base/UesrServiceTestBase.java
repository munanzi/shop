package com.mission.shop.user.service.base;

import org.junit.Before;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

/**
 * User: hexizheng
 * Date: 13-9-15
 * Time: 
 */


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:user-service-test.xml"})
@TransactionConfiguration(transactionManager="user-transactionManager",defaultRollback=true)
public abstract class UesrServiceTestBase extends AbstractTransactionalJUnit4SpringContextTests{
    private String sqlFile;
    
    protected final String CONTEXT = "sql/";

    public abstract String getSqlFilePath();
    @Before
    public void init() {
        sqlFile = getSqlFilePath();
        if (sqlFile != null) {
            executeSqlScript(sqlFile, false);
        }
    }

}