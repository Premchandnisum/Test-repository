Feature:  New Checkout Regression Testing - Verify redirections functioanlity (Registry, VGC, Wishlist items and Sign In User flows)

@automated
Scenario: Verify that legacy ckechout page should be displayed when we have registry item in bag.

Then I navigate to GVR page
When I add registry items to bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I am on legacy shipping address page

@automated
Scenario: Verify that legacy ckechout page should be displayed when user has VGC item in bag.

Given I am on the Macy's home page
Then I navigate to product detail page with product id "<Prod_Id>"
# Check whether it's Master PDP or Standard
When I add items on bag
Then I am on the your shopping bag page
When I continue checkout on your shopping bag page
Then I am on checkout signin page
When I continue as a guest user
Then I am on legacy shipping address page

@wip
Scenario: Open browser for 5 times

Given I would like to open macys site for 5 times