Feature: Request Chaining

  Background: Initialize the common details
    Given url "http://localhost:9897"
    And headers {Accept : 'application/json', Content-Type : 'application/json'}

    Scenario: Perform request chaining
      #Create a job entry and extract jobid and jobtitle
      * def jobId = function() {return Math.floor((100) * Math.random());}
      * def jid = jobId()
      * def postResponse = call read("../CreateJobEntryReusableWithVariables.feature") { _url:'http://localhost:9897', _path:'/normal/webapi/add', _id:'#(jid)'}
      * def jobId = postResponse.responseJobId
      * def jobTitle = postResponse.responseJobTitle

      #Perform patch request using the above params and job desc and extract jobid and jobtitle
      Given path '/normal/webapi/update/details'
      * def jobDes = 'To develop andriod application and web application'
      And params {id:'#(jobId)', jobTitle:'#(jobTitle)', jobDescription:'#(jobDes)'}
      And request {}
      When method patch
      Then status 200
      * def patchJobId = response.jobId
      * def patchJobTitle = response.jobTitle

      #Perform get request using the above query parameters
      Given path '/normal/webapi/find'
      And params {id:'#(patchJobId)', jobTitle:'#(patchJobTitle)'}
      When method get
      Then status 200
      And match response.jobDescription == jobDes

      #Delete the job entry
      Given path '/normal/webapi/remove/'+patchJobId
      When method delete
      Then status 200