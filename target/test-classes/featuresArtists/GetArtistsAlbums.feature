Feature: Get ArtistS Albums

  Background: Get authorization token
    And def authorization_access = call read('classpath:Authorization/BearerToken.feature')

  Scenario: Get Artists Albums

    Given url "https://api.spotify.com/v1/artists/0TnOYISbd1XYRBk9myaseg/albums"
    And header Authorization = 'Bearer ' + authorization_access .bearer_token
    And params { market : 'ES', include_groups : 'single,appears_on' , limit: 10 , offset: 5 }
    When method GET
    Then status 200
    And print response

  Scenario: verify if the API returns an error if i send an invalid values
    Given url "https://api.spotify.com/v1/artists/43H/albums"
    And header Authorization = 'Bearer ' + authorization_access .bearer_token
    And params { market : 'ES', include_groups : 'single,appears_on',  limit: 10 , offset: 5 }
    When method GET
    Then status 400