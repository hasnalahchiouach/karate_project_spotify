Feature: Get Several Artists

  Background: Get authorization token
    And def authorization_access = call read('classpath:Authorization/BearerToken.feature')

  Scenario: Get Several Artists

    Given url "https://api.spotify.com/v1/artists"
    And header Authorization = 'Bearer ' + authorization_access .bearer_token
    And param ids = "2CIMQHirSU0MQqyYHq0eOx,57dN52uHvrHOxijzpIgu3E,1vCWHaC5f2uS3yhpwWbIA6"
    When method GET
    Then status 200
    And print response

  Scenario: verify if the API returns an error if i send an invalid values
    Given url "https://api.spotify.com/v1/artists"
    And header Authorization = 'Bearer ' + authorization_access .bearer_token
    And path "AA,7746,jjjs"
    When method GET
    Then status 400