Feature: To test the put end point in updating an existing job entry

  Background:
    Given url "http://localhost:9897"
    And headers {Accept : 'application/json', Content-Type : 'application/json'}

  Scenario: To update an existing job entry
      #Create a new job entry
    Given path '/normal/webapi/add'
    * def jobId = function() {return Math.floor((100) * Math.random());}
    * def id = jobId()
    And request { 		"jobId": '#(id)', 		"jobTitle": "Software Engg - Part2", 		"project": [ 			{ 				"technology": [ 					"Kotlin", 					"SQL Lite", 					"Gradle", 					"No Sql" 				], 				"projectName": "Movie App" 			} 		], 		"jobDescription": "To develop andriod application", 		"experience": [ 			"Google", 			"Apple", 			"Mobile Iron", 			"Facebook" 		] 	}
    When method post
    Then status 201

      # Update the job entry
    Given path '/normal/webapi/update'
    And request
      """
      {
    "jobId": '#(id)',
    "jobTitle": "Software Engg - Part2",
    "jobDescription": "To develop andriod application and web application",
    "experience": [
        "Google",
        "Apple",
        "Mobile Iron",
        "Facebook"
    ],
    "project": [
        {
            "projectName": "Movie App",
            "technology": [
                "Kotlin",
                "SQL Lite",
                "Gradle",
                "No Sql"
            ]
        },
        {
            "projectName": "Web App",
            "technology": [
                "Selenium",
                "UFT",
                "RPA"
            ]
        }
    ]
}
      """
    When method put
    Then status 200
    And path '/normal/webapi/remove/'+id
    And method delete
    And status 200

    ## Creating job entry from another feature file and using it in the below scenario for updating it
  Scenario: To update an existing job entry by calling another feature file
    Given call read("../CreateJobEntryReusable.feature")
    Given path '/normal/webapi/update'
    And request
      """
      {
    "jobId": 800,
    "jobTitle": "Software Engg - Part2",
    "jobDescription": "To develop andriod application and web application",
    "experience": [
        "Google",
        "Apple",
        "Mobile Iron",
        "Facebook"
    ],
    "project": [
        {
            "projectName": "Movie App",
            "technology": [
                "Kotlin",
                "SQL Lite",
                "Gradle",
                "No Sql"
            ]
        },
        {
            "projectName": "Web App",
            "technology": [
                "Selenium",
                "UFT",
                "RPA"
            ]
        }
    ]
}
      """
    When method put
    Then status 200
    And path '/normal/webapi/remove/800'
    And method delete
    And status 200

    ## Creating job entry from another feature file and using the variable through shared context
  Scenario: To update an existing job entry by calling another feature file through shared context
    * def postResponse = call read("../CreateJobEntryReusable.feature")
    * def jobId = postResponse.responseJobId
    Given path '/normal/webapi/update'
    And request
      """
      {
    "jobId": '#(jobId)',
    "jobTitle": "Software Engg - Part2",
    "jobDescription": "To develop andriod application and web application",
    "experience": [
        "Google",
        "Apple",
        "Mobile Iron",
        "Facebook"
    ],
    "project": [
        {
            "projectName": "Movie App",
            "technology": [
                "Kotlin",
                "SQL Lite",
                "Gradle",
                "No Sql"
            ]
        },
        {
            "projectName": "Web App",
            "technology": [
                "Selenium",
                "UFT",
                "RPA"
            ]
        }
    ]
}
      """
    When method put
    Then status 200
    And path '/normal/webapi/remove/'+jobId
    And method delete
    And status 200

    ## Passing the variables to the helper feature file from the below scenario
  Scenario: To update an existing job entry by calling another feature file with variables
    * def jobId = function() {return Math.floor((100) * Math.random());}
    * def jid = jobId()
    * def postResponse = call read("../CreateJobEntryReusableWithVariables.feature") { _url:'http://localhost:9897', _path:'/normal/webapi/add', _id:'#(jid)'}
    Given path '/normal/webapi/update'
    And request
      """
      {
    "jobId": '#(jid)',
    "jobTitle": "Software Engg - Part2",
    "jobDescription": "To develop andriod application and web application",
    "experience": [
        "Google",
        "Apple",
        "Mobile Iron",
        "Facebook"
    ],
    "project": [
        {
            "projectName": "Movie App",
            "technology": [
                "Kotlin",
                "SQL Lite",
                "Gradle",
                "No Sql"
            ]
        },
        {
            "projectName": "Web App",
            "technology": [
                "Selenium",
                "UFT",
                "RPA"
            ]
        }
    ]
}
      """
    When method put
    Then status 200
    And path '/normal/webapi/remove/'+jid
    And method delete
    And status 200