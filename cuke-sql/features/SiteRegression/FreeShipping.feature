Feature: Regression Testing Of Macys.com free shipping


# Test may need to be updated
@HIGH
@MCOM-59411
@wip
Scenario:  Coach are excluded from Free Shipping promotion

Given I am on the Macy's home page
	And I have 0 items in my shopping bag
    And I search for "COACH"
    And I sort by price the product list, "High To Low"
    And I select a product
    And I add the product to my bag
	And I click checkout
Then I "should" see "FREE" for Estimated Shipping
When I decide to "Continue Shopping"
	And I have 1 items in my shopping bag
    And I search for "Movado"
    And I sort by price the product list, "High To Low"
    And I select a product
    And I add the product to my bag
	And I click checkout
Then I "should" see "FREE" for Estimated Shipping

@MEDIUM
@WIP
Scenario:  The sum of a Coach item less than $99 and a non Coach item less than $99, whose total is greater than $99, should not qualify for free shipping

Given I am on the Macy's home page
	And I have 0 items in my shopping bag
When I search for "Coach"
	And I select the facet "$60 to $99.99"
	And I select a product
	And I add the product to my bag
	And I click checkout
Then I "should not" see "FREE" for Estimated Shipping
	And I search for "fossil"
	And I select the facet "$60 to $99.99"
	And I select a product
	And I add the product to my bag
	And I click checkout
Then I "should not" see "FREE" for Estimated Shipping

@HIGH
Scenario:  Shipping Overlay Charges	
Given I am on the Macy's home page
	And I have 0 items in my shopping bag
When I add a "COACH" product to my shopping bag
	And I click checkout
	And I click on Estimated Shipping link
Then I should see the Estimated Shipping pop up


  
