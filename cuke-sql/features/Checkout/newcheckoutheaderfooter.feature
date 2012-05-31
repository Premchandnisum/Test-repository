Feature:  New Checkout Regression Testing - Verify header and foote functionality

@automated
Scenario: Verify the footer links in checkout pages.

Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
 # Check whether it's Master PDP or Standard
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
@automated
Scenario: Verify the header links in checkout pages.
Given I am on the Macy's home page
Then I navigate to product detail page with product id "<prodid>"
# Check whether it's Master PDP or Standard
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
