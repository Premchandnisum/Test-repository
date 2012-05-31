Feature:  New Checkout - Shipping page validations

@automated
Scenario: Shipping page validations messages with invalid information

Given I am on the Macy's home page
Then I navigate to product detail page with product id withbackground "<prodid>"
|prodid|
|1310|
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
|Macy Auto|MacysBBQA|685 Market Street|Montgomery|San Fransisco||94538|133|446|3356|You did not select a State from the menu. Please select a State to complete this form.|
|QA Test|MacysTest|685 Market Street|Montgomery|San Fransisco|California|94538|923|856|5456|Your Zip Code must be 5 digits. Please try again.|
|QATestAuto|MacysQABB|685 Market Street|Montgomery|San Fransisco|California|94538|399|456|3|Your Phone Number must be entered in this format: 800-555-1212 and may not all be the same number. Do not use (parentheses) for the area code. Please try again.|
