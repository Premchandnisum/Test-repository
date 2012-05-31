Feature:  New Checkout Regression Testing - Verify orderconfirmation page functionality
                                                                            
@automated
Scenario Outline: Verify order confirmation page URL.

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
When I place order on review page
Then I should see the order confirmation page
	And the page should be secure
	And I should see the order confirmation page URL

Examples:  Shipping & Billing Information Test Data
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail.com|123|456|7890|

Scenario Outline: Veriify New profile confirmation display in order confirmation page

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
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|createprofileemailaddress|createprofileconfirmemail|createprofilepwd|createprofileconfirmpwd|birthmonth|birthdate|birthyear|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail.com|123|456|7890|test010@nisum.com|test010@nisum.com|12345|12345|May|12|1988|

@automated
Scenario Outline: Verify that shopping bag should get empty once the order is placed

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
When I place order on review page
Then I should see the order confirmation page
When I navigate to shopping bag page
Then I should see shopping bag is empty with error message "<expectedErrorMessage>"

Examples:  Shipping & Billing Information Test Data
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|expectedErrorMessage|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail.com|123|456|7890|Your Current Shopping Bag is empty.|

@automated
Scenario Outline: Verify creating a profile while checkout with already existing email id.

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
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|createprofileemailaddress|createprofileconfirmemail|createprofilepwd|createprofileconfirmpwd|birthmonth|birthdate|birthyear|errormessage|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|June|2013|111|qa@gmail.com|123|456|7890|nisum1@yahoo.com|nisum1@yahoo.com|12345|12345|December|30|1987|Please note: due to an issue, we were unable to create your new profile. We still want to know more about you, so we ask that you create your online account in our profile page|

Scenario Outline: Verify that order number should be displayed in order confirmation page after placing an order.

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
When I place order on review page
Then I should see the order confirmation page
	And I should see the order number
		
Examples:  Shipping, Billing Information & Create Profile Test Data
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail.com|123|456|7890|


Scenario Outline: Verify that order total should be displayed in order confirmation page after placing an order.

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
When I place order on review page
Then I should see the order confirmation page
	And I should see the order total
		
Examples:  Shipping, Billing Information & Create Profile Test Data
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail.com|123|456|7890|