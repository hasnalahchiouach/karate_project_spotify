Feature: Get Several album

  Background: Get authorization token
    And def authorization_access = call read('classpath:Authorization/BearerToken.feature')

Scenario: Get Several Albums

    Given url "https://api.spotify.com/v1/albums"
    And param ids = "382ObEPsp2rxGrnsizN5TX,1A2GTWGtFfWp7KSQTwWOyo,2noRn2Aes5aoNVsU6iWThc"
    And header Authorization = 'Bearer ' + authorization_access .bearer_token
    And param market = "ES"
    When method GET
    Then status 200
    And print response

Scenario: verify if the API returns an error if i send an invalid values
    Given url "https://api.spotify.com/v1/albums/"
    And header Authorization = 'Bearer ' + authorization_access .bearer_token
    And path "AA,7746,HASNAA"
    And param market = "ES"
    When method GET
    Then status 400