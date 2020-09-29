Feature: Add card to board

  Background:
    Given url trelloUrl
    And param key = appKey
    And param token = appToken
    * def addBoard = function() {return karate.call('../board/common.feature@scenario=createboard');}
    * def getListsOnBoard = function(payload) {return karate.call('../board/common.feature@scenario=getlists', payload);}

    * print 'Create Board'
    * def addBoardResult = callonce addBoard
    * def boardId =  addBoardResult.response.id
    * def payload = {id: '#(boardId)'}
    * print 'Get lists on board'
    * def getListsResult = callonce getListsOnBoard {id: '#(boardId)'}
    * configure afterFeature =
    """
    function() {
      karate.log('Delete Board');
      karate.call('../board/common.feature@scenario=deleteboard', payload);
    }
    """

  Scenario: Add card to todo list of board returns 200 and non null id
    * def listId = getListsResult.response[0].id
    Given path 'cards'
    And request {'idBoard': '#(boardId)', 'idList': '#(listId)', 'name':'some card 1'}
    When method post
    Then status 200
    And match $.id == '#notnull'

  Scenario: Add card to doing list of board returns 200 and non null id
    * def listId = getListsResult.response[1].id
    Given path 'cards'
    And request {'idBoard': '#(boardId)', 'idList': '#(listId)', 'name':'some card 1'}
    When method post
    Then status 200
    And match $.id == '#notnull'

  Scenario: Move card
    * def todoList = getListsResult.response[0].id
    * def doingList = getListsResult.response[1].id
    Given path 'cards'
    And request {'idBoard': '#(boardId)', 'idList': '#(todoList)', 'name':'some card 1'}
    When method post
    Then status 200
    And match $.id == '#notnull'
    And set cardId = $.id

    Given path 'cards', cardId
    And param key = appKey
    And param token = appToken
    And request {'idList': '#(doingList)'}
    When method put
    Then status 200
    And match $.id == '#notnull'
    And match $.idList == '#notnull'







