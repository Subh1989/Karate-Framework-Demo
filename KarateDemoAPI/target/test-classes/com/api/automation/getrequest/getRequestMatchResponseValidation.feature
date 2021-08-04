Feature: To test the GET end point of the application using path Variable and Headers and peform match operations for validation

Background: Setup the base path
Given url 'http://localhost:9897'
And print "=================Background step should execute first=================="

Scenario: To get all the data from the application in JSON format using path variable and match the response
Given path '/normal/webapi/all'
And header Accept = 'application/json'
When method get
Then status 200
And print response
And match response == 
"""[
	{
		"jobId": 1,
		"jobTitle": "Software Engg",
		"project": [
			{
				"technology": [
					"Kotlin",
					"SQL Lite",
					"Gradle"
				],
				"projectName": "Movie App"
			}
		],
		"jobDescription": "To develop andriod application",
		"experience": [
			"Google",
			"Apple",
			"Mobile Iron"
		]
	}
]"""

Scenario: To get all the data from the application in JSON format using path variable and match the response using negate operator
Given path '/normal/webapi/all'
And header Accept = 'application/json'
When method get
Then status 200
And print response
And match response != 
"""[
	{
		"jobId": 2,
		"jobTitle": "Software Engg",
		"project": [
			{
				"technology": [
					"Kotlin",
					"SQL Lite",
					"Gradle"
				],
				"projectName": "Movie App"
			}
		],
		"jobDescription": "To develop andriod application",
		"experience": [
			"Google",
			"Apple",
			"Mobile Iron"
		]
	}
]"""

Scenario: To get all the data from the application in JSON format using path variable and match the nested json array and nested json object
Given path '/normal/webapi/all'
And header Accept = 'application/json'
When method get
Then status 200
And print response
And match response contains deep {"jobDescription": "To develop andriod application"}
And match response contains deep {"project":[{"projectName": "Movie App"}]}

Scenario: To get all the data from the application in JSON format using path variable and match the response header
Given path '/normal/webapi/all'
And header Accept = 'application/json'
When method get
Then status 200
And print response
And match response contains deep {"jobDescription": "To develop andriod application"}
And match response contains deep {"project":[{"projectName": "Movie App"}]}
And match header Content-Type == 'application/json'
And match header Connection == 'keep-alive'