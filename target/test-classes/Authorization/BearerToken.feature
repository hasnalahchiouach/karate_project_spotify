Feature: Get the bearer token

  Scenario: get authorization

    Given url "https://accounts.spotify.com/api/token"
    And def Base64 = Java.type('Utils.Base64Encode')
    And def auth_string = client_authorization
    And def encoded_string = Base64.encode(auth_string)
    And header Authorization = "Basic " + encoded_string
    And form field grant_type = "client_credentials"
    When method POST
    Then status 200
    And def bearer_token = response.access_token