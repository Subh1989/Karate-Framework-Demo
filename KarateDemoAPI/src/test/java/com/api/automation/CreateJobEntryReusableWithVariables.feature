Feature: To test the post end point in creating a job entry for reusable scenarios
  Background:
    Given url _url
    And headers {Accept : 'application/json', Content-Type : 'application/json'}

    Scenario:
      Given path _path
      And print " url :: ", _url
      And print " path :: ", _path
      And print " id :: ", _id
      And request { 		"jobId": '#(_id)', 		"jobTitle": "Software Engg - Part2", 		"project": [ 			{ 				"technology": [ 					"Kotlin", 					"SQL Lite", 					"Gradle", 					"No Sql" 				], 				"projectName": "Movie App" 			} 		], 		"jobDescription": "To develop andriod application", 		"experience": [ 			"Google", 			"Apple", 			"Mobile Iron", 			"Facebook" 		] 	}
      When method post
      Then status 201
      * def responseJobId = response.jobId