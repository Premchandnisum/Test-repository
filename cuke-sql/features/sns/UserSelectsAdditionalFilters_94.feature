Feature: User Selects Additional Filters

  As a Sales Associate, I would like to be able to continue to narrow search results by selecting additional filters in other categories
  so that I have even fewer products to look at. 
  
  
  Acceptance Criteria: http://mingle/projects/oti/cards/94
  
Background: 
  
@automated
Scenario: User Selects Additional Filters
  Given I am on POS simulator page
  When I search POS for "keyword" "silk linen"
  Then I should see title "Find Merchandise - Search Results"
  When I press "T3" "Other 'Narrow by' Options"
  Then I should see title "Find Merchandise - Other"
  	And I should see title "Narrow by"
  When I press "down arrow" key 3 time(s)
  # Then I should see the radio button active next to size
  When I press "Enter" key 1 time(s)
  Then I should see title "Find Merchandise - Narrow By Size"
  When I press "down arrow" key 1 time(s)
  Then I should see the selection of "Regular"
  When I press "Enter" key 1 time(s)
  Then I should see title "Find Merchandise - Search Results"
  And I should see the product name "Lauren by Ralph Lauren Wendelin Linen Ruffle Front Blouse & Danni Straight Leg Ankle Trousers"
  When I press "T1" "Narrow by Brand"
  When I press "down arrow" key 3 time(s)
  Then I should see the selection of "Lauren by Ralph Lauren"
  When I press "Enter" key 1 time(s)
  Then I should see title "Find Merchandise - Search Results"
  And I should see the product name "Lauren by Ralph Lauren Wendelin Linen Ruffle Front Blouse & Danni Straight Leg Ankle Trousers"
  
   
  
  
  
  
  
  
  
  
  
  
  
  
  