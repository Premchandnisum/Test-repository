Feature:  New Checkout Regression Testing with the same product.

Background:
Given I am on the Macy's home page
Then I navigate to product detail page with product id withbackground "<prodid>"
|prodid|
|1310|
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user

@automated
Scenario Outline: Verify user should be navigates to Payment page with success data
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

Examples: Shipping Information - Successfull Data
|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|
|Hello|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|

@automated
Scenario Outline: Verify user should be navigates to Order review page with success data
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
|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|June|2013|111|qa@gmail.com|123|456|7890|


@automated
Scenario Outline: Verify the payment page url
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
|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|

@automated
Scenario Outline: Verify that expiration date fields and security code field should be disabled for prop cards
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
|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|Propcardtype|
|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Macy's|


@automated
Scenario Outline: Verify that EGC overlay should be displayed on clicking add card button in payment page.
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
|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|

@automated
Scenario Outline: Verify that card type Vs card number validation should happen in payment page - Verify error message
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
|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|Card type VS card number validation error message|
|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111|July|2013|111|qa@gmail.com|123|456|7890|Invalid Credit Card.|


@automated
Scenario Outline: Verify that credit card number should be masked when ever any validation happens in payment page.
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
And I enter contactphonenumberareacode "<contactphonenumberareacode>"
And I enter contactphonenumberexchangeNbr "<contactphonenumberexchangeNbr>"
And I enter contactphonenumbersubscriberNbr "<contactphonenumbersubscriberNbr>"
When I continue checkout on payment page
Then I should see the Payment page with error message
And credit card number should be masked except for last 4 digits


Examples:  Shipping & Billing Information Test Data
|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|contactphonenumberareacode|contactphonenumberexchangeNbr|contactphonenumbersubscriberNbr|
|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail|1|456|7890|

                                                       
@automated
Scenario Outline: Verify order review page URL
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
|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail.com|123|456|7890|


@automated
Scenario Outline: Verify that payment page should be displayed when user navigates to shipping page from order review page, edits the shipping info and clicks continue checkout.
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
|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|editfirstname|editlasttname|editaddressline1|editaddressline2|editcity|editstate|editzipcode|editphonenumberareacode|editphonenumberexchangeNbr|editphonenumbersubscriberNbr|
|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail.com|123|456|7890|Test|User|8605 Santa Monica Blvd|Montgomery|Los Angeles|California|90069|800|555|1212|


@automated
Scenario Outline: Verify that shopping bag page should be displayed on clicking bag icon in mini bag section of checkout pages
Then I should see the Shipping page
When I click shopping bag icon in mini bag
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
When I click shopping bag icon in mini bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
And earlier entered details should be prepopulated in the fields
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
When I click shopping bag icon in mini bag
Then I am on the your shopping bag page

Examples:  Shipping & Billing Information Test Data
|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail.com|123|456|7890|

@automated
Scenario Outline: Verify that bag id displayed in shopping bag page and checkout pages should be same for a guest user
Then I should see the Shipping page
And bag id in mini bag should be same as in shopping bag
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
And bag id in mini bag should be same as in shopping bag
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
And bag id in mini bag should be same as in shopping bag

Examples:  Shipping & Billing Information Test Data
|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail.com|123|456|7890|


@automated
Scenario: Verify that order total displayed in shopping bag page and shipping page should be same.
Then I should see the Shipping page
And order total in mini bag should be same as in shopping bag
                                                                                                   
@automated
Scenario Outline: Verify order confirmation page URL.
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
When I place order on review page
Then I should see the order confirmation page
	And the page should be secure
	And I should see the order confirmation page URL


Examples:  Shipping & Billing Information Test Data
|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail.com|123|456|7890|

@automated
Scenario: Verify that flat tax is calculated in shipping page.
Then I should see the Shipping page
	And I should see flat tax displayed in order summary


@automated
Scenario Outline: Verify that item count in shopping bag page and in the mini bag section of checkout pages should be same.
Then I should see the Shipping page
    And bag count should be displayed in mini bag
	And bag count in mini bag should be same as in the shopping bag
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
	And bag count should be displayed in mini bag
	And bag count in mini bag should be same as in the shopping bag
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
	And bag count should be displayed in mini bag
	And bag count in mini bag should be same as in the shopping bag
When I place order on review page
Then I should see the order confirmation page
	And the page should be secure


Examples:  Shipping & Billing Information Test Data
|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail.com|123|456|7890|

@automated
Scenario: Verify the checkout shipping page URL
Then I should see the Shipping page
And I should see the shipping page URL


@automated
Scenario: Verify that gift option is set to NO by default
Then I should see the Shipping page
And I should see the gift option set to NO by default


