Feature: Arrowing Larger Image views
   As a Sales Associate, I would like to be able to select different thumbnails,
  so that I can see the larger image switch to a larger view of that thumbnail.

  Acceptance Criteria: http://mingle/projects/oti/cards/155
  
Background: 
@wip
Scenario: User Arrows through Product Views
  Given I am on POS simulator page
  When I search POS for "webId" "359150"
  Then I should see title "Find Merchandise - Size/Color Options"
  When I press "T6" "View Larger Image"
  Then I should see title "Find Merchandise - View Larger"
  #And I should see image "defaultLarge.jpg" in the middle of the page, with a width of approximately 40% of the screen.
  And I should see image in the middle of the page
  And I should see the product name "Suzi Chin Dress, Chiffon Empire Waist"
  And I should see the webId "359150" below product name
  And I should see title "Product Views:"
  
  And I should see the following product images
	  | thumbnail images  |
	  | image1    |
	  | image2    |  
  And I should see the navigation instructional text "F3 - Cancel transaction"
  And I should see the navigation instructional text "ESC - Return to previous" 
  #And I should see a red border around the first image

  # When I click on "up" arrow key
  # Then I should see the image "redthumbnail.jpg" selected with "red" border
  # And I should see image "defaultLarge.jpg" on the right
  # When I click on "left" arrow key
  # Then I should see the image "redthumbnail.jpg" selected with "red" border
  # And I should see image "defaultLarge.jpg" on the right
  # When I click on "right" arrow key
  # Then I should see the image "whitethumbnail.jpg" selected with "red" border
  # And I should see image "whiteLargeProductView.jpg" on the right
  # When I click on "down" arrow key
  # Then I should see the image "whiteThumbnail.jpg" selected with "red" border
  # And I should see image "whiteLargeProductView.jpg" on the right
  # When I click on "right" arrow key 
  # Then I should see the image "ChocolateThumbnail.jpg" selected with "Red" border
  # And I should see image "DefaultLarge.jpg" on the right with "ChocolateThumbnail.jpg" visible superimposed on top of "DefaultLarge.jpg"
  # When I click on "right" arrow key
  # Then I should see the image "purpleThumbnail.jpg" selected with "red" border
  # And I should see image "purpleLargeProductView.jpg" on the right
  # When I click on "down" arrow key
  # Then I should see the image "purpleThumbnail.jpg" selected with "red" border
  # And I should see image "purpleLargeProductView.jpg" on the right
  # When I click on "up" arrow key
 # Then I should see the image "purpleThumbnail.jpg" selected with "red" border
  # And I should see image "purpleLargeProductView.jpg" on the right
    # When I click on "right" arrow key
 # Then I should see the image "purpleThumbnail.jpg" selected with "red" border
  # And I should see image "purpleLargeProductView.jpg" on the right
    # When I click on "left" arrow key
  # Then I should see the image "ChocolateThumbnail.jpg" selected with "Red" border
  # And I should see image "DefaultLarge.jpg" on the right with "ChocolateThumbnail.jpg" visible superimposed on top of "DefaultLarge.jpg"
   	# And I should see the T keys with following states
  	# |T key| Label				 |Active|
  	# |T1	|Back To Search Results	 | Yes |
  	# |T2	|Ratings & Reviews		 | No |
  	# |T3	|Product Details & Views | Yes |
  	# |T4	|Size/Color Options		 | Yes |
  	# |T5	|Search again			 | Yes |
  	# |T6	|View Larger Image		 | No |
  	# |T7	|Check Availability		 | No |
  	# |T8	|Exit Find Merchandise	 | Yes |
  