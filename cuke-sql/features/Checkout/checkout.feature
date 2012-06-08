Feature:  General Smcuoke Tests To Insure That The Checkout Application Is Ready For Testing

Scenario:  As a guest user, I should be able to see all the details on the order review page.

Given I am on the Macy's home page
	And I select "for the home" from the navigation menu
When I select the category "Bed & Bath"
Then I should see "Jeans" as the current category
When I select quick view from the "first" product
Then I should see the quick view overlay
When I select "32x40" from the size pulldown
Then I should see the "standard" shipping availability message
When I click "Add To Bag" 
Then I see "1 Item Added To Bag" 
When I click "Checkout"  
Then I am on the shopping bag page as a "guest"
	And my item(s) are in the shopping bag
	And my merchandise total is correct
	And my estimated "<prices>" are correct
		|prices		|
		|taxes		|
		|shipping	|
When I click "Continue Checkout"
Then I am on the "Macy's Checkout Sign In" Page
When I click "Checkout Without Profile"
Then I am on the "Shipping Information" Page



