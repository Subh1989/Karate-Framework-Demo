Feature: To test the GET end point of the application

Scenario: To get all the data from the application in JSON format
Given url 'http://localhost:9897/normal/webapi/all'
When method get
#Then status 201 # this will return an error as the status code is 200
Then status 200
		