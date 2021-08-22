package com.api.automation;

import com.intuit.karate.Runner;
import com.intuit.karate.Runner.Builder;
import org.junit.jupiter.api.Test;

public class ParallelRunnerWithTags {

    @Test
    public void runKarateTestsUsingRunner(){
     //   Runner.parallel(getClass(), 5);
        Builder aRunner = new Builder();
        aRunner.path("classpath:com/api/automation");
        aRunner.parallel(5);
        aRunner.tags("@Smoke");
        Runner.parallel(aRunner);

    }
}
