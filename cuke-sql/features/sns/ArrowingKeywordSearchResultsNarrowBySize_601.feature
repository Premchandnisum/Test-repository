Feature: Arrowing Keyword Search Result Narrow By Size

  As a Sales Associate,
	 I would like to be able to arrow through and select a filter value in T1 ï¿½Narrow by Brandï¿½, T2 ï¿½Narrow by Product Typeï¿½ ,or T3 ï¿½Other Narrow by Optionsï¿½
	 So that I can choose a filter and request my search results being narrowed by that filter.
  
  Acceptance Criteria: http://mingle/projects/oti/cards/601
  
@sns_04  
@automated
Scenario: Search Results will be filtered by size
  Given I am on POS simulator page
  When I search POS for "keyword" "silk linen"
  Then I should see title "Find Merchandise - Search Results"
  When I press "T3" "Other 'Narrow by' Options"
  Then I should see title with embedded quotes "Find Merchandise - Other "Narrow by" Options"
  When I press "down arrow" key 3 time(s)
  # Then I should see the radio button active next to size
  When I press "Enter" key 1 time(s)
  Then I should see title "Find Merchandise - Narrow By Size"
  	And I should see the instructional text "Select a size using the arrow keys and press Enter to apply."
  	And I should see the selection of "All Sizes" 
  When I press "left arrow" key 1 time(s)
  Then I should see the selection of "All Sizes"
  When I press "right arrow" key 1 time(s)
  Then I should see the selection of "Regular"
  When I press "up arrow" key 1 time(s)
  Then I should see the selection of "All Sizes"
  When I press "down arrow" key 1 time(s)
  Then I should see the selection of "Regular"
  When I press "down arrow" key 20 time(s)
  Then I should see the selection of "XL"
  When I press "down arrow" key 1 time(s)
  Then I should see the selection of "XL"
  When I press "up arrow" key 20 time(s)
  Then I should see the selection of "All Sizes"
  When I press "Enter" key 1 time(s)
  Then I should see title "Find Merchandise - Search Results"
