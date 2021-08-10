package com.api.automation;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class ParallelBuilder {

    @Test
    public void runKarateTestsUsingBuilder(){
        Builder aRunner = new Builder();
        aRunner.path("classpath:com/api/automation");
      //  aRunner.parallel(5);
        Results result = aRunner.parallel(5);
        System.out.println("Total Feature file count :: "+result.getFeatureCount());
        System.out.println("Total Scenario count :: "+result.getScenarioCount());
        System.out.println("Total Passed Scenario count :: "+result.getPassCount());
        System.out.println("Total Failed Scenario count :: "+result.getFailCount());

        Assertions.assertEquals(0, result.getFailCount(), "There are some failures");
    }
}
