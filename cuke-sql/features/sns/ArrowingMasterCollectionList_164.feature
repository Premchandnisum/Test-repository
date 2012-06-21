Feature: Show Master Collection List

  As a Sales Associate,
	 	As a Sales Associate, I would like to the Master “live” PDP screen to include all member products that are part of the collection, 
	 	so that I can see all the products part of a collection.
  
  Acceptance Criteria: http://mingle/projects/oti/cards/163
  
Background: 

@sns_01
@automated
Scenario: Shows the list of member products of the Master Collection
  Given I am on POS simulator page
  When I search POS for "webId" "671091"
  Then I should see title "Find Merchandise - "
  When I press "ENTER" key 1 time(s)
  Then I should see title "Find Merchandise - "
  And I should see the following product(s) 
     |Item							|Color					|
     |Twin Duvet...					|Modern Block  			|
     |Platinum Tw...				|QUILTED PLATINUM  		|
     |European Sh..  				|Modern Block			|	 
     |Standard Sh...				|Modern Block  			|
     |Platinum Eu...				|QUILTED PLATINUM  		|
     |Platinum Shapes 18" Squa...	|PLATINUM SHAPES  		|
     |Embroidered Platinum 10"...	|EMBROIDERED PLATINUM  	|
     |Platinum St...				|QUILTED PLATINUM  		|	
     |Deco White Twin Bedskirt		|WHITE  				|

   When I press "down arrow" key 2 time(s)
   Then the selected product should be "European Sh.."
   When I press "up arrow" key 1 time(s)
   Then the selected product should be "Hotel Collection Bedding, Deco Quilted Platinum Tw..."
   # When I press "left arrow" key 1 time(s)
   # Then the selected product should be "Hotel Collection Bedding, Deco Quilted Platinum Tw..."
   # When I press "right arrow" key 1 time(s)
   # Then the selected product should be "Hotel Collection Bedding, Deco Quilted Platinum Tw..."   
   When I press "down arrow" key 3 time(s)
   Then the selected product should be "Hotel Collection Bedding, Deco Quilted Platinum Eu..."   

   When I press "down arrow" key 4 time(s)
   Then the selected product should be "Hotel Collection Bedding, Deco White Twin Bedskirt"   
   When I press "down arrow" key 1 time(s)
   Then the selected product should be "Hotel Collection Bedding, Deco White Twin Bedskirt"   
   When I press "Enter" key 1 time(s)
   Then I should see title "Find Merchandise - Size/Color Options"
   And I should see the product name "Hotel Collection Bedding, Deco White Twin Bedskirt"

@sns_02
@automated
Scenario: Click on T4    
  Given I am on POS simulator page
  When I search POS for "webId" "671091"
  Then I should see title "Find Merchandise - "
  When I press "ENTER" key 1 time(s)
  Then I should see title "Find Merchandise - "
  When I press "down arrow" key 7 time(s)
  Then the selected product should be "Hotel Collection Bedding, Deco Quilted Platinum St..."   
  When I press "T4" "Size/Color Options"
  Then I should see title "Find Merchandise - Size/Color Options"
  And I should see the product name "Hotel Collection Bedding, Deco Quilted Platinum Standard Sham"
