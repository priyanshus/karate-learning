Feature: Karate features

  Background:
    Given url 'http://localhost:8080'

  Scenario: mocking feature of karate works as expected
    Given path '/books'
    When method get
    Then status 200
    And match $.id == '#notnull'

  Scenario: encoded post request body returns expected response
    Given path '/book'
    And request 'ewogICJlbWFpbCI6ICJzb21lQG1haWwuY29tIiwKICAicGFzc3dvcmQiOiAidGVzdEAxMjMiCn0='
    When method post
    Then status 200
    And match response == {"email": "some@mail.com","password": "test@123"}

  Scenario: using json file as post request body returns expected response
    Given path '/book'
    And request read('sample.json')
    When method post
    Then status 200
    And match response == 'not a valid request body'
