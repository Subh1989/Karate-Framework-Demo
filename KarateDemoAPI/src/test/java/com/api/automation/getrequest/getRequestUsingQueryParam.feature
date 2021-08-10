Feature: To test the GET end point of the application using query parameter
  GET end point /normal/webapi/find

  Background:
    Given url 'http://localhost:9897'
    And headers {Accept : 'application/json', Content-Type : 'application/json'}

  Scenario: To get the data from the application in JSON format using query parameter
    * def jobId = function() {return Math.floor((100) * Math.random());}
    * def jid = jobId()
    * def postRequest = call read("../CreateJobEntryReusableWithVariables.feature") { _url:'http://localhost:9897', _path:'/normal/webapi/add', _id:'#(jid)'}
   # Now perform the GET request with query parameters
    Given path '/normal/webapi/find'
    #And param id = jid
    #And param jobTitle = 'Software Engg - Part2'
    And params {id:'#(jid)', jobTitle:'Software Engg - Part2'}
    When method get
    Then status 200
    And match response.jobId == jid
    And path '/normal/webapi/remove/'+jid
    And method delete
    And status 200

  Scenario: Test the get end point using query parameter to validate the data is not present in the application
    * def jobId = function() {return Math.floor((100) * Math.random());}
    * def jid = jobId()
    * def postRequest = call read("../CreateJobEntryReusableWithVariables.feature") { _url:'http://localhost:9897', _path:'/normal/webapi/add', _id:'#(jid)'}
   # Now perform the GET request with query parameters
    Given path '/normal/webapi/find'
    #And param id = jid
    #And param jobTitle = 'Software Engg - Part2'
    And params {id:55555, jobTitle:'Software Engg - Part2'}
    When method get
    Then status 404
    And path '/normal/webapi/remove/'+jid
    And method delete
    And status 200
		