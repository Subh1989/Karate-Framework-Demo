package com.api.automation.deleteRequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestRunnerDelete {

    @Test
    public Karate deleteRunTestUsingClassPath() {
        return Karate.run("classpath:com/api/automation/deleteRequest/delete.feature");
    }
}
