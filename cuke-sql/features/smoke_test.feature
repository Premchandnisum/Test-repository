Feature:  General Smoke Tests To Insure That The Checkout Application Is Ready For Testing


Scenario:  Navigation Menu Check
Given I am on the Macy's home page
	And I select "for the home" from the navigation menu
When I select the category "Bed & Bath"
Then I should see "Bed & Bath" as the current category
When I select the category "Bedding Collections"
# When I select quick view from the "first" product
When I select the first item from collection
