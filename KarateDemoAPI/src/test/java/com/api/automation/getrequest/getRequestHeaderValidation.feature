Feature: To test the GET end point of the application using path Variable and Headers

Background: Setup the base path
Given url 'http://localhost:9897'
And print "=================Background step should execute first=================="

Scenario: To get all the data from the application in JSON format using path variable and print the response
Given path '/normal/webapi/all'
And header Accept = 'application/json'
When method get
Then status 200
		
		
Scenario: To get all the data from the application in XML format using path variable and print the response
Given path '/normal/webapi/all'
And header Accept = 'application/xml'
When method get
Then status 200
And print response