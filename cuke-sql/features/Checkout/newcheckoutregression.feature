Feature:  New Checkout 2.1 Funtionality Regression Testing 

# ******************** Shipping Page *********************#
@high
@regression
@smoke
@shipping
@chkshipurl
Scenario: Verify the checkout shipping page URL
Given I am on the Macy's home page
Then I navigate to product detail page with common product id "<prodid>"
|prodid|
|654203|
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
	And I should see the shipping page URL

@medium
@regression
@shipping
@chkshipgiftoptionno
Scenario: Verify that gift option is set to NO by default
Given I am on the Macy's home page
Then I navigate to product detail page with common product id "<prodid>"
|prodid|
|1310|
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
	And I should see the gift option set to NO by default

@medium
@regression
@shipping
@chkshipiship
Scenario: Verify that international home page should be displayed on 
clicking shipping internationally link in shipping page.
Given I am on the Macy's home page
Then I navigate to product detail page with common product id "<prodid>"
|prodid|
|1310|
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
When I click on shipping internationally link
Then I am on international home page

@medium
@regression
@shipping
@chkshipaddressvalidation
Scenario Outline: Verify that address validation should happen in shipping page
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
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
Then I should see shipping address validation happens "<errormessage>"

Examples: Invalid shipping address
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|errormessage|
|1310|QA123|Macys|685 market street|Montgomery|San Fransisco|California|94538|123|456|3456|Shipping Address is invalid|

@medium
@regression
@shipping
@chkshipvalidations
Scenario: Shipping page validations messages with invalid information
Given I am on the Macy's home page
Then I navigate to product detail page with common product id "<prodid>"
|prodid|
|654203|
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
	And I enter invalid shipping details firstname "<firstname>", lastname "<lasttname>",addresslineone "<addresslineone>", addresslinetwo "<addresslinetwo>", city "<city>", state "<state>", zipcode "<zipcode>", phonenumberareacode "<phonenumberareacode>",phonenumberexchangeNbr "<phonenumberexchangeNbr>",phonenumbersubscriberNbr "<phonenumbersubscriberNbr>", expectederrormessage"<expectederrormessage>" 
|firstname|lastname|addresslineone|addresslinetwo|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|expectederrormessage|
|QA123|MacysAuto|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|3456|First Name is a required field and may only contain letters and hyphens. Your entry may not exceed 20 characters.|
|Test|Macys677|685 Market Street|Montgomery|San Fransisco|California|94538|432|122|5432|Last Name is a required field and may only contain letters and hyphens. Your entry may not exceed 20 characters.|
|Automation|MacysQA||Montgomery|San Fransisco|California|94538|223|124|0321|Street Address is a required field and may only contain letters, numbers and #. Your entry may not exceed 35 characters, including spaces.|
|QAAuto|MacysTest|685 Market Street|Montgomery||California|94538|999|324|1456|City is a required field and may only contain letters, numbers and apostrophes.Your entry must not exceed 25 characters, including spaces.|
|Macy Auto|MacysBBQA|685 Market Street|Montgomery|San Fransisco|Select|94538|133|446|3356|You did not select a State from the menu. Please select a State to complete this form.|
|QA Test|MacysTest|685 Market Street|Montgomery|San Fransisco|California|94|923|856|5456|Your Zip Code must be 5 digits. Please try again.|
|QATestAuto|MacysQABB|685 Market Street|Montgomery|San Fransisco|California|94538|399|456|3|Your Phone Number must be entered in this format: 800-555-1212 and may not all be the same number. Do not use (parentheses) for the area code. Please try again.|

@medium
@regression
@shipping
@chkshipstandardshipmethod
Scenario: Verify that standard shipping method should be selected by default when merchandise total is less than $99
Given I am on the Macy's home page
Then I navigate to product detail page with common product id "<prodid>"
|prodid|
|1310|
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
	And I should see standard shipping method is selected by default

@high
@regression
@shipping
@chkshipfreeship
Scenario: Verify that every day free shipping method should be selected by default when merchandise total is greater than $99
Given I am on the Macy's home page
Then I navigate to product detail page with common product id "<prodid>"
|prodid|
|1310|
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
	And I should see every day free shipping method is selected by default

