Feature: parameters examples

  Background:
    * def baseUrl = 'http://api.exchangeratesapi.io/'
    * def spartanUrl = 'http://3.83.111.246:8000'
    * def hrUrl = 'http://3.83.111.246:1000/ords/hr'



  Scenario: path parameters
    Given url baseUrl
    And path "latest?access_key=97a1e59d6748dfc66aa2e981bf285b4b"
    When method GET
    Then status 200

  Scenario: path parameters
    Given url baseUrl
    And path "2010-01-12?access_key=97a1e59d6748dfc66aa2e981bf285b4b"
    When method GET
    Then status 200

Scenario:
  Given url spartanUrl
  And path "/api/spartans"
  When  method GET
  Then status 200
  And print response


  Scenario:

    Given url spartanUrl
    And path "/api/spartans"
    And path "10"
    When  method GET
    Then status 200
    And print response
    And match response == {"gender": "Female","phone": 3312820936,"name": "Lorenza","id": 10}



  Scenario:

    * def expectedSpartan =
    """
  {
  "gender": "Female",
  "phone": 3312820936,
  "name": "Lorenza",
  "id": 10
  }
  """
    Given url spartanUrl
    And path "/api/spartans"
    And path "10"
    When  method GET
    Then status 200
    And print response
    And match response == expectedSpartan



  Scenario:  query parameters
    Given url spartanUrl
    And path "api/spartans/search"
    And param nameContains = 'j'
    And param gender = 'Female'
    When method GET
    Then status 200
    And match header Content-Type == 'application/json'
    And print response
      #verify each content has gender = Female
    And match each response.content contains {"gender":"Female"}
      #second way of iteration
    And match each response.content[*].gender == 'Female'
    And match response.content[0].name == 'Jaimie'
      #verify each content phone is number
    And match each response.content[*].phone == '#number'


  Scenario: hr regions example
    Given url hrUrl
    And path 'regions'
    When method GET
    Then status 200
    And print response
    And match response.limit == 25
    And match each response.items[*].region_id == '#number'


