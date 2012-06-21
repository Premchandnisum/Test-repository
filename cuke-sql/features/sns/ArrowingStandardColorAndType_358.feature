Feature: Arrowing Standard Color And Type

  As a Sales Associate,
	 	I would like to be able to arrow over different types for each color,
	 	 so that I can see an updated price and photo.
	 	
   Assumption: 100% of products with color and type are big ticket, so we have included the big ticket "Call to Order" message, and we have disabled "T7
   Check for Availability". If a product exists that is not big ticket, T7 should be active and the big ticket "Call to Order" message should not appear.
   
  Acceptance Criteria: http://mingle/projects/oti/cards/358
  
Background: 

@sns_05    
@automated
Scenario Outline: Arrowing through color & type
  Given I am on POS simulator page
  When I search POS for "webId" "<webId>"
  Then I should see title "Find Merchandise - Size/Color Options"
  	And I should see image on the left side
  	And I should see the product name "Spencer Leather Sectional Sofa, 2 Piece (Left Arm Facing Loveseat & Right Arm Facing Chaise)" below the image
  	And I should see the webId "<webId>" below product name
    And I should see the price below the web id
    #And I should see the price "Price not available" below the web id
    #And I should see the price "$2,360.00" below the web id
  	And I should see the following table headers on the right side above the list of types & colors
  		|Table Headers|
		|Color		|
		|Type		|
  # And the box should be 283 pixel height
  # And the box should be 394 pixel width
  # And the box should have a vertical scrollbar if there are more colors than fit within the box height
  # And the box should have a horizontal scrollbar if there are more types than fit within  the alloted width  
  And I should see the following Colors & Types 
  	 |color			|type				|
 	 |Brown 		|Left-Arm Facing	|
  	 |Brown			|Right-Arm Facing	|
  	 |Rose Beige	|Left-Arm Facing	|
  	 |Rose Beige	|Right-Arm Facing	|
  And I should see the following text
  	 |Text									|
 	 |Call to Order Now:					|
 	 |Call 1-800-BUY-MACY (289-6229)		|
  	 |We're available Mon-Sat 8AM-12AM ET	|
 	 |Sun 8AM-10PM ET						|
  And I should see the label "Color: "
  And I should see the label "Type: "
  And I should see "F3 - Cancel transaction"
  And I should see "ESC - Return to previous"    	 
  And I should see the following default selected product with red border and yellow background
	| color		 |type			  | price |
	| Rose Beige |Right-Arm Facing| price |
  When I press "up arrow" key 1 time(s)
  And I should see the default color "Rose Beige"
  And I should see the default type "Right-Arm Facing"

  And I should see the following default selected product with red border and yellow background
  	| color      | type            |price 	  |
  	| Rose Beige | Right-Arm Facing|price 	  |
  When I press "up arrow" key 1 time(s)
  And I should see the default color "Rose Beige"
  And I should see the default type "Right-Arm Facing"

  And I should see the following default selected product with red border and yellow background
  	| color      | type            |price 	  |
  	| Rose Beige | Right-Arm Facing|price 	  |
  When I press "left arrow" key 1 time(s)
  And I should see the default color "Rose Beige"
  And I should see the default type "Right-Arm Facing"

  And I should see the following default selected product with red border and yellow background
  	| color      | type            |price 	  |
  	| Rose Beige | Right-Arm Facing|price 	  |
  When I press "right arrow" key 1 time(s)
  And I should see the default color "Rose Beige"
  And I should see the default type "Left-Arm Facing"

  And I should see the following default selected product with red border and yellow background
  	| color      | type            |price 	  |
  	| Rose Beige | Left-Arm Facing|price 	  |
  When I press "right arrow" key 1 time(s)
  And I should see the default color "Brown"
  And I should see the default type "Right-Arm Facing"

  # And I should see the image "ImageRoseBeige_441068.jpg" 
  	And I should see image on the left side

  And I should see the following default selected product with red border and yellow background
  	| color		| type            |price 	|
  	| Brown 	| Right-Arm Facing|price 	|
  When I press "right arrow" key 1 time(s)
  And I should see the default color "Brown"
  And I should see the default type "Left-Arm Facing"

  And I should see the following default selected product with red border and yellow background
  	| color      | type            |price 	  |
  	| Brown      | Left-Arm Facing|price 	  |
  When I press "right arrow" key 1 time(s)
  And I should see the default color "Brown"
  And I should see the default type "Left-Arm Facing"

  And I should see the following default selected product with red border and yellow background
  	| color      | type            |price 	  |
  	| Brown      | Left-Arm Facing|price 	  |
  When I press "up arrow" key 1 time(s)
  And I should see the default color "Rose Beige"
  And I should see the default type "Left-Arm Facing"

  And I should see the following default selected product with red border and yellow background
  	| color      | type            |price 	  |
  	| Rose Beige | Left-Arm Facing|price 	  |
  When I press "down arrow" key 1 time(s)
  And I should see the default color "Brown"
  And I should see the default type "Left-Arm Facing"

  And I should see the following default selected product with red border and yellow background
  	| color      | type            |price 	  |
  	| Brown      | Left-Arm Facing|price 	  |
  And I should see the T keys with following states
  	|T key| Label				 |Active|
  	|T1	|Back To Search Results	 | No |
  	|T2	|Ratings & Reviews		 | Yes |
  	|T3	|Product Details & Views | Yes |
  	|T4	|Size/Color Options		 | No |
  	|T5	|Search again			 | Yes |
  	|T6	|View Larger Image		 | Yes |
  	|T7	|Check Availability		 | No |
  	|T8	|Exit Find Merchandise	 | Yes |
	Examples:
		|webId|
		|441068 |
		