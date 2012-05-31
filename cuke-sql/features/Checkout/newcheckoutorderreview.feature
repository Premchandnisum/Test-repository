Feature:  New Checkout Regression Testing - Verify order review page functionality
@automated
Scenario Outline: Verify order review page URL

Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
 # Check whether it's Master PDP or Standard
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
And I enter firstname "<firstname>"
And I enter lasttname "<lasttname>"
And I enter addressline1 "<addressline1>"
And I enter addressline2 "<addressline2>"
And I enter city "<city>"
And I select state "<state>"
And I enter zipcode "<zipcode>"
And I enter phonenumberareacode "<phonenumberareacode>"
And I enter phonenumberexchangeNbr "<phonenumberexchangeNbr>"
And I enter phonenumbersubscriberNbr "<phonenumbersubscriberNbr>"
When I continue checkout on shipping page
Then I should see the Payment page
And I select card type "<cardtype>"
And I enter card number "<cardnumber>"
And I select expiry month "<expmonth>"
And I select expiry year "<expyear>"
And I enter security code "<securitycode>"
And I select same as my shipping address of billing address
And I enter contact email address "<contactemailaddress>" 
And I enter contactphonenumberareacode "<phonenumberareacode>"
And I enter contactphonenumberexchangeNbr "<phonenumberexchangeNbr>"
And I enter contactphonenumbersubscriberNbr "<phonenumbersubscriberNbr>"
When I continue checkout on payment page
Then I should see the order review page
And the page should be secure
And I should see the order review page URL

Examples:  Shipping & Billing Information Test Data
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail.com|123|456|7890|


@automated
Scenario Outline: Verify that payment page should be displayed when user navigates to shipping page from order review page, edits the shipping info and clicks continue checkout.

Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
 # Check whether it's Master PDP or Standard
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
And I enter firstname "<firstname>"
And I enter lasttname "<lasttname>"
And I enter addressline1 "<addressline1>"
And I enter addressline2 "<addressline2>"
And I enter city "<city>"
And I select state "<state>"
And I enter zipcode "<zipcode>"
And I enter phonenumberareacode "<phonenumberareacode>"
And I enter phonenumberexchangeNbr "<phonenumberexchangeNbr>"
And I enter phonenumbersubscriberNbr "<phonenumbersubscriberNbr>"
When I continue checkout on shipping page
Then I should see the Payment page
And I select card type "<cardtype>"
And I enter card number "<cardnumber>"
And I select expiry month "<expmonth>"
And I select expiry year "<expyear>"
And I enter security code "<securitycode>"
And I select same as my shipping address of billing address
And I enter contact email address "<contactemailaddress>" 
And I enter contactphonenumberareacode "<phonenumberareacode>"
And I enter contactphonenumberexchangeNbr "<phonenumberexchangeNbr>"
And I enter contactphonenumbersubscriberNbr "<phonenumbersubscriberNbr>"
When I continue checkout on payment page
Then I should see the order review page
When I click the edit shipping address button
Then I should see the Shipping page
And earlier entered details should be prepopulated in the fields
And I enter firstname "<editfirstname>"
And I enter lasttname "<editlasttname>"
And I enter addressline1 "<editaddressline1>"
And I enter addressline2 "<editaddressline2>"
And I enter city "<editcity>"
And I select state "<editstate>"
And I enter zipcode "<editzipcode>"
And I enter phonenumberareacode "<editphonenumberareacode>"
And I enter phonenumberexchangeNbr "<editphonenumberexchangeNbr>"
And I enter phonenumbersubscriberNbr "<editphonenumbersubscriberNbr>"
When I continue checkout on shipping page
Then I should see the Payment page

Examples:  Shipping & Billing Information Test Data
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|editfirstname|editlasttname|editaddressline1|editaddressline2|editcity|editstate|editzipcode|editphonenumberareacode|editphonenumberexchangeNbr|editphonenumbersubscriberNbr|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail.com|123|456|7890|Test|User|8605 Santa Monica Blvd|Montgomery|Los Angeles|California|90069|800|555|1212|

@automated
Scenario Outline: Verify Contact details in Order review page

Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
 # Check whether it's Master PDP or Standard
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
And I enter firstname "<firstname>"
And I enter lasttname "<lasttname>"
And I enter addressline1 "<addressline1>"
And I enter addressline2 "<addressline2>"
And I enter city "<city>"
And I select state "<state>"
And I enter zipcode "<zipcode>"
And I enter phonenumberareacode "<phonenumberareacode>"
And I enter phonenumberexchangeNbr "<phonenumberexchangeNbr>"
And I enter phonenumbersubscriberNbr "<phonenumbersubscriberNbr>"
When I continue checkout on shipping page
Then I should see the Payment page
And I select card type "<cardtype>"
And I enter card number "<cardnumber>"
And I select expiry month "<expmonth>"
And I select expiry year "<expyear>"
And I enter security code "<securitycode>"
And I select same as my shipping address of billing address
And I enter contact email address "<contactemailaddress>" 
And I enter contactphonenumberareacode "<phonenumberareacode>"
And I enter contactphonenumberexchangeNbr "<phonenumberexchangeNbr>"
And I enter contactphonenumbersubscriberNbr "<phonenumbersubscriberNbr>"
When I continue checkout on payment page
Then I should see the order review page
	And I should see contact email address 
	And I should see contact phone number

Examples: Shipping & Billing Information Test Data
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|June|2013|111|qa@gmail.com|123|456|7890|
