Feature: T3 Item Details link

  As a Sales Associate,
	 	I would like to click from a UPC â€œItem Foundâ€ page to that productâ€™s detail page (PDP),
	 	so that I can see details and pictures

Acceptance Criteria:
http://mingle/projects/oti/cards/107
 
Background: 
  Given I am on POS simulator page

@sns_107_01 
Scenario: Scanned or entered a UPC for an inactive webId  
  When I search POS for "upc" "2222222222222"
  # When I am on the OutOfStock Page 
  # Then I should see title "Find Merchandise - Size/Color Options"
  # And I should see the webId
  # |label	| value|
  # |webId:   |222222|
  # And I should see the text "This product is currently out of stock for shipping."
  
@sns_107_02 
Scenario: Scanned or entered a UPC that is assigned to two active webIds
  When I search POS for "upc" "3333333333333"
  When I am on the product not eligible page 
  Then I should see title "Find Merchandise - Size/Color Options"
  And I should see the text "This product is not eligible to be sold from the fulfillment center."
  
@sns_107_03
Scenario: Scanned or entered a UPC assigned to one active and one inactive webId
  When I search POS for "upc" "4444444444444"
  When I am on the Standard Size and color Page 
  Then I should see title "Find Merchandise - Size/Color Options"
  And I should see the webId
  |label	| value|
  |webId:   |444444|
  
@sns_107_04 
@automated
Scenario: Scanned or entered a UPC assigned to two inactive webIds
  When I search POS for "upc" "5555555555555"
  #When I am on the PDP no data page
  Then I should see title "Find Merchandise - Size/Color Options"
  And I should see the following text
  |Text																|
  |Sorry, we do not have details for this product					|
  |This may be due to a technical error or the product is invalid	| 
  
  
  