Feature: To test the get end point with basic authentication
  end point /secure/webapi/all

  Background: Initialize common items
    Given url 'http://localhost:9897'

    Scenario: To test the get end point with valid secure authorization key
      Given path '/secure/webapi/all'
      And headers {Accept:'application/json', Authorization:'Basic YWRtaW46d2VsY29tZQ=='}
      When method get
      Then status 200
      And match response == '#notnull'

  Scenario: To test the get end point without valid secure authorization key
    Given path '/secure/webapi/all'
    And headers {Accept:'application/json'}
    When method get
    Then status 401
    And match response == '#notnull'

  Scenario: To test the get end point with invalid secure authorization key
    Given path '/secure/webapi/all'
    And headers {Accept:'application/json', Authorization:'Basic YXV0aG9yOndlbGNvbWUx'}
    When method get
    Then status 401

  Scenario: To test the get end point with valid secure authorization key using javascript function
    Given path '/secure/webapi/all'
    * def auth = call read('../../basicAuth.js') {username:'admin', password:'welcome'}
    * print "Basic authentication ==> ", auth
    And headers {Accept:'application/json', Authorization:'#(auth)'}
    When method get
    Then status 200
    And match response == '#notnull'