@medium
@regression
@shipping
@chkshipgiftiptionsyes
Scenario: Verify that gift options should be displayed when gift option 'YES' is selected.
Given I am on the Macy's home page
Then I navigate to product detail page with common product id "<prodid>"
|prodid|
|1310|
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
When I select gift option 'YES' in shipping page
Then I should see all gift options 

@medium
@regression
@shipping
@chkshipgiftmsgchkbox1
Scenario: Verify that gift message check box should be disabled if the item in bag has gift message restriction.
Given I am on the Macy's home page
Then I navigate to product detail page with common product id "<prodid>"
|prodid|
|1310|
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
When I select gift option 'YES' in shipping page
Then I should see all gift options
	And I should see gift message check box should be disabled

@medium
@regression
@shipping
@chkshipgiftmsgchkbox2
Scenario: Verify that gift wrap check box should be disabled if the item in bag has gift wrap restriction.
Given I am on the Macy's home page
Then I navigate to product detail page with common product id "<prodid>"
|prodid|
|1310|
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
When I select gift option 'YES' in shipping page
Then I should see all gift options
	And I should see gift wrap check box should be disabled

@medium	
@regression
@shipping
@chkshipstaterestriction
Scenario Outline: Verify shipping state restriction message on shipping page when user try to continue checkout with state restricted items.
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
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
Then I should see shipping state restriction error message in shipping page "<errormessage>"

Examples: Shipping & Billing Information Test Data
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|errormessage|
|1310|QA|Macys|685 |Montgomery|San Fransisco|California|94538|123|456|7890|There are shipping restrictions on items in your bag. These items can not be shipped to the shipping address provided. Please remove from your bag to continue.|

@medium
@regression
@shipping
@chkshiplimitedavailability
Scenario Outline: Verify limited availability message on shipping page when user try to continue checkout with such items.
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
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
Then I should see limited quantity availability error message in shipping page "<errormessage>"

Examples: Shipping & Billing Information Test Data
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|errormessage|
|1310|QA|Macys|685 |Montgomery|San Fransisco|California|94538|123|456|7890|Our item availability shows that you have requested <QTY requested>, but we only have <QTY available> available. We have adjusted your shopping bag accordingly.|

@medium
@regression
@shipping
@chkshipmethodrestriction
Scenario: Verify shipping methods restrictions on shipping page.
Given I am on the Macy's home page
Then I navigate to product detail page with common product id "<prodid>"
|prodid|
|1310|
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
	And I should see disabled premium and express shipping methods
	
@high	
@regression
@smoke
@shipping
@chkshippromocodedisplay
Scenario: Verify Promo code field is displayed in Mini bag page
Given I am on the Macy's home page
Then I navigate to product detail page with common product id "<prodid>"
|prodid|
|1310|
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
	And I see promo_code displayed

@medium
@regression
@smoke
@shipping
@chkshipbackonestepbtn
Scenario: Verify back one step from shipping page
Given I am on the Macy's home page
Then I navigate to product detail page with common product id "<prodid>"
|prodid|
|1310|
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
When I enter shipping details
When I go back one step
Then I am on the your shopping bag page

@high
@regression
@shipping
@chkshipremoveitembacktobag
Scenario Outline: Verify that shopping bag page should be displayed on clicking remove button in shipping page when all the items in bag are unavailable
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
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
	Then I should see the product unavailability error message "<productunavailabilityerrormessage>"
	And I should see the remove button beside the item
When I click on remove button beside the item
	Then I am on the your shopping bag page
	And I should see the shopping bag empty message "<shoppingbagemptymessage>"
	

Examples: Shipping & Billing Information Test Data
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|productunavailabilityerrormessage|shoppingbagemptymessage|
|1310|QA|Macys|685 Market Street|Montgomery|San Francisco|California|94538|123|456|7890|Few line Item errors please check|Your shopping bag is empty|

#*************************** Payment page **********************#

@high
@regression
@smoke
@payment
@chkpaymentpage
Scenario Outline: Verify user should be navigates to Payment page with success data
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
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

Examples: Shipping Information - Successfull Data
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|
|1218|Hello|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|

@high
@regression
@smoke
@payment
@chkpaymenturl
Scenario Outline: Verify the payment page url
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
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

@medium
@regression
@smoke
@payment
@chkpaymentexpdateandsecurity
Scenario Outline: Verify that expiration date fields and security code field should be disabled for prop cards
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
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

