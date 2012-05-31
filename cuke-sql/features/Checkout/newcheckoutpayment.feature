Feature:  New Checkout Regression Testing - Verify payment page functionality

@automated
Scenario Outline: Verify user should be navigates to Order review page with success data

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

Examples: Shipping & Billing Information Test Data
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|June|2013|111|qa@gmail.com|123|456|7890|

@automated
Scenario Outline: Verify the payment page url

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
And the page should be secure
And I should see the payment page URL

Examples: Shipping Information - Successfull Data
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|

@automated
Scenario Outline: Verify that expiration date fields and security code field should be disabled for prop cards

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
And I select card type "<Propcardtype>"
Then expiration date fields and security code field should be disabled

Examples: Shipping & Billing Information Test Data
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|Propcardtype|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Macy's|


@automated
Scenario Outline: Verify that EGC overlay should be displayed on clicking add card button in payment page.

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
When I click on add card button on payment page
Then I should see EGC overlay

Examples: Shipping & Billing Information Test Data
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|

@automated
Scenario Outline: Verify that card type Vs card number validation should happen in payment page - Verify error message


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
Then I should see error message "<Card type VS card number validation error message>"

Examples: Shipping & Billing Information Bad Test Data
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|Card type VS card number validation error message|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111|July|2013|111|qa@gmail.com|123|456|7890|Invalid Credit Card.|


@automated
Scenario Outline: Verify that credit card number should be masked when ever any validation happens in payment page.

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
Then I should see the Payment page with error message
And credit card number should be masked except for last 4 digits


Examples:  Shipping & Billing Information Test Data
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail|123|456|7890|

@automated
Scenario Outline: Verify that EGC number should be masked when ever any validations happens on EGC overlay

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
#When I click on add card button on payment page
Then I should see EGC overlay
#And I enter egcnumber "<egcnumber>"
#And I enter captcha "<captcha>"
#When I click add card button on egc overlay
#Then I should see EGC overlay
#And I should see the EGC number masked

Examples:
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|egcnumber|captcha|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|12345678|abC1d|

@automated
Scenario Outline: Verify that captcha text field should be cleared when ever any validation happens on EGC overlay.

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
When I click on add card button on payment page
Then I should see EGC overlay
	And I enter gift card number "<egccardnumber>"
	And I enter captcha security verification code "<captcha>"
When I click on add card
#Then I should see the EGC overlay with error message
Then I should see empty captcha text field  

Examples: Shipping & Billing Information Test Data
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|egccardnumber|captcha|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|1234567890|abcd|


@automated
Scenario Outline: Verify that new captcha should be display when clicks on new image on EGC overlay.

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
When I click on add card button on payment page
Then I should see EGC overlay
When I click on new image
Then I should see new captch security verification code  

Examples: Shipping & Billing Information Test Data
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|giftcardnumber|securityverificationcode|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|1234567890|abcd|

@automated
Scenario Outline: Verify when DOB is les than 13 years of age user should not be able to create a profile.

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
And I select create profile checkbox
And I enter profile email address "<createprofileemailladdress>"
And I enter profile confirm email address "<createprofilconfirmemail>"
And I enter profile password "<createprofilepwd>"
And I enter profile confirm password "<createprofileconfirmpwd>"
And I select profile birthday month "<birthmonth>"
And I select profile birthday date "<birthdate>"
And I select profile birthday year "<birthyear>"
When I continue checkout on payment page
Then I should see the Payment page
	And I should see error message "<errormessage>"

Examples: Shipping & Billing Information Test Data
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|createprofileemailladdress|createprofilconfirmemail|createprofilepwd|createprofileconfirmpwd|birthmonth|birthdate|birthyear|errormessage|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|June|2013|111|qa@gmail.com|123|456|7890|nisum1@yahoo.com|nisum1@yahoo.com|12345|12345|December|30|1999|You must be at least 13 years old to register with macys.com.|


@automated
Scenario Outline: Verify Security code field is getting cleared when an error message is prompted in payment page.

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
Then I should be again redirected to Payment page
	And I should see empty security code field

Examples: Shipping & Billing Information Test Data
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|41111111111|June|2013|0000|qa@gmail.com|123|456|7890|
