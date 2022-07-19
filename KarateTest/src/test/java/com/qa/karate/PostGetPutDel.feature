Feature: To demenstrate the Post, Get, Put and Delete

  Background: 
    * url 'https://gorest.co.in'
    * def randomStringemail =
      """
       function (s) {
       var text = "";
       var pattern = "ABCDEFGHIJKLMANOPQRSTUVWXYZabcdefghijklmnopqsrtuvwxys1234567890";
       for(var i=0; i<s;i++)
       text += pattern.charAt(Math.floor(Math.random()*pattern.length()));
       return text;
      }
      """
    * def emailString = randomStringemail(10)
    * print emailString
    * def requestPayload =
      """
       {
         "name" : "Prasanta",
         "gender": "male",
         "status" : "inactive"       
       }

      """
    * requestPayload.email = emailString + "@yopmail.com"
    * print requestPayload

  # Scenario for post call
  Scenario: 
    Given path '/public/v2/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    And method post
    And status 201
    And match $.id == '#present'
    And match $.name == '#present'
    And match $.gender == '#present'
    And match $.status == '#present'
    And match $.email == '#present'
    * def UserID = $.id
    * def UserName = $.name
    * def UserGender = $.gender
    * def UserStatus = $.status
    * def email = $.email
    * print UserID
    * print UserName
    * print UserGender
    * print UserStatus
    * print email
    # Scenario for GET
    Given path '/public/v2/users/'+UserID
    And header Authorization = 'Bearer ' + tokenID
    And method get
    And status 200
    * print response
    * print response.id
    * print response.name
    * print response.email
    * print response.gender
    * print response.status
    * match response.name == 'Prasanta'
    # scenario for put call
    * def putcall =
      """
      {
       "status" : "active" 
      }
      """
    * print putcall
    Given path '/public/v2/users/'+UserID
    And request putcall
    And header Authorization = 'Bearer ' + tokenID
    When method put
    And status 200
    * print response.status
    
    # scenario for delete
   Given path '/public/v2/users/'+UserID
   And header Authorization = 'Bearer ' + tokenID
   When method delete
   And status 204
   * print response
   
   # Scenario for Get
   Given path '/public/v2/users/'+UserID
   And header Authorization = 'Bearer ' + tokenID
   When method get
   And status 404
   * print response
   * match $.message == "Resource not found"
    
    
    
