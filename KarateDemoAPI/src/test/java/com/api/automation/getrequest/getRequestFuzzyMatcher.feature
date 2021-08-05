Feature: To test the GET end point of the application and perform Fuzzy matcher validation

  Background: Setup the base path
    Given url 'http://localhost:9897'
    And print "=================Background step should execute first=================="

  Scenario: To get all the data from the application in JSON format and perform Fuzzy matcher validation
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    And match response.[0].jobId == '#present'
    And match response.[0].jobId == '#number'
    And match response.[0].jobTitle == '#notnull'
    And match response.[0].jobTitle == '#string'
    And match response.[0].project[0].technology == '#array'
    And match response.[0].experience == '#array'


  Scenario: To get all the data from the application in XML format and perform Fuzzy matcher validation
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And print response
    And match response/List/item/jobTitle == '#string'
    And match response/List/item/jobDescription == '#notnull'
    And match response/List/item/experience/experience == '#array'
    And match response//List/item/project/project/projectName == '#string'