@high
@regression
@smoke
@payment
@chkpaymentegcoverlay
Scenario Outline: Verify that EGC overlay should be displayed on clicking add card button in payment page.
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
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

@medium
@regression
@payment
@chkpaymentcardvsnumbervalidation
Scenario Outline: Verify that card type Vs card number validation should happen in payment page - Verify error message
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
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

@medium
@regression
@payment
@chkpaymentcardmasked
Scenario Outline: Verify that credit card number should be masked when ever any validation happens in payment page.
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
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

@high
@regression
@payment
@chkpaymentpagefromshippingwhileedit
Scenario Outline: Verify that payment page should be displayed when user navigates to shipping page from order review page, edits the shipping info and clicks continue checkout.
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
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

@medium                                                 
@regression
@payment
@chkpaymentegcmasked
@WIP
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
#Then I should see EGC overlay
	#And I enter egcnumber "<egcnumber>"
	#And I enter captcha "<captcha>"
#When I click add card button on egc overlay
#Then I should see EGC overlay
	#And I should see the EGC number masked

Examples:
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|egcnumber|captcha|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|12345678|abC1d|

@medium
@regression
@payment
@chkpaymentegcfieldclear
@WIP
Scenario Outline: Verify that captcha text field should be cleared when ever any validation happens on EGC overlay.
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
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

@medium
@regression
@payment
@chkpaymentnewegccaptch
@WIP
Scenario Outline: Verify that new captcha should be display when clicks on new image on EGC overlay.
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
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

@high
@regression
@payment
@chkpaymentcreateprofile
Scenario Outline: Verify when DOB is les than 13 years of age user should not be able to create a profile.
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
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

@medium
@regression
@payment
@chkpaymentsecuritycodeclear
Scenario Outline: Verify Security code field is getting cleared when an error message is prompted in payment page.
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
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

@medium
@regression
@payment
@chkpaymentbtnsegcoverlay
@WIP
Scenario Outline: Verify  the buttons/fields on EGC overlay.
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
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
    #And I should see card number text field in EGC overlay
    #And I should see captcha image in EGC overlay
    #And I should see new image button in EGC overlay
    #And I should see text field to enter captcha in EGC overlay
    #And I should see submit button in EGC overlay
    #And I should see cancel button in EGC overlay

Examples: Shipping & Billing Information Test Data
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|

@high
@regression
@payment
@chkpaymentpage2
Scenario:  Navigate to Payment with Valid Shipping info - without profile
Given I am on the Macy's home page
Then I navigate to product detail page with common product id "<prodid>"
|prodid|
|1310|
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
When I enter shipping details
When I continue checkout on shipping page
Then I should see the Payment page

@medium
@regression
@smoke
@payment
@chkpaymentbillingaddresssameasshipping
Scenario: Verify 'billing address same as shipping address' functionality on payment page.
Given I am on the Macy's home page
Then I navigate to product detail page with common product id "<prodid>"
|prodid|
|1310|
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
When I enter shipping details
When I continue checkout on shipping page
Then I should see the Payment page
When I enter credit card details
	And I enter billing address
Then I validate billing address same as shipping address

@medium
@regression
@smoke
@payment
@chkpaymentbackonestep
Scenario: Verify back one step from payment page
Given I am on the Macy's home page
Then I navigate to product detail page with common product id "<prodid>"
|prodid|
|1310|
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
When I enter shipping details
When I continue checkout on shipping page
Then I should see the Payment page
When I go back one step
Then I should see the Shipping page

#**************************Order review ****************************#
@high
@regression
@smoke
@orderreview
@chkreviewpage
Scenario Outline: Verify user should be navigates to Order review page with success data
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
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

@high
@regression
@smoke
@orderreview
@chkreviewpageurl
Scenario Outline: Verify order review page URL
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
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

@medium
@regression
@orderreview
@chkreviewcontactdetails
Scenario Outline: Verify Contact details in Order review page
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
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

@high
@regression
@smoke
@orderreview
@chkreviewplaceorder1
Scenario:  Place an order with valid Shipping, Payment details and verify order number in Order Confirmation page - Checkout without profile
Given I am on the Macy's home page
Then I navigate to product detail page with common product id "<prodid>"
|prodid|
|1310|
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
When I enter shipping details
When I continue checkout on shipping page
Then I should see the Payment page
When I enter credit card details
	And I enter billing address
