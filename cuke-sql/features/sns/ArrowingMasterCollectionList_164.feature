Feature: Show Master Collection List

  As a Sales Associate,
	 	As a Sales Associate, I would like to the Master “live” PDP screen to include all member products that are part of the collection, 
	 	so that I can see all the products part of a collection.
  
  Acceptance Criteria: http://mingle/projects/oti/cards/163
  
Background: 
  # Given that I have following Twin size Master Product and its member webids in the MCOM database 
 	 # |Id|Name											  |WebId |Size|Image							|
  	 # |1 |Hotel Collection Bedding, Modern Block Collection|671091|Twin|MasterCollectionImage_671091.jpg	|
#   
    # |Id|Name						|WebId 	|Color					|Availability	|
    # |1|European Sham  				|671352 |Modern Block			|yes		 	|
    # |2|King Sham 					|671351 |Various Available		|yes		 	|
    # |3|Standard Sham				|671350 |Modern Block			|yes			|
    # |4|King Duvet Cover 			|671349 |Modern Block			|yes			|
    # |5|Queen Duvet Cover			|671348 |Modern Block			|yes			|
    # |6|Twin Duvet Cover				|671347 |Modern Block			|yes			|
    # |7|Decorative Pillow 18" Square |573825 |Platinum Shapes		|yes			|
    # |8|Decorative Pillow 10" X 20"	|573821	|Embroidered Platinum	|yes			|
    # |9|Twin Bedskirt				|573809 |White					|No				|
    # |10|Quilted European Sham 		|573693 |Quilted Platinum 		|No				|
    # |11|Quilted Standard Sham		|573691 |Quilted Platinum		|No				| 
    # |12|Twin Coverlet 				|573687 |Quilted Platinum		|No				|
#       
       
    
    Scenario: Shows the list of member products of the Master Collection

  Given I am on POS simulator page
  When I search for webId "671091"
  #Then I should see title "Find Merchandise - Select Size for Collection"
  Then I should see title "Find Merchandise - "
  When I press "ENTER"
  # ************** delete this ***** Then I am on the Master Collection Page
  # Then I should see the title "Find Merchandise - Collection List"
 	Then I should see title "Find Merchandise - "
  And I should see the following product 
  	 |Item							|Color					|
 	 |European Sh..  				|Modern Block			|	 
    # |King Sham 					|Various Available		|	
     # |Standard Sham					|Modern Block			|
     # |King Duvet Cover 			 	|Modern Block			|
     # |Queen Duvet Cover			 	|Modern Block			|
     # |Twin Duvet Cover			 	|Modern Block			|
     # |Decorative Pillow 18" Square  |Platinum Shapes		|
     # |Decorative Pillow 10" X 20"	|Embroidered Platinum	|
     # |Twin Bedskirt					|Check for availability	|
     # |Quilted European Sham 		|Check for availability	|
     # |Quilted Standard Sham			|Check for availability	| 
     # |Twin Coverlet 				|Check for availability	|	
#      
   # When I press the "up" arrow key
   # Then the selected product should be "European Sham"
   # When I press the "left" arrow key
   # Then the selected product should be "European Sham"
   # When I press the "right" arrow key
   # Then the selected product should be "European Sham"   
   # When I press the "down" arrow key "n" times
   # |n|
   # |3|
  # Then the selected product should be "King Duvet Cover"
  # When I press the "down" arrow key "n" times
  # |n|
  # |8|
  # Then I should see the selected product should be "Twin Coverlet"
  # When I press the "down" arrow key 
  # Then I should see the selected product should be "Twin Coverlet"
  # When I press "Enter"
  # Then I should be on the Product Details Size/Color Options page
  # And I should see the title of "Find Merchandise - Size/Color Options"
  # And I should see the product name "Hotel Collection Bedding, Deco Quilted Platinum Twin Coverlet"
#   
   # Scenario: Click on T4
#    
  # Given that I searched for the webId "671091"
  # When I am on the Master Size Collection page 
  # Then I should see the title "Find Merchandise - Select Size for Collection"
  # When I press "ENTER"
  # Then I am on the Master Collection Page
  # And I should see the title "Find Merchandise - Collection List"
  # When I press the "down" arrow key "n" times
  # |n|
  # |11|
  # Then I should see the selected product should be "Twin Coverlet"
  # When I press "T4 Size/Color Options"
  # Then I should be on the Product Details Size/Color Options page
  # And I should see the title of "Find Merchandise - Size/Color Options"
  # And I should see the product name "Hotel Collection Bedding, Deco Quilted Platinum Twin Coverlet"
#   
#   
#   
#   
#   
#   
#   
#   
#   