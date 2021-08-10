Feature: To test the post endpoint and create a job entry

  Background: Initialize the common details
    Given url "http://localhost:9897"
    And headers {Accept : 'application/json', Content-Type : 'application/json'}

    Scenario: Create a job entry using embedded expression
      Given path '/normal/webapi/add'
      * def jobId = function() {return Math.floor((100) * Math.random());}
      And request { 		"jobId": '#(jobId())', 		"jobTitle": "Software Engg - Part2", 		"project": [ 			{ 				"technology": [ 					"Kotlin", 					"SQL Lite", 					"Gradle", 					"No Sql" 				], 				"projectName": "Movie App" 			} 		], 		"jobDescription": "To develop andriod application", 		"experience": [ 			"Google", 			"Apple", 			"Mobile Iron", 			"Facebook" 		] 	}
      When method post
      Then status 201
      And print response
      And match response.jobTitle == 'Software Engg - Part2'
      * def actualJobID = response.jobId
      And path '/normal/webapi/remove/'+actualJobID
      And method delete
      And status 200