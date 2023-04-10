Feature: Get Single Browse Categorie

  Background: Get authorization token
    And def authorization_access = call read('classpath:Authorization/BearerToken.feature')

  Scenario: Get Single Browse Categorie

    Given url "https://api.spotify.com/v1/browse/categories/"
    And header Authorization = 'Bearer ' + authorization_access .bearer_token
    And path "dinner"
    And params { country = "SE" , locale : "sv_SE" }
    When method GET
    Then status 200
    And print response

  Scenario: verify if the API returns an error if i send an invalid id
    Given url "https://api.spotify.com/v1/browse/categories"
    And header Authorization = 'Bearer ' + authorization_access .bearer_token
    And params { country : "SkjdkE" , locale : "sv_SE" }
    When method GET
    Then status 400

