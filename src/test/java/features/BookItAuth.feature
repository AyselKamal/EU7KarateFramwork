Feature: get user token

  Scenario: get one user token
    Given url 'https://cybertek-reservation-api-qa3.herokuapp.com/'
    And path 'sign'
    And header Accept = 'application/json'
    And param email = 'wboeck5c@theguardian.com'
    And param password = 'waiteboeck'
    When method GET
    Then status 200
    And print response.accessToken
    And def token = response.accessToken
    #And def name = 'Waite'