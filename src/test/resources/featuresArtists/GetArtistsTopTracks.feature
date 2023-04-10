Feature: Get Artist Top Tracks

  Background: Get authorization token
    And def authorization_access = call read('classpath:Authorization/BearerToken.feature')

  Scenario: Get Artists Top Tracks

    Given url "https://api.spotify.com/v1/artists/0TnOYISbd1XYRBk9myaseg/top-tracks"
    And header Authorization = 'Bearer ' + authorization_access .bearer_token
    And param market = "ES"
    When method GET
    Then status 200
    And print response

  Scenario: verify if the API returns an error if i send an invalid id
    Given url "https://api.spotify.com/v1/artists/12344/top-tracks"
    And header Authorization = 'Bearer ' + authorization_access .bearer_token
    And param market = "ES"
    When method GET
    Then status 400