@automated
Scenario: Verify that international home page should be displayed on 
clicking shipping internationally link in shipping page.
Then I should see the Shipping page
When I click on shipping internationally link
Then I am on international home page

@automated
Scenario: Verify that standard shipping method should be selected by default when merchandise total is less than $99
Then I should see the Shipping page
	And I should see standard shipping method is selected by default


@automated
Scenario: Verify that every day free shipping method should be selected by default when merchandise total is greater than $99
Then I should see the Shipping page
	And I should see every day free shipping method is selected by default


@automated
Scenario: Verify that gift options should be displayed when gift option 'YES' is selected.
Then I should see the Shipping page
When I select gift option 'YES' in shipping page
Then I should see all gift options 


@automated
Scenario: Verify that gift message check box should be disabled if the item in bag has gift message restriction.
Then I should see the Shipping page
When I select gift option 'YES' in shipping page
Then I should see all gift options
	And I should see gift message check box should be disabled



@automated
Scenario Outline: Verify that address validation should happen in shipping page
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
Then I should see shipping address validation happens "<errormessage>"

Examples: Invalid shipping address
|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|errormessage|
|Macys|hello|685 market street|Montgomery|San Fransisco|California|94538|123|456|3456|Shipping Address is invalid|

@automated
Scenario Outline: Verify that EGC number should be masked when ever any validations happens on EGC overlay
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
|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|egcnumber|captcha|
|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|12345678|abC1d|

@automated
Scenario: Verify that gift wrap check box should be disabled if the item in bag has gift wrap restriction.
Then I should see the Shipping page
When I select gift option 'YES' in shipping page
Then I should see all gift options
	And I should see gift wrap check box should be disabled



@automated
Scenario Outline: Verify that price should be displayed as FREE for GWP item in mini bag.
Then I should see the Shipping page
	And I should see GWP price as FREE in mini bag
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
        And I should see GWP price as FREE in mini bag
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
Then I am on order review page
	And I should see GWP price as FREE in mini bag

Examples: Shipping Information - Successfull Data
|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail.com|123|456|7890|

@automated
Scenario Outline: Verify that price for PWP should be displayed as price after dedcuting discount
Then I should see the Shipping page
	And I should see PWP price as price after discount in mini bag
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
        And I should see PWP price as price after discount in mini bag
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
Then I am on order review page
	And I should see PWP price as price after discount in mini bag

Examples: Shipping Information - Successfull Data
|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail.com|123|456|7890|

Scenario Outline: Veriify New profile confirmation display in order confirmation page
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
	And I enter profile email address "<createprofileemailaddress>"
	And I enter profile confirm email address "<createprofileconfirmemail>"
	And I enter profile password "<createprofilepwd>"
	And I enter profile confirm password "<createprofileconfirmpwd>"
	And I select profile birthday month "<birthmonth>"
	And I select profile birthday date "<birthdate>"
	And I select profile birthday year "<birthyear>"
When I continue checkout on payment page
Then I should see the order review page
When I place order on review page
Then I should see the order confirmation page
	And I should see profile email address
	And I should see shipping address details
	
Examples:  Shipping, Billing Information & Create Profile Test Data
|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|createprofileemailaddress|createprofileconfirmemail|createprofilepwd|createprofileconfirmpwd|birthmonth|birthdate|birthyear|
|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail.com|123|456|7890|test010@nisum.com|test010@nisum.com|12345|12345|May|12|1988|

@automated
Scenario Outline: Verify that shopping bag should get empty once the order is placed
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
When I place order on review page
Then I should see the order confirmation page
When I navigate to shopping bag page
Then I should see shopping bag is empty with error message "<expectedErrorMessage>"

Examples:  Shipping & Billing Information Test Data
|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|expectedErrorMessage|
|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail.com|123|456|7890|Your Current Shopping Bag is empty.|


@automated
Scenario Outline: Verify that order summary should be updated when promo code is applied
Then I should see the Shipping page
	And I enter a promo code
When I apply promo code
Then I should see the order summary details are updated
	And I should see the applied promo code details
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
	And I should see the applied promo code details
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
	And I should see the applied promo code details
When I place order on review page
Then I should see the order confirmation page

Examples:  Shipping & Billing Information Test Data
|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail.com|123|456|7890|

@automated
Scenario Outline: Verify that order summary should be updated when promo code is removed
Then I should see the Shipping page
	And I should see the applied promo code details
When I remove promo code
Then I should see the order summary details are updated
	And I should see the promo code is removed
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
	And I should see the promo code is removed
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
	And I should see the promo code is removed
When I place order on review page
Then I should see the order confirmation page

Examples:  Shipping & Billing Information Test Data
|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail.com|123|456|7890|

