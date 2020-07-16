@spartan
Feature: Spartan API tests

  Background: setup
    * url 'http://3.86.255.209:8000'
    * def token = call read('basic-auth.js') { username: 'admin', password: 'admin' }
    * header Authorization = token

  Scenario: Get all Spartans
    Given path '/api/spartans/118'
    When method get
    Then status 200
    * print karate.pretty(response)


  Scenario: Add a Spartan and verify the status code
    Given path '/api/spartans'
    * def spartan =
      """
      {
      "name": "Karate Master",
      "gender": "Male",
      "phone": 9119111919
      }
      """
    And request spartan
    When method post
    Then status 201
    And print karate.pretty(response)
    * def id = response.data.id
    * header Authorization = token
    Given path '/api/spartans/', id
    When method delete
    Then status 204

#    Scenario: Delete a Spartain
#      Given path '/api/spartans/107'
#      When method delete
#      Then status 204

  Scenario: Add new Spartan from external JSON file
    Given path '/api/spartans'
    * def spartan = read('spartan.json')
    * request spartan
    When method post
    * print karate.pretty(response)
    Then status 201
    And assert response.success == 'A Spartan is Born!'

    
    Scenario: Update a Spartan
      Given path '/api/spartans/118'
      And request {name: 'JOPA Master'}
      And method patch
      * print karate.pretty(response)
      Then status 204