Feature: create user

  Background:
    * url url

  Scenario Outline: create user returns 201 and expected user details
    Given path '/users'
    And request {'name': '<name>', 'job': '<job>'}
    When method post
    Then status 201
    And match $.name == '<name>'
    And match $.job == '<job>'
    And match $.id == '#notnull'
    And match $.createdAt == '#notnull'
    Examples:
      | name | job   |
      | tom  | qa    |
      | peter| dev   |
      | sam  | ba    |