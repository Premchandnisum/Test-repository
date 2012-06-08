def nav_menu(menu)
  navmenu = menu.gsub(/\s+/, "")
  navmenu.gsub(/&/,"")
  return navmenu
end


Given /^I select "([^"]*)" from the navigation menu$/ do |menu_choice|
  menu = nav_menu(menu_choice)
  selection = @navigation_file['navigation']["#{menu}"]
  click_link selection
end

When /^I select the category "([^"]*)"$/ do |category|
  click_link category
end

Then /^I should see "([^"]*)" as the current category$/ do |category|
  #page.locate("//*[@id='nav_title'").find("#{category}")
  find(:id, "nav_title").text.should == category.downcase!
end

When /^I select the "([^"]*)" product$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^I select quick view from the "([^"]*)" product$/ do |arg1|
  visit("http://www1.macys.com/catalog/product/quickview/?id=614000")
end

Then /^I should see the quick view overlay$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I select "([^"]*)" from the size pulldown$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end


Then /^I should see the "([^"]*)" shipping availability message$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^I click "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I see "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I am on the shopping bag page as a "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^my item\(s\) are in the shopping bag$/ do
  pending # Based on an array that keeps WebID, Qty, and Price
  #  for i = 0, i < length of bag array, i++ 
  #  Webid = array[i][0]
  #  QTY = array[i][1]
  #  Price = array[i][2]
  #   steps %Q{
  #  Then I should see correct "WEBID"
  #  Then I should see the correct "QTY"
  #  Then I should see the correct "PRICE"
end

Then /^my merchandise total is correct$/ do
  pending # express the regexp above with the code you wish you had
  #Get total from step_def Then my items are in the shopping bag, check to make sure not null
  #Subtract total from promotion saving
end