Feature:  New Checkout Regression Testing - Verify mini bag functionality

@automated
Scenario Outline: Verify that shopping bag page should be displayed on clicking bag icon in mini bag section of checkout pages

Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
 # Check whether it's Master PDP or Standard
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
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
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail.com|123|456|7890|

@automated
Scenario Outline: Verify that bag id displayed in shopping bag page and checkout pages should be same for a guest user

Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
 # Check whether it's Master PDP or Standard
When I add items on bag
Then I am on the your shopping bag page
And bag id should be displayed in shopping bag
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
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
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail.com|123|456|7890|


@automated
Scenario: Verify that order total displayed in shopping bag page and shipping page should be same.

Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
 # Check whether it's Master PDP or Standard
When I add items on bag
Then I am on the your shopping bag page
And  order total should be displayed in shopping bag
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
And order total in mini bag should be same as in shopping bag


@automated
Scenario Outline: Verify that item count in shopping bag page and in the mini bag section of checkout pages should be same.

Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
 # Check whether it's Master PDP or Standard
When I add items on bag
Then I am on the your shopping bag page
	And bag count should be displayed in the shopping bag 
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
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
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail.com|123|456|7890|

@automated
Scenario Outline: Verify that price should be displayed as FREE for GWP item in mini bag.


Given I am on the Macy's home page
Then I navigate to product detail page
 # Check whether it's Master PDP or Standard
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
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
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail.com|123|456|7890|

@automated
Scenario Outline: Verify that price for PWP should be displayed as price after dedcuting discount

Given I am on the Macy's home page
Then I navigate to product detail page
 # Check whether it's Master PDP or Standard
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
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
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail.com|123|456|7890|

@automated
Scenario Outline: Verify that order summary should be updated when promo code is applied

Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
 # Check whether it's Master PDP or Standard
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
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
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail.com|123|456|7890|

@automated
Scenario Outline: Verify that order summary should be updated when promo code is removed

Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
 # Check whether it's Master PDP or Standard
When I add items on bag
Then I am on the your shopping bag page
When I apply promo code
Then I should see the order summary details are updated
	And I should see the applied promo code details
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
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
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail.com|123|456|7890|

@automated
Scenario Outline: Verify that bag id should be updated once user places an order and again add an item and 
go to shipping page

Given I am on the Macy's home page
Then I navigate to product detail page with product id "<Prod_Id>"
 # Check whether it's Master PDP or Standard
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
	And I should see the bag id on shipping page
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
Then I navigate to product detail page with product id "<Prod_Id>"
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

Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
 # Check whether it's Master PDP or Standard
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
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

Scenario Outline: Verify that shipping surcharge amount should be displayed in checkout pages

Given I am on the Macy's home page
Then I navigate to product detail page with product id "<Prod_Id>"
 # Check whether it's Master PDP or Standard
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
	And I should see the shipping surcharge amount
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
    And I should see the shipping surcharge amount
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
	And I should see the shipping surcharge amount
	
Examples: Shipping & Billing Information Test Data
|Prod_Id|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|June|2013|123|qa@gmail.com|123|456|7890|

Scenario Outline: Verify that personalized fee amount should be displayed in checkout pages

Given I am on the Macy's home page
Then I navigate to product detail page with product id "<Prod_Id>"
 # Check whether it's Master PDP or Standard
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
	And I should see the personalized fee amount
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
    And I should see the personalized fee amount
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
	And I should see the personalized fee amount

Examples: Shipping & Billing Information Test Data
|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|June|2013|123|qa@gmail.com|123|456|7890|

Scenario Outline: Verify that sales tax amount should be displayed in checkout pages

Given I am on the Macy's home page
Then I navigate to product detail page with product id "<Prod_Id>"
 # Check whether it's Master PDP or Standard
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
	And I should see the sales tax amount
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
    And I should see the sales tax amount
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
	And I should see the sales tax amount

Examples: Shipping & Billing Information Test Data
|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|June|2013|123|qa@gmail.com|123|456|7890|