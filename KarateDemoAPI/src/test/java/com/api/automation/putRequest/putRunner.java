package com.api.automation.putRequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class putRunner {

    @Test
    public Karate putRunTestUsingClassPath() {
        return Karate.run("classpath:com/api/automation/putRequest/updateJobEntry.feature");
    }
}
