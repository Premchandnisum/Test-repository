
Given /^I am on "([^"]*)" catalog browse page$/ do |arg1| 
  visit('http://www1.mcomtest112.fds.com/')

  #click_link 'women'
  page.find(:xpath, "//img[@alt='women']").click
  wait_until_entity_exists("text", "Women", 10, "")

  click_link 'Dresses'
  wait_until_entity_exists("text", "Dresses", 10, "")
  sleep 3
  page.find(:xpath, "//img[@id='createPoll']").click
  page.find(:xpath, "//img[@id='goToPollButton']").click
  
end 

Given /^the polling widget is active$/ do 
   page.find(:xpath, "//div[@id='pollContent']")['class'] != 'hidden'
end 

Then /^I see the add to poll button under each product thumbnail$/ do 
  page.find(:xpath, "//div[@id='thumbnails']").find(:xpath, ".//img[@title='add to poll']").should_not == nil
end

When /^I click on add to poll button under the (\d+) browse grid thumbnail$/ do |number| 
  page.find(:xpath, "//div[@id='thumbnails']/div/div[#{number}]").find(:xpath, ".//img[@title='add to poll']").click
end 

Then /^The (\d+) slot in the polling widget is populated$/ do |number|
  page.has_xpath?("//div[@id='pollItems']/div/img[@id='pollItemImage1']").should == true
end 

Then /^The poll has (\d+) products$/ do |number| 
  no_more = (number.to_i + 1).to_s
  page.has_xpath?("//div[@id='pollItems']/div[#{no_more}]/img").should == false  
end 

Then /^The image displayed in the (\d+) slot of the polling widget should be the same image displayed on the (\d+) browse grid thumbnail$/ do 
|num1, num2|
    comp1 = page.find(:xpath, "//div[@id='thumbnails']/div/div[#{num1}]").find(:xpath, ".//img[@name='CATimage']")['src']
    comp2 = page.find(:xpath, "//div[@id='pollItems']/div/img[@id='pollItemImage1']")['src']
    comp1_str = comp1[0..(comp1.index('=') - 1)]
    comp2_str = comp2[0..(comp2.index('=') - 1)]
    comp1_str.should == comp2_str
end 
