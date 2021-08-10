Feature: To test the end to end scenario

  Background:
    Given url 'http://localhost:9897/'
    And headers {Accept:'application/json', Content-Type:'application/json'}

  @tag1
  Scenario: Test the post end point to create a job entry
    Given path 'normal/webapi/add'
    * def payload = read("e2eData/e2eData.json")
    And request payload
    When method post
    Then status 201
    * def actualJobId = response.jobId

  Scenario: Test the get end point to validate the job entry
    Given path 'normal/webapi/all'
    When method get
    Then status 200
    And print response
    And match response.[*].jobTitle contains 'Software Engg - Part2'

  Scenario: Test the put end point to update the job entry
    * def postResp = call read("e2e.feature@tag1")
    * def jobID = postResp.actualJobId
    When path 'normal/webapi/update'
    * def payload = read("e2eData/e2eDataUpdate.json")
    And request payload
    When method put
    Then status 200

  Scenario: Test the delete end point to delete the job entry
    * def postResp = call read("e2e.feature@tag1")
    * def jobID = postResp.actualJobId
    Given path 'normal/webapi/remove/'+jobID
    When method delete
    Then status 200

  Scenario: Test the get end point to validate the job entry not present
    Given path 'normal/webapi/all'
    When method get
    Then status 200
    And print response
    And match response.[*].jobTitle !contains 'Software Engg - Part2'