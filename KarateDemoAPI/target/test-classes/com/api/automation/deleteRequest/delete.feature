Feature: To test the delete endpoint and peform deletion of a job entry

  Background: Initialize the common details
    Given url "http://localhost:9897"
    And headers {Accept : 'application/json', Content-Type : 'application/json'}

    Scenario: To delete a job entry
      #Create a job entry
      * def jobId = function() {return Math.floor((100) * Math.random());}
      * def jid = jobId()
      * def postResponse = call read("../CreateJobEntryReusableWithVariables.feature") { _url:'http://localhost:9897', _path:'/normal/webapi/add', _id:'#(jid)'}
      #Delete the job entry
      Given path '/normal/webapi/remove/'+jid
      When method delete
      Then status 200
      #Get the deleted job entry using query param
      Given path '/normal/webapi/find'
      And params {id:'#(jid)', jobTitle:'Software Engg - Part2'}
      When method get
      Then status 404

  Scenario: To delete a job entry twice (404 error)
      #Create a job entry
    * def jobId = function() {return Math.floor((100) * Math.random());}
    * def jid = jobId()
    * def postResponse = call read("../CreateJobEntryReusableWithVariables.feature") { _url:'http://localhost:9897', _path:'/normal/webapi/add', _id:'#(jid)'}
      #Delete the job entry
    Given path '/normal/webapi/remove/'+jid
    When method delete
    Then status 200
      #Get the deleted job entry using query param
    Given path '/normal/webapi/find'
    And params {id:'#(jid)', jobTitle:'Software Engg - Part2'}
    When method get
    Then status 404
    # Delete the job entry twice
    Given path '/normal/webapi/remove/'+jid
    When method delete
    Then status 404