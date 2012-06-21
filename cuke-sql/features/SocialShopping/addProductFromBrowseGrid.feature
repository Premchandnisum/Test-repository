Feature: Add Product Via Button from Browse Grid
    As a Macys.com user,
    I want to select products to add to my initiated poll from the browse grid
    so that I can share with my friends

@addpoll
Scenario: Add to poll button displays and I'm able to add Member Products
	Given I am on "Dresses" catalog browse page
     	And the polling widget is active
 	Then I see the add to poll button under each product thumbnail
    When I click on add to poll button under the 1 browse grid thumbnail
    Then The 1 slot in the polling widget is populated
         And The poll has 1 products
         And The image displayed in the 1 slot of the polling widget should be the same image displayed on the 1 browse grid thumbnail
