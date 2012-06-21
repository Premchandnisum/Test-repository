Feature:  Unit Test For Basic Step definition

Scenario:  Basic search for a product 

Given I am on the Macy's home page
	And I have 0 items in my shopping bag
	And I select a category
	And I select a facet
When I search for "COACH"
#	And I sort the product list by choosing "Priced high to low"
    And I select a product
    And I add the product to my bag
	And I click checkout
Then I should see the item in my cart