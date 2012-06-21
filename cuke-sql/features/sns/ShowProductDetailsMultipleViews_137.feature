Feature: Navigating different product views and swatches

  As a Sales Associate,
 	I would like to the default �live� standard / member PDP to have a screen for product details and views.
	so that I can see descriptive information and alternate images.

	Acceptance Criteria: http://mingle/projects/oti/cards/137

Assumption: The url below renders the screen, user clicking the T3 button on the POS terminal.
  
Background: 

@sns_03 
@automated
Scenario: Navigating to Product Views
  Given I am on POS simulator page
  When I search POS for "webId" "359150"
  Then I should see title "Find Merchandise - Size/Color Options"
  When I press "T3" "Product Details and Views"
  Then I should see title "Find Merchandise - Product Details & Views"
  	# And I should see image "536234_fpx" on the left side
  	And I should see image on the left side
  	And I should see the product name "Suzi Chin Dress, Chiffon Empire Waist"
  	And I should see the webId "359150" below product name
  	And I should see the instructional text "To see a product view, select it using the arrow keys."
  	And I should see title "Product Views:"
  	And I should see the following thumbnail images
	  	| thumbnail images  |
	  	| 536234_fpx.tif    |
	  	| 421441_fpx.tif    |  
  	And I should see title "Color Swatches:"
  	And I should see the following color swatch thumbnails and text
	  	| color swatch thumbnails  | text      | image name |
	  	| whiteThumbnail.jpg       | White     | 70171_fpx.tif |
	  	| chocolateThumbnail.jpg   | Chocolate | 347380_fpx.tif |
	  	| purpleThumbnail.jpg      | Purple    | 349051_fpx.tif |
	  	| redThumbnail.jpg         | Tomato    | 101248_fpx.tif |
	  	| redThumbnail.jpg         | Navy      | 345693_fpx.tif |
  
  	And I should see the navigation instructional text "F3 - Cancel transaction"
  	And I should see the navigation instructional text "ESC - Return to previous" 
  	And I should see a "red" border around the image "536234_fpx.tif" 
  	And I should see the long description "A chic party dress in gauzy silk chiffon, by Suzi Chin."
  	And I should see the product description
  		| product description |
  	 	| Silk; lining: polyester |
  	 	| Dry clean |
  	 	| Imported |
  	 	| Fit: form-fitting at bust; more relaxed below empire waist |
  	 	| Short puffed sleeves with banded cuffs |
  	 	| V-neckline; V-backline |
  	 	| Ruched at bust and upper back |
  	 	| Gathered band with knot detail at empire waist |
  	 	| Back zip closure |
  	 	| Full skirt; sheer overlay over opaque lining |
  	 	| Hits at knee; approximate length from center back neckline: 35 inches |
  	 	| Great for bridesmaid dresses |
   	And I should see the T keys with following states
  	|T key| Label				 |Active|
  	|T1	|Back To Search Results	 | No |
  	|T2	|Ratings & Reviews		 | Yes |
  	|T3	|Product Details & Views | No |
  	|T4	|Size/Color Options		 | Yes |
  	|T5	|Search again			 | Yes |
  	|T6	|View Larger Image		 | Yes |
  	|T7	|Check Availability		 | No |
  	|T8	|Exit Find Merchandise	 | Yes |
  
   
  
  
  
  
  