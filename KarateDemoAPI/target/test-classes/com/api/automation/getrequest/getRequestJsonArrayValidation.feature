Feature: To test the GET end point of the application and perform json array validation

  Background: Setup the base path
    Given url 'http://localhost:9897'
    And print "=================Background step should execute first=================="

  Scenario: To get all the data from the application in JSON format and perform json array validation
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    And match response.[0].jobId == 1
    And match response.[0].jobTitle == 'Software Engg'
    And match response.[0].project[0].technology[0] == 'Kotlin'
    And match response.[0].project[0].technology[1] == 'SQL Lite'
    And match response.[0].project[0].technology[2] == 'Gradle'
    And match response.[0].experience[0] == 'Google'
    And match response.[0].experience[1] == 'Apple'
    And match response.[0].experience[2] == 'Mobile Iron'
    #Validate size of a json array
    And match response.[0].project[0].technology == '#[3]'
    And match response.[0].experience == '#[3]'
    # Usage of wild card character
    And match response.[0].project[0].technology[*] contains ['SQL Lite']
    And match response.[0].project[0].technology[*] contains ['SQL Lite','Kotlin']
    And match response.[0].project[0].technology[*] == ['Kotlin', 'SQL Lite', 'Gradle']