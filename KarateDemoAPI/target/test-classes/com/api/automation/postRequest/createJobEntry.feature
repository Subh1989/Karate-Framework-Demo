Feature: To test the post endpoint and create a job entry

  Background: Initialize the common details
    Given url "http://localhost:9897"
    And headers {Accept : 'application/json', Content-Type : 'application/json'}

    @tag1
  Scenario: Create a job entry
    Given path '/normal/webapi/add'
    And request { 		"jobId": 5, 		"jobTitle": "Software Engg - Part2", 		"project": [ 			{ 				"technology": [ 					"Kotlin", 					"SQL Lite", 					"Gradle", 					"No Sql" 				], 				"projectName": "Movie App" 			} 		], 		"jobDescription": "To develop andriod application", 		"experience": [ 			"Google", 			"Apple", 			"Mobile Iron", 			"Facebook" 		] 	}
    When method post
    Then status 201
    And print response
    And match response.jobTitle == 'Software Engg - Part2'
    * def actualJobID = response.jobId
#      And path '/normal/webapi/remove/'+actualJobID
#      And method delete
#      And status 200

  Scenario: Delete the job entry tagged with tag1
    * def postResp = call read("createJobEntry.feature@tag1")
    * def jobId = postResp.actualJobID
    And path '/normal/webapi/remove/'+jobId
    When method delete
    Then status 200

    @tag2
  Scenario: Create a job entry with payload from external file
    Given path '/normal/webapi/add'
    * def payload = read("data/jobEntry.json")
    And request payload
    When method post
    Then status 201
    And print response
    And match response.jobTitle == 'Software Engg - Part2'
    * def actualJobID = response.jobId


    Scenario: Delete the job entry tagged with tag2
      * def postResp = call read("createJobEntry.feature@tag2")
      * def jobId = postResp.actualJobID
      And path '/normal/webapi/remove/'+jobId
      And method delete
      And status 200