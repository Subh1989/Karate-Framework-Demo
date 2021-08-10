package com.api.automation.postRequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class postRunner {

    @Test
    public Karate postRunTestUsingClassPath() {
        return Karate.run("classpath:com/api/automation/postRequest/createJobEntry.feature");
    }
}