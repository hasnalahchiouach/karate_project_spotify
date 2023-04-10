Feature: Get New Realeases

  Background: Get authorization token
    And def authorization_access = call read('classpath:Authorization/BearerToken.feature')

  Scenario: Get New Realeases

    Given url "https://api.spotify.com/v1/browse/new-releases"
    And header Authorization = 'Bearer ' + authorization_access .bearer_token
    And params { country : 'SE', limit: 10 , offset: 5 }
    When method GET
    Then status 200
    And print response

  Scenario: verify if the API returns an error if i send an invalid values

    Given url "https://api.spotify.com/v1/browse/new-releases"
    And header Authorization = 'Bearer ' + authorization_access .bearer_token
    And params { country : 'JKD', limit: 10 , offset: 5 }
    When method GET
    Then status 400