When I continue checkout on payment page
Then I should see the order review page

@medium		  
@regression
@orderreview
@chkreviewplaceorder2
Scenario:  Place an order with valid Shipping, Payment details and verify order number in Order Confirmation page - Checkout without profile
Given I am on the Macy's home page
Then I navigate to product detail page with common product id "<prodid>"
|prodid|
|1310|
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
	And I verify merchandise total
When I enter shipping details
When I continue checkout on shipping page
Then I should see the Payment page
	And I verify merchandise total
When I enter credit card details
    And I enter billing address
When I continue checkout on payment page
Then I should see the order review page

@high  
@regression
@smoke
@orderreview
@chkreviewpagesecure
Scenario: Verify checkout pages should be secure
Given I am on the Macy's home page
Then I navigate to product detail page with common product id "<prodid>"
|prodid|
|1310|
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
	And I see the page is secure
When I enter shipping details
When I continue checkout on shipping page
Then I should see the Payment page
	And I see the page is secure
When I enter credit card details
	And I enter billing address
When I continue checkout on payment page
Then I should see the order review page
	And I see the page is secure

@medium
@regression
@orderreview
@chkreviewfields
Scenario: Verify feilds on order review page
Given I am on the Macy's home page
Then I navigate to product detail page with common product id "<prodid>"
|prodid|
|1310|
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
When I enter shipping details
When I continue checkout on shipping page
Then I should see the Payment page
When I enter credit card details
	And I enter billing address
When I continue checkout on payment page
Then I should see the order review page
	And I validate the fields_and_buttons on ordereview page

@high	
@regression
@orderreview
@chkreviewclickshippinginfo
Scenario:  Click change shipping info button in order review page, update the details in shipping page and continue checkout.
Given I am on order review page of new checkout
When I click the edit shipping address button
Then I should see the Shipping page
	And I edit shipping address
When I continue checkout on shipping page
Then I should see the Payment page
When I continue checkout on payment page
Then I should see the order review page
	And shipping address should be updated in order review page

@high
@regression
@orderreview
@chkreviewclickpaymentinfo
@WIP
Scenario:  Click change payment info button in order review page, update the details in payment page and continue checkout.
Given I am on order review page of new checkout
When I click the edit payment address button
Then I should see the Payment page
	And I enter security code "123"
	#And I enter new payment information
When I continue checkout on payment page
Then I should see the order review page
	And I see updated payment information

@medium
@regression
@orderreview
@chkreviewshippingandbillinginfo
Scenario:  Verify Shipping details and Billing details on Order review page
Given I am on order review page of new checkout
Then the shipping address should be correct on order review page
	And the billing address should be correct on order review page
	
#*********************Order Confirmation*****************#
@high
@regression
@smoke
@orderconfirm
@chkorderconfirmurl
Scenario Outline: Verify order confirmation page URL.
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
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

@high
@regression
@smoke
@orderconfirm
@chkorderconfirmnewprofile
Scenario Outline: Veriify New profile confirmation display in order confirmation page
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
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

@average
@regression
@orderconfirm
@chkorderconfirmcreateprofilealreadyexists
Scenario Outline: Verify creating a profile while checkout with already existing email id.
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
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

@high
@regression
@smoke
@orderconfirm
@chkorderconfirmordernumber
Scenario Outline: Verify that order number should be displayed in order confirmation page after placing an order.
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
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

@medium
@regression
@orderconfirm
@chkorderconfirmordertotal
Scenario Outline: Verify that order total should be displayed in order confirmation page after placing an order.
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
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

@medium
@regression
@orderconfirm
@chkorderconfirmerrormsgs
Scenario Outline: Verify that error message should be displayed in order review/order confirmation page when the system is in batch mode.
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
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
	And I should see error message "<errormessage>"
When I place order on review page
Then I should see the order confirmation page
	And I should see error message "<errormessage>"	
	
Examples:  Shipping, Billing Information & Create Profile Test Data
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|errormessage|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail.com|123|456|7890|Were sorry. Our inventory system is temporarily unavailable. We will send you an e-mail confirming availability and shipment time as soon as our system is back online. You may cancel your order at that time if the shipment time is unacceptable, and your account will not be charged. Please proceed with your order, or try again later. Please note, for Premium 2 Day and Express Overnight Shipping, your expected ship date on the confirmation page will not reflect the shorter processing time. If your merchandise is in stock, we will expedite your order once our inventory systems become available again.|

