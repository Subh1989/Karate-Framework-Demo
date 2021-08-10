Feature: To execute the Java Script Function
  Scenario: Execute Java Script Function with and without parameter
    * def getIntVal = function() {return 10;}
    And print "Integer Value is :: ", getIntVal()
    * def getRandomVal = function() {return Math.floor((100) * Math.random());}
    And print "Random Value is :: ", getRandomVal()
    * def getParameterisedVal = function(a,b) {return a + b}
    And print "Sum is :: ", getParameterisedVal(10,20)