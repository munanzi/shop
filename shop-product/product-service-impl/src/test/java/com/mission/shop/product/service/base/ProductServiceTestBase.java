package com.mission.shop.product.service.base;

import org.junit.Before;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import javax.annotation.Resource;
import javax.sql.DataSource;

/**
 * User: hexizheng
 * Date: 13-9-15
 * Time: 
 */


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:product-service-test.xml"})
@TransactionConfiguration(transactionManager="product-transactionManager",defaultRollback=true)
public abstract class ProductServiceTestBase extends AbstractTransactionalJUnit4SpringContextTests{
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

    @Override
    @Resource(name = "product-dataSource")
    public void setDataSource(DataSource dataSource) {
        super.setDataSource(dataSource);

    }
}