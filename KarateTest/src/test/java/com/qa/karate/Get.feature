Feature: All About Get Call

  Scenario: Call the Simple API
    Given url baseUrl+'/public/v2/users'
    * print baseUrl
    And path '2969'
    And method GET
    Then status 200
    * print response
    * def jsonRes = response
    * print jsonRes
    * def name = jsonRes.name
    * print name
    * match name == 'Gov. Deeptimay Mahajan'
    * print jsonRes.email

  Scenario: Call the Simple API user not found
    Given url 'https://gorest.co.in/public/v2/users'
    And path '299223'
    And method GET
    Then status 404

  Scenario: Call the Simple API-with Query Parameter
    Given url baseUrl+'/public/v2/users'
    * print baseUrl
    * def query = { status : 'active'}
    And params query
    And method GET
    Then status 200
    * print response
    * def jsonRes = response
    * print jsonRes[0].name

  Scenario: Call the Simple API-with multiple Query Parameter
    Given url baseUrl+'/public/v2/users'
    * print baseUrl
    * def query = { status : 'active', gender : 'male' }
    And params query
    And method GET
    Then status 200
    * print response
    * def jsonRes = response
    * print jsonRes[0].name

  Scenario: Call the Simple API-with header multiple Query Parameter
    Given header User-Agent = 'PostmanRuntime/7.29.0'
    And header Accept-Encoding = 'gzip, deflate, br'
    And header Connection = 'keep-alive'
    And header Accept = '*/*'
    
    Given url baseUrl+'/public/v2/users'
    * print baseUrl
    * def query = { status : 'active', gender : 'male' }
    And params query
    And method GET
    Then status 200
    * print response
    * def jsonRes = response
    * print jsonRes[0].name
    
  
    
    
