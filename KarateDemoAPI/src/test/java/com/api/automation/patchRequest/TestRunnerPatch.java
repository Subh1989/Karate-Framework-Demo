package com.api.automation.patchRequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestRunnerPatch {

    @Test
    public Karate patchRunTestUsingClassPath() {
        return Karate.run("classpath:com/api/automation/patchRequest/patch.feature");
    }
}
