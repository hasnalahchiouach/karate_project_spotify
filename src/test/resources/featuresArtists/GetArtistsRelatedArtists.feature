Feature: Get Artist Related Artists

  Background: Get authorization token
    And def authorization_access = call read('classpath:Authorization/BearerToken.feature')

  Scenario: Get Artists Related Artists

    Given url "https://api.spotify.com/v1/artists/0TnOYISbd1XYRBk9myaseg/related-artists"
    And header Authorization = 'Bearer ' + authorization_access .bearer_token
    When method GET
    Then status 200
    And print response

  Scenario: verify if the API returns an error if i send an invalid id
    Given url "https://api.spotify.com/v1/artists/HSHS77/related-artists"
    And header Authorization = 'Bearer ' + authorization_access .bearer_token
    When method GET
    Then status 400
    And print response

