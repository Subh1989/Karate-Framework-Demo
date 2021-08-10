Feature: variable creation demo

  Background: Create and Initialize common data
    * def app_name = "Google"
    * def firstNum = 10

  Scenario: To create a variable
    Given def a = 10
    And def b = "subhankar"
    And def c = a+10
    Then print "Print integer value :: ", a
    And print "String value :: ", b
    And print "Sum is :: ", c

    # Applicable to each and every scenario defined in the feature file
    Scenario: Access the value from background
      And print "App name from background is :: ", app_name
      * def sum = firstNum+20
      And print "Final sum is", sum