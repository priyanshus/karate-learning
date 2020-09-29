Feature: stateful mock server
  Background:
    * def RequestController = Java.type('com.bookstore.RequestController')

  Scenario: pathMatches('/books')
    * def content = "{'book': 'some book name', 'author', 'some name'}"
    * def response = { id: '1', details: '#(content)' }

  Scenario: pathMatches('/book') && methodIs('post')
    * def book = new RequestController().decode(request)
    * print book
    * def response = book