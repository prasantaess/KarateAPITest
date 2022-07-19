Feature: To validate the Post calls

  Background: 
    * url 'https://gorest.co.in'
    * def requestPayload =
      """
       {
         "name" : "Prasanta",
         "email": "prasanta30@yopmail.com",
         "gender": "male",
         "status" : "active"       
       }

      """

  Scenario: update the new detais
    Given path '/public/v2/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    And method post
    Then status 201
    And match $.id == '#present'
    # fatch The user Datails
    * def UserID = $.id
    * print  UserID
    # Provide the Put call
    * def Putcall =
      """
      {
       	"status" : "inactive" 
      }
      """
    Given path '/public/v2/users/'+UserID
    And request Putcall
    And header Authorization = 'Bearer ' + tokenID
    When method put
    Then status 200
