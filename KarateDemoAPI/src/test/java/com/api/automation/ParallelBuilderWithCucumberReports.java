package com.api.automation;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class ParallelBuilderWithCucumberReports {

    @Test
    public void runKarateTestsUsingBuilderCucumberReports(){
        Builder aRunner = new Builder();
        aRunner.path("classpath:com/api/automation");
      //  aRunner.parallel(5);
        Results result = aRunner.parallel(5);
        System.out.println("Total Feature file count :: "+result.getFeatureCount());
        System.out.println("Total Scenario count :: "+result.getScenarioCount());
        System.out.println("Total Passed Scenario count :: "+result.getPassCount());
        System.out.println("Total Failed Scenario count :: "+result.getFailCount());
        cucumberReports(result.getReportDir());
        Assertions.assertEquals(0, result.getFailCount(), "There are some failures");
    }

    //reportDirLocation --> C:\Users\nandi\OneDrive\Desktop\Karate Framework\Karate-Framework-Demo\KarateDemoAPI\target\surefire-reports
    private void cucumberReports(String reportDirLocation){
        File reportDir = new File(reportDirLocation);
        Collection<File> jsonCollections = FileUtils.listFiles(reportDir, new String[] {"json"}, true);

        List<String> jsonFiles = new ArrayList<String>();
        jsonCollections.forEach(file -> jsonFiles.add(file.getAbsolutePath()));

        Configuration config = new Configuration(reportDir, "Karate Run");
        ReportBuilder reportBuilder = new ReportBuilder(jsonFiles, config);
        reportBuilder.generateReports();


    }
}
