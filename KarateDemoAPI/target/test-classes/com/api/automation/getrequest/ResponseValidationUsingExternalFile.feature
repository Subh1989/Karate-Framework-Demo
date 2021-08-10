Feature: To test the GET end point of the application and validate the response from an external file

  Background: Setup the base path
    Given url 'http://localhost:9897'
    And print "=================Background step should execute first=================="

  Scenario: To get all the data from the application in JSON format and validate the response from an external file
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    * def expectedResponse = read("../JsonResponse.json")
    And print "Expected Response is :: ", expectedResponse
    And match response == expectedResponse

  Scenario: To get all the data from the application in XML format and validate the response from an external file
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    * def expectedXml = read("../XMLResponse.xml")
    And print "Expected XML is :: ", expectedXml
    And match response == expectedXml
