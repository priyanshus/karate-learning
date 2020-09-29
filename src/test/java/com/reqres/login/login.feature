Feature: login

  Background:
    * url url

  Scenario Outline: successful login returns 200 and token
    Given path '/login'
    And request {'email': '<email>', 'password': '<password>'}
    When method post
    Then status 200
    And match $.token == '#notnull'
    And match response == {'token': '#notnull'}
    Examples:
      | email | password   |
      | eve.holt@reqres.in  | cityslicka    |

  Scenario Outline: unsuccessful login returns 400 and error message
    Given path '/login'
    And request {'email': '<email>', 'password': '<password>'}
    When method post
    Then status 400
    And match $.error == 'Missing password'
    And match response == {'error': '#notnull'}
    Examples:
      | email | password   |
      | eve.holt@reqres.in  |     |