# *********** mini bag and other common functions ***************#
@medium
@regression
@minibag
@chkminibagicon
Scenario Outline: Verify that shopping bag page should be displayed on clicking bag icon in mini bag section of checkout pages
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
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

@medium
@regression
@smoke
@minibag
@chkminibagid
Scenario Outline: Verify that bag id displayed in shopping bag page and checkout pages should be same for a guest user

Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
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

@medium
@regression
@smoke
@minibag
@chkminiordertotal
Scenario: Verify that order total displayed in shopping bag page and shipping page should be same.
Given I am on the Macy's home page
Then I navigate to product detail page with common product id "<prodid>"
|prodid|
|1310|
When I add items on bag
Then I am on the your shopping bag page
	And  order total should be displayed in shopping bag
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
	And order total in mini bag should be same as in shopping bag

@regression
@minibag
@chkminitax
Scenario: Verify that flat tax is calculated in shipping page.
Given I am on the Macy's home page
Then I navigate to product detail page with common product id "<prodid>"
|prodid|
|1310|
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
	And I should see flat tax displayed in order summary

@high
@regression
@smoke
@minibag
@chkminitemcount
Scenario Outline: Verify that item count in shopping bag page and in the mini bag section of checkout pages should be same.
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
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

Examples:  Shipping & Billing Information Test Data
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail.com|123|456|7890|

@medium
@regression
@minibag
@chkminifreeforgwp
Scenario Outline: Verify that price should be displayed as FREE for GWP item in mini bag.
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
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

@medium
@regression
@minibag
@chkminipwp
Scenario Outline: Verify that price for PWP should be displayed as price after dedcuting discount
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
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

@high
@regression
@smoke
@minibag
@chkminibagempty
Scenario Outline: Verify that shopping bag should get empty once the order is placed
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
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

@medium
@regression
@minibag
@chkminipromoapply
Scenario Outline: Verify that order summary should be updated when promo code is applied
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
	And I enter a promo code "<promocode>"
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
# When I place order on review page
# Then I should see the order confirmation page

Examples:  Shipping & Billing Information Test Data
|prodid|promocode|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|1310|X88LAL232XUX|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail.com|123|456|7890|

@medium
@regression
@minibag
@chkminipromoremove
Scenario Outline: Verify that order summary should be updated when promo code is removed
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
	And I enter a promo code "<promocode>"
When I apply promo code
Then I should see the order summary details are updated
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
# When I place order on review page
# Then I should see the order confirmation page

Examples:  Shipping & Billing Information Test Data
|prodid|promocode|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|1310|X88LAL232XUX|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail.com|123|456|7890|

@medium
@regression
@minibag
@chkmininewbagid
Scenario Outline: Verify that bag id should be updated once user places an order and again add an item and 
go to shipping page
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
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
#When I place order on review page
#Then I should see the order confirmation page

Examples:  Shipping & Billing Information Test Data
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|July|2013|111|qa@gmail.com|123|456|7890|

@high
@regression
@smoke
@minibag
@chkminitopdp
Scenario Outline: Verify that PDP should be displyed when clicked on product image/name
Given I am on the Macy's home page
Then I navigate to product detail page with common product id "<prodid>"
|prodid|
|1310|
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

@average
@regression
@minibag
@chkminisurcharge
Scenario Outline: Verify that shipping surcharge amount should be displayed in checkout pages
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
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
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|June|2013|123|qa@gmail.com|123|456|7890|

@average
@regression
@minibag
@chkminipersonalizedfee
Scenario Outline: Verify that personalized fee amount should be displayed in checkout pages
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
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
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|June|2013|123|qa@gmail.com|123|456|7890|

@medium
@regression
@minibag
@chkminisalestax
Scenario Outline: Verify that sales tax amount should be displayed in checkout pages
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
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
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|1310|QA|Macys|685 Market Street|Montgomery|San Fransisco|California|94538|123|456|7890|Visa|4111111111111111|June|2013|123|qa@gmail.com|123|456|7890|

@high
@regression
@smoke
@minibag
@chkminibagshouldbedisplay
Scenario: Verify Mini bag should be displayed in all the Checkout pages till Order review
Given I am on the Macy's home page
Then I navigate to product detail page with common product id "<prodid>"
|prodid|
|1310|
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
	And I see minibag displayed
When I enter shipping details
When I continue checkout on shipping page
Then I should see the Payment page
When I enter credit card details
	And I enter billing address
When I continue checkout on payment page
Then I should see the order review page
	And I see minibag displayed

@high
@regression
@smoke
@minibag
@chkminibagidallpages
Scenario: Verify bag id should be displayed in all the Checkout pages till Order review
Given I am on the Macy's home page
Then I navigate to product detail page with common product id "<prodid>"
|prodid|
|1310|
When I add items on bag
Then I am on the your shopping bag page
	And I see bag_id displayed
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
	And I see bag_id displayed
When I continue checkout on shipping page
Then I should see the Payment page
	And I see bag_id displayed
When I enter credit card details
	And I enter billing address
When I continue checkout on payment page
Then I should see the order review page
	And I see bag_id displayed

@medium
@regression
@chkpagetitles
Scenario: Verify checkout pages titles
Given I am on the Macy's home page
Then I navigate to product detail page with common product id "<prodid>"
|prodid|
|1310|
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
When I enter shipping details
When I continue checkout on shipping page
Then I should see the Payment page
When I enter credit card details
	And I enter billing address
When I continue checkout on payment page
Then I should see the order review page

@medium
@regression
@chkfreeshiprules
Scenario Outline: Verify free shipping rules on checkout pages.
Given I am on the Macy's home page
Then I navigate to product detail page with common product id "<prodid>"
|prodid|
|1310|
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
	And I should see the ship method based on the order total
	
@regression
@smoke
@chkordersummaryincheckoutpages
Scenario Outline: Verify the order summary details displayed in checkout pages
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
    And I should see the order summary details
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
    And I should see the order summary details
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
    And I should see the order summary details

Examples: Shipping & Billing Information Test Data
|prodid|firstname|lasttname|addressline1|addressline2|city|state|zipcode|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|cardtype|cardnumber|expmonth|expyear|securitycode|contactemailaddress|phonenumberareacode|phonenumberexchangeNbr|phonenumbersubscriberNbr|
|1310|QA|Macys|685 Market Street|Montgomery|San Francisco|California|94538|123|456|7890|Visa|4111111111111111|June|2013|123|qa@gmail.com|123|456|7890|

@medium
@regression
@chkbreadcrumbs
Scenario: Verify Page bread crumbs / Progress indicator
Then I navigate to product detail page with common product id "<prodid>"
   |prodid|
   |1310|
Then I see breadcrumbs on "PDP" page
	|first                   |second         |
	|Dining & Entertaining   | Fine China    |
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I should see the Shipping page
	And I see breadcrumbs on "shipping" page
	|first                   |second         |
	|current   | 1    |
When I enter shipping details
When I continue checkout on shipping page
Then I should see the Payment page
	And I see breadcrumbs on "payment" page
	|first                   |second         |
	|current   | 2    |
When I enter credit card details
	And I enter billing address
When I continue checkout on payment page
Then I should see the order review page
	And I see breadcrumbs on "review" page
	|first                   |second         |
	|present   | 3    |
	

#**************** Redirections **************************************#
@medium
@regression
@smoke
@redirections
@chkredirectvgc
Scenario: Verify that legacy ckechout page should be displayed when user has VGC item in bag.
Given I am on the Macy's home page
Then I navigate to product detail page with common product id "<prodid>"
|prodid|
|1310|
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I am on legacy shipping address page

@medium
@regression
@smoke
@redirections
@chkredirectregistry
@WIP
Scenario: Verify that legacy ckechout page should be displayed when we have registry item in bag.
Given I am on the Macy's home page
Then I navigate to GVR page
When I add registry items to bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I am on legacy shipping address page

#********************** Header and Footer links ********************************#
@medium
@regression
@headerfooterlinks1
@WIP
Scenario: Verify the footer links in checkout pages.
Given I am on the Macy's home page
Then I navigate to product detail page with common product id "<prodid>"
|prodid|
|1310|
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
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

@medium
@regression
@headerfooterlinks2
@WIP
Scenario: Verify the header links in checkout pages.
Given I am on the Macy's home page
Then I navigate to product detail page with common product id "<prodid>"
|prodid|
|1310|
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
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