Feature: Get Artist

  Background: Get authorization token
    And def authorization_access = call read('classpath:Authorization/BearerToken.feature')

  Scenario: Get an Artist

    Given url "https://api.spotify.com/v1/artists/"
    And path "0TnOYISbd1XYRBk9myaseg"
    And header Authorization = 'Bearer ' + authorization_access .bearer_token
    When method GET
    Then status 200
    And print response

  Scenario: verify if the API returns an error if i send an invalid id
    Given url "https://api.spotify.com/v1/artists/"
    And path "hdhhdj"
    And header Authorization = 'Bearer ' + authorization_access .bearer_token
    When method GET
    Then status 400

