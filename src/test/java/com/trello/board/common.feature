@ignore
Feature: Common Features

  @scenario=deleteboard
  Scenario: Delete board returns 200
    Given url trelloUrl
    And param key = appKey
    And param token = appToken
    And path 'boards/', __arg.id
    When method delete
    Then status 200

  @scenario=createboard
  Scenario: Create board returns 200
    Given url trelloUrl
    And param key = appKey
    And param token = appToken
    And path 'boards'
    And param name = 'trial'
    And request {}
    When method post
    Then status 200
    And match $.id == '#notnull'
    And match $.name == 'trial'

  @scenario=getlists
  Scenario: Get lists on a board returns 200
    Given url trelloUrl
    And param key = appKey
    And param token = appToken
    And path 'boards', __arg.id, 'lists'
    When method get
    Then status 200