package com.api.automation.authentication.secureGetRequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestSecureGetRequest {

    @Test
    public Karate secureGetRequest() {
        return Karate.run("classpath:com/api/automation/authentication/secureGetRequest/secureGetRequest.feature");
    }
}
