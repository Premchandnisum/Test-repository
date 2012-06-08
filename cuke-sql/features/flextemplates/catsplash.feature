Feature: Enable Tracking on Old Cat Splash
As a Product Manager, 
I want to be able to track category splash pages 
So that I can have a baseline of data before we redesign the Cat Splash template 
To improve their effectiveness.

@pilot1
Scenario Outline: Should track all links in the content area
	Given when I am on the site mode category splash page with id "<categoryId>" and channel "<channel>"
	When I click on any link within the coordinates "<coordinates>" and ad region "<adRegion>" with media type
	Then append cm_sp to the href value on the link with the format of "<sitePromotion>"
	And it is not an error page
	
	Examples: 
	|categoryId|channel |adRegion|coordinates  |sitePromotion|
	|1         |site    |mainAdPoolFullWide  |0,0,100,100  |cm_sp=us_oldcatsplash_mens-_-MAINAD-_-This-is-alt-image-text_This-is-region-text|
	# |1         |site    |MAINAD  |100,0,200,100|cm_sp=us_oldcatsplash_mens-_-MAINAD-_-This-is-the-women's-dress_For-women-in-the-west|
	# |7495       |site    |MAINAD  |100,0,200,100|cm_sp=us_oldcatsplash_womens-_-MAINAD-_-This-is-the-women's-dress_For-women-in-the-west|
	# |7495       |registry|MAINAD  |             |cm_sp=reg_oldcatsplash_womens-_-MAINAD-_-This-is-the-women's-dress_For-women-in-the-west| 