@automated
Scenario Outline: Verify that bag id should be updated once user places an order and again add an item and go to shipping page
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
When I place order on review page
Then I should see the order confirmation page
Then I navigate to product detail page with product id "<prodid>"
 # Check whether it's Master PDP or Standard
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
	And I should see the updated bag id on shipping page
	
Examples:  Shipping & Billing Information Test Data
|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail.com|123|456|7890|

@automated
Scenario: Verify that PDP should be displyed when clicked on product image/name
Then I should see the Shipping page
When I click on Product Name for a product in mini bag
Then I navigate to product details page
	And I should see the attributes selected by the user are populated on PDP page
When I navigate to shopping bag page
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
When I click on Product Image for a product in mini bag
Then I navigate to product details page
	And I should see the attributes selected by the user are populated on PDP page


@automated
Scenario: Verify the footer links in checkout pages.
Then I should see the Shipping page
	And I should see easyReturnLink in footer
	And I should see secureShoppingLink in footer
	And I should see privacyPolicyDetailsLink in footer
	And I should see ShippingPolicyDetailsLink in footer
When I click on easyReturnLink
Then I should see Return Policy pop up
When I close the pop up
Then pop up should be closed
When I click on secureShoppingLink
Then I should see Security Policy pop up
When I close the pop up
Then pop up should be closed
When I click on privacyPolicyDetailsLink
Then I should see Privacy pop up
When I close the pop up
Then pop up should be closed
When I click on ShippingPolicyDetailsLink
Then I should see Shipping Policy pop up
When I close the pop up
Then pop up should be closed

@automated
Scenario Outline: Verify that captcha text field should be cleared when ever any validation happens on EGC overlay.
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
|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|egccardnumber|captcha|
|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|1234567890|abcd|


@automated
Scenario Outline: Verify that new captcha should be display when clicks on new image on EGC overlay.
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
|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|giftcardnumber|securityverificationcode|
|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|1234567890|abcd|


@automated
Scenario Outline: Verify creating a profile while checkout with already existing email id.
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
And I enter profile email address "<createprofileemailaddress>"
And I enter profile confirm email address "<createprofileconfirmemail>"
And I enter profile password "<createprofilepwd>"
And I enter profile confirm password "<createprofileconfirmpwd>"
And I select profile birthday month "<birthmonth>"
And I select profile birthday date "<birthdate>"
And I select profile birthday year "<birthyear>"
When I continue checkout on payment page
Then I should see the order review page
When I place order on review page
Then I should see the order confirmation page
	And I should see error message "<errormessage>"
	
	
Examples: Shipping & Billing Information Test Data
|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|createprofileemailaddress|createprofileconfirmemail|createprofilepwd|createprofileconfirmpwd|birthmonth|birthdate|birthyear|errormessage|
|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|June|2013|111|qa@gmail.com|123|456|7890|nisum1@yahoo.com|nisum1@yahoo.com|12345|12345|December|30|1987|Please note: due to an issue, we were unable to create your new profile. We still want to know more about you, so we ask that you create your online account in our profile page|


@automated
Scenario Outline: Verify Contact details in Order review page
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
|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|June|2013|111|qa@gmail.com|123|456|7890|

@automated
Scenario: Verify the header links in checkout pages.
Then I should see the Shipping page
And I should see livechat in header
And I should see clicktocall in header
When I click on livechat
Then I should see livechat pop up
When I close the pop up
Then pop up should be closed
When I click on clicktocall
Then I should see clicktocall pop up
When I close the pop up
Then pop up should be closed

@automated
Scenario Outline: Verify when DOB is les than 13 years of age user should not be able to create a profile.
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
|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|createprofileemailladdress|createprofilconfirmemail|createprofilepwd|createprofileconfirmpwd|birthmonth|birthdate|birthyear|errormessage|
|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|June|2013|111|qa@gmail.com|123|456|7890|nisum1@yahoo.com|nisum1@yahoo.com|12345|12345|December|30|1999|You must be at least 13 years old to register with macys.com.|


@automated
Scenario Outline: Verify Security code field is getting cleared when an error message is prompted in payment page.

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
|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|41111111111|June|2013|0000|qa@gmail.com|123|456|7890|

Scenario Outline: Verify that order number should be displayed in order confirmation page after placing an order.


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
When I place order on review page
Then I should see the order confirmation page
	And I should see the order number
		
Examples:  Shipping, Billing Information & Create Profile Test Data
|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail.com|123|456|7890|


Scenario Outline: Verify that order total should be displayed in order confirmation page after placing an order.





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
When I place order on review page
Then I should see the order confirmation page
	And I should see the order total
		
Examples:  Shipping, Billing Information & Create Profile Test Data
|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail.com|123|456|7890|


@automated
Scenario: Test
Given Hi Test
Then Bye