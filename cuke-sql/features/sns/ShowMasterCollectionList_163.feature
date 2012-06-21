Feature: Show Master Collection List

  As a Sales Associate,
	 	As a Sales Associate, I would like to the Master “live” PDP screen to include all member products that are part of the collection, 
	 	so that I can see all the products part of a collection.
	 	
 Assumption: If a member product has more colors, the member product should have "Various Available" label
  
 Acceptance Criteria: http://mingle/projects/oti/cards/163
  
Background: 
    
@automated
Scenario Outline: Shows the list of member products of the Master Collection
  Given I am on POS simulator page
  When I search POS for "webId" "<webId>"
  Then I should see title "Find Merchandise - "
  When I press "ENTER" key 1 time(s)
  Then I should see title "Find Merchandise - "
  And I should see image on the left side
  And I should see the product name "Hotel Collection Bedding, Modern Block Collection" below the image
  And I should see the webId "<webId>" below product name
  And I should see the table headers "Item" and "Color" on the right side above the list of products
  # # And the box should be 283 pixel height
  # # And the box should be 394 pixel width
  # # And the box should have a vertical scrollbar if there are more member products than fit within the box height
  # # And the box should have a horizantal scrollbar if the character count of any product name and color exceeds the alotted width
  # # And I should see a column of space equal to 35 pixels to the left of the product name
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
  And I should see the "Twin Duvet..." with color "Modern Block" as default selected product with red border and yellow background   
  And I should see the T keys with following states
  |T key| Label					|Active|
  |T1	|Back to Search Results	| No|
  |T2	|Select Different Size	|Yes|
  |T3	|Product Details & Views|Yes|
  |T4	|Size/Color Options		|Yes|
  |T5	|Search again			|Yes|
  |T6	|View Larger Image		|Yes|
  |T7	|Check Availability		|No |
  |T8	|Exit Find Merchandise	|Yes|
	Examples:
		|webId|
		|671091 |
