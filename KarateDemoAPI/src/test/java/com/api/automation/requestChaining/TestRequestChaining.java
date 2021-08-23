package com.api.automation.requestChaining;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestRequestChaining {

    @Test
    public Karate requestChaining() {
        return Karate.run("classpath:com/api/automation/requestChaining/requestChaining.feature");
    }
}
