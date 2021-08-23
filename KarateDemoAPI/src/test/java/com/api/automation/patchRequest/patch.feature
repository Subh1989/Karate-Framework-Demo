Feature: To test the patch endpoint and update job description of a job entry

  Background: Initialize the common details
    Given url "http://localhost:9897"
    And headers {Accept : 'application/json', Content-Type : 'application/json'}

    Scenario: Perform a patch request to update the job description of a job entry
      #Create a job entry
      * def jobId = function() {return Math.floor((100) * Math.random());}
      * def jid = jobId()
      * def postResponse = call read("../CreateJobEntryReusableWithVariables.feature") { _url:'http://localhost:9897', _path:'/normal/webapi/add', _id:'#(jid)'}
      # Peform patch request
      Given path '/normal/webapi/update/details'
      * def jobDes = 'To develop andriod application and web application'
      And params {id:'#(jid)', jobTitle:'Software Engg - Part2', jobDescription:'#(jobDes)'}
      And request {}
      When method patch
      Then status 200
      And match response.jobDescription == jobDes
      # perform delete request
      Given path '/normal/webapi/remove/'+jid
      When method delete
      Then status 200

  Scenario: Perform a patch request to update the job description of a job entry with a non existing job ID (404 error)
    Given path '/normal/webapi/update/details'
    * def jobDes = 'To develop andriod application and web application'
    * def jid = 80
    And params {id:'#(jid)', jobTitle:'Software Engg - Part2', jobDescription:'#(jobDes)'}
    And request {}
    When method patch
    Then status 404
    And match response.message == 'Failed to find job with id='+jid

  Scenario: Perform a patch request to update the job description of a job entry without job title (400 error)
    Given path '/normal/webapi/update/details'
    * def jobDes = 'To develop andriod application and web application'
    * def jid = 80
    And params {id:'#(jid)', jobDescription:'#(jobDes)'}
    And request {}
    When method patch
    Then status 400
    And match response.message == "Required String parameter 'jobTitle' is not present"
