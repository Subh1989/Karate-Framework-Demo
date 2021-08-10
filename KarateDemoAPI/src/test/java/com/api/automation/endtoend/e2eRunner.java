package com.api.automation.endtoend;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class e2eRunner {

    @Test
    public Karate testRunner(){

        return Karate.run("classpath:com/api/automation/endtoend/e2e.feature");
    }
}
