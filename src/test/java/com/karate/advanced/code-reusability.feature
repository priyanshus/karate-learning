Feature: which makes a 'call' to another re-usable feature

  Scenario: a smoke suite execution by calling shared featured
    * call read('../../reqres/user/get-user.feature@suite=smoke')