Feature: To test the GET end point of the application and perform xml response validation

  Background: Setup the base path
    Given url 'http://localhost:9897'
    And print "=================Background step should execute first=================="

  Scenario: To get all the data from the application in XML format and perform xml response validation
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And print response
    And match response/List/item/jobTitle == 'Software Engg'
    And match response/List/item/jobDescription == 'To develop andriod application'
    And match response/List/item/experience/experience[1] == 'Google'
    And match response/List/item/experience/experience[2] == 'Apple'
    And match response/List/item/experience/experience[3] == 'Mobile Iron'
    And match response//List/item/project/project/projectName == 'Movie App'

# without using response also it will work
    And match /List/item/project/project/technology/technology[1] == 'Kotlin'
    And match /List/item/project/project/technology/technology[2] == 'SQL Lite'
    And match /List/item/project/project/technology/technology[3] == 'Gradle'

# Traverse xml using '.' just like json
    And match response.List.item.project.project.technology.technology[0] == 'Kotlin'

