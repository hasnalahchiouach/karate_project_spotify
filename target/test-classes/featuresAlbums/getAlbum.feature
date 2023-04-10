Feature: Get album

  Background: Get authorization token
    And def authorization_access = call read('classpath:Authorization/BearerToken.feature')

  Scenario: Get an Album

    Given url "https://api.spotify.com/v1/albums/"
    And header Authorization = 'Bearer ' + authorization_access .bearer_token
    And path "4aawyAB9vmqN3uQ7FjRGTy"
    When method GET
    Then status 200
    And print response

  Scenario: verify if the API returns an error if i send an invalid id
    Given url "https://api.spotify.com/v1/albums/"
    And path "335"
    And header Authorization = 'Bearer ' + authorization_access .bearer_token
    When method GET
    Then status 400

