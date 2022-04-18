Feature: exchange rate api tests


  Scenario: basic test with status code validation
     Given url 'http://api.exchangeratesapi.io/v1/latest?access_key=97a1e59d6748dfc66aa2e981bf285b4b'
     When method GET
     Then status 200

    Scenario: get rates fro specific day
      Given  url 'http://api.exchangeratesapi.io/2010-01-12?access_key=97a1e59d6748dfc66aa2e981bf285b4b'
      When  method GET
      Then  status 200


  Scenario: header verification
    Given  url 'http://api.exchangeratesapi.io/2010-01-12?access_key=97a1e59d6748dfc66aa2e981bf285b4b'
    When  method GET
    Then  status 200
    And match header Content-Type == 'application/json; Charset=UTF-8'
    And match header Connection == 'keep-alive'
    #to verify headers we use header keyword then headername without double or single code
    # and == 'header value'
    And match header Date == '#present'
    #this equals to headers().hasHeaderWithName("headername") in restassured


  Scenario: json body verification
    Given url 'http://api.exchangeratesapi.io/2010-01-12?access_key=97a1e59d6748dfc66aa2e981bf285b4b'
    When method GET
    Then status 200
    And match header Content-Type == 'application/json; Charset=UTF-8'
    And print response
    And print response.base
    #VERIFY BASE IS EUR
    And match response.base == 'EUR'
    And print response.rates
    And print response.rates.USD
    And match response.rates.USD == '#present'
    And match response.rates.USD == 1.449908















