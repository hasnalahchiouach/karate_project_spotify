Feature: Get Album Tracks

  Background: Get authorization token
    And def authorization_access = call read('classpath:Authorization/BearerToken.feature')

  Scenario: Get Album Tracks

    Given url "https://api.spotify.com/v1/albums/4aawyAB9vmqN3uQ7FjRGTy/tracks"
    And header Authorization = 'Bearer ' + authorization_access .bearer_token
    And params { market = "ES" , limit : 10 , offset : 5 }"
    When method GET
    Then status 200
    And print response

  Scenario: verify if the API returns an error if i send an invalid id

    Given url "https://api.spotify.com/v1/albums/5564/tracks"
    And header Authorization = 'Bearer ' + authorization_access .bearer_token
    And params { market = "ES" , limit : 10 , offset : 5 }"
    When method GET
    Then status 400
    And print response