Feature: Create Trello board

  Background:
    Given url trelloUrl
    And param key = appKey
    And param token = appToken
    * def deleteBoard =
    """
    function(payload) {
      karate.log('Delete Board');
      karate.call('../board/common.feature@scenario=deleteboard', payload);
    }
    """

  Scenario: Create Trello board returns 200 and non-null id
    Given path 'boards'
    And param name = 'trial'
    And request {}
    When method post
    Then status 200
    And def boardId = $.id
    And match $.id == '#notnull'
    And match $.name == 'trial'
    And call deleteBoard {id : '#(boardId)'}

  Scenario Outline: Create Trello board with permission level returns 200 and non-null id
    Given path 'boards'
    And param name = 'trial' + '<level>'
    And param prefs_permissionLevel = '<level>'
    And request {}
    When method post
    Then status 200
    And def boardId = $.id
    And match $.id == '#notnull'
    And match $.prefs.permissionLevel == '<level>'
    And call deleteBoard {id : '#(boardId)'}
    Examples:
      | level   |
      | public  |
      | private |

  Scenario Outline: Create Trello board with voting preference level returns 200 and non-null id
    Given path 'boards'
    And param name = 'trial-' + '<prefs>'
    And param prefs_voting = '<prefs>'
    And request {}
    When method post
    Then status 200
    And def boardId = $.id
    And match $.id == '#notnull'
    And match $.prefs.voting == '<prefs>'
    And call deleteBoard {id : '#(boardId)'}
    Examples:
      | prefs     |
      | disabled  |
      | members   |
      | observers |

  Scenario: Create Trello board returns 200 and expected response schema
    * def response_schema =
  """
  {"id": "#notnull","name": "#notnull",
      "desc": "",
  "descData": null,
  "closed": false,
  "idOrganization": null,
  "idEnterprise": null,
  "pinned": false,
  "url": "#notnull",
  "shortUrl": "#notnull",
  "prefs": {
  "permissionLevel": "private",
  "hideVotes": false,
  "voting": "disabled",
  "comments": "members",
  "invitations": "members",
  "selfJoin": true,
  "cardCovers": true,
  "isTemplate": false,
  "cardAging": "regular",
  "calendarFeedEnabled": false,
  "background": "blue",
  "backgroundImage": null,
  "backgroundImageScaled": null,
  "backgroundTile": false,
  "backgroundBrightness": "dark",
  "backgroundColor": "#0079BF",
  "backgroundBottomColor": "#0079BF",
  "backgroundTopColor": "#0079BF",
  "canBePublic": true,
  "canBeEnterprise": true,
  "canBeOrg": true,
  "canBePrivate": true,
  "canInvite": true
  },
  "labelNames": {
  "green": "",
  "yellow": "",
  "orange": "",
  "red": "",
  "purple": "",
  "blue": "",
  "sky": "",
  "lime": "",
  "pink": "",
  "black": ""
  },
  "limits": {
  }
  }
  """
    Given path 'boards'
    And param name = 'trial-board'
    And request {}
    When method post
    Then status 200
    And def boardId = $.id
    And match response == response_schema
    And call deleteBoard {id : '#(boardId)'}