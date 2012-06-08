Feature: Testing of macy checkout process through guest user flow

@GuestUserCheckOut
Scenario Outline: Guest user check out flow scenarios

Given I am on MCOM site

When I add any product of "<categoryhierarchy>" with "<quantity>" to bag
And I click the check out button
Then I should see the "your shopping bag" page
And the bag items should be as same as added
And I click the continue check out button
Then I should see the "Sign in to continue checkout" page
When I click check out without profile button
Then I should see the "choose shipping address" page
And the page should be secured
And I should see the bag id and order summary details
When I click the button continue check out button with out giving shipping info
Then I should see the shipping page field validation error
When I enter the valid shipping details
And I click the continue check out button
And I should see the "choose shipping options" page
And the page should be secured
And I click back one step button 
Then I should see the "choose shipping address" page
And I click the continue check out button
And I should see the "choose shipping options" page
And I should see the bag id and order summary details
And I click the continue check out button
And I should see the "enter payment information" page
And the page should be secured
And I should see the bag id and order summary details
When I click the save and continue with out entering payment info
Then I should see the payment page field validation errors
When I select the card type as "<cctype>"
And I enter the card number as "<ccnumber>"
And I select exp month as "<expmonth>"
And I select the exp year as "<expyear>"
And I enter the secret code as "<securitycode>"
And I check the billing address as same my shipping address
Then I should see my shipping address as my billing address
And I enter the contact information
When I click the save and continue button
And I click back one step button
And I should see the "enter payment information" page
And I click back one step button
Then I should see the "choose shipping options" page
And I click the continue check out button
And I enter the secret code as "<securitycode>"
When I click the save and continue button
Then I should see the "review your order" page
And I should see the bag id and order summary details
And the page should be secured
And the shipping address should be correct in order review page
And the billing address page should be correct in the order review page
And I click the edit shipping address link
Then I should see the "choose shipping address" page
And I enter another shipping address
And I click the continue check out button
Then I should see the "review your order" page
And the shipping address should be correct in order review page
And the billing address page should be correct in the order review page
And I click the edit payment info link
And I should see the "enter payment information" page
And I enter the secret code as "<securitycode>"
And I enter another contact information
When I click the save and continue button
Then I should see the "review your order" page
And I should see the updated contact information

Examples:
|categoryhierarchy|quantity|cctype|ccnumber|expmonth|expyear|securitycode|
|men;Shorts|2|Visa|4111111111111111|December|2020|123|