Feature:  The following are a list of scenarios that verify that the build of the Macy's Ecommerce website is testable before the build is released into the of the QA Teams

Scenario Outline:  As a customer, when I search for a product on the website, I should land on the Search Result Landing Page

Given I am on the Macy's home page
	And I have 0 items in my shopping bag
When I search for "<term>"
Then I should the search results page with the search title for "<term>"

Examples:
	|	term			|
	|	jeans			|
	|	calvin klein	|
	|	651831			|

Scenario:  As a customer, when I select a category on the website, I should land on the category page

Given I am on the Macy's home page
	And I have categories available to select
When I select every category
Then every category should have a landing page

Scenario Outline:  As a customer, When I visit a catalog browse page, I should see a list of products
Given I am on the Macy's home page
	And I have categories available to select
When I select a category
	And I select a facet
Then I should see a list of products

Examples:
	| Test_Run	|
	| 1			|
	| 2			|
	| 3			|
	| 4			|
	| 5			|