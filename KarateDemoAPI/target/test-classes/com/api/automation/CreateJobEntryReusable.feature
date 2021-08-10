Feature: To test the post end point in creating a job entry for reusable scenarios
  Background:
    Given url "http://localhost:9897"
    And headers {Accept : 'application/json', Content-Type : 'application/json'}

    Scenario:
      Given path '/normal/webapi/add'
      And request { 		"jobId": 800, 		"jobTitle": "Software Engg - Part2", 		"project": [ 			{ 				"technology": [ 					"Kotlin", 					"SQL Lite", 					"Gradle", 					"No Sql" 				], 				"projectName": "Movie App" 			} 		], 		"jobDescription": "To develop andriod application", 		"experience": [ 			"Google", 			"Apple", 			"Mobile Iron", 			"Facebook" 		] 	}
      When method post
      Then status 201
      * def responseJobId = response.jobId