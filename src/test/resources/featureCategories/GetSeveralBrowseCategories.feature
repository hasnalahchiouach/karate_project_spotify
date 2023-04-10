Feature: Get Several Browse Categories

  Background: Get authorization token
    And def authorization_access = call read('classpath:Authorization/BearerToken.feature')

  Scenario: Get Several Browse Categories

    Given url "https://api.spotify.com/v1/browse/categories"
    And header Authorization = 'Bearer ' + authorization_access .bearer_token
    And params { country = "SE" , locale : "sv_SE" , limit : 10 , offset : 5  }
    When method GET
    Then status 200
    And print response

  Scenario: verify if the API returns an error if i send an invalid id
    Given url "https://api.spotify.com/v1/browse/categories"
    And header Authorization = 'Bearer ' + authorization_access .bearer_token
    And params { country : "SEEE" , locale : "sv_SE" , limit : 10 , offset : 5  }
    When method GET
    Then status 400

