Feature: Verify the Test Data
Scenario: Verify the newly inserted data
Given url 'https://gorest.co.in/public/v2/users/'
And path '3299'
And header Authrization = 'Bearer '+ tokenID
And method get
* def id = $.id
* print id