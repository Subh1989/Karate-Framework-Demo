Feature: To perform Schema Validation
  To perform schema validation for post request

  Background: Initialize the common details
    Given url "http://localhost:9897"
    And headers {Accept : 'application/json', Content-Type : 'application/json'}

  Scenario: Create a job entry with payload from external file and perform schema validation
    Given path '/normal/webapi/add'
    * def payload = read("data/jobEntry.json")
    And request payload
    When method post
    Then status 201
    And print response
    And match response ==
    """
    {
	"jobId": '#number',
	"jobTitle": '#string',
	"jobDescription": '#string',
	"experience": '#[] #string',
	"project": '#[] #object'
}
    """
    * def actualJobID = response.jobId
    And path '/normal/webapi/remove/'+actualJobID
    And method delete
    And status 200

  Scenario: Create a job entry with payload from external file and perform schema validation from external file
    Given path '/normal/webapi/add'
    * def payload = read("data/jobEntry.json")
    And request payload
    When method post
    Then status 201
    And print response
    * def schemaValidationResponse = read("data/schemaValidation.json")
    And match response == schemaValidationResponse
    * def actualJobID = response.jobId
    And path '/normal/webapi/remove/'+actualJobID
    And method delete
    And status 200