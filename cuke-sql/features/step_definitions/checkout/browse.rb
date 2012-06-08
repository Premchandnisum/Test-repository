#Script Name        :  browse
#Description        :  This class contains all the navigation related steps i.e. home page to Shopping bag page functionality.
#Author             :  NISUM Technologies
#Reviewer           :  Ravi Gummala
#Creation Date      :  05/18/2012
#Pre-conditions     :  Base environment, access to the Software Request System.
#Post-conditions:   :  Regression of the Software Request System based on functionality.
#Data Files         :  None at this level.
#******************************************************************************************************
# Revision History
#******************************************************************************************************
#Date               :
#Revised By         :
#******************************************************************************************************
Then /^I navigate to product detail page with product id "([^"]*)"$/ do |prodid|
  @pdp_sub_url= @config_data_file['pdp_sub_url']
  visit("#{@url}"+"#{@pdp_sub_url}"+"#{prodid}")
end

Then /^I navigate to VGC "(.*?)","(.*?)","(.*?)"$/ do |prodid,enterAmount,recipientsEmail|
  @pdp_sub_url= @config_data_file['pdp_sub_url']
  visit("#{@url}"+"#{@pdp_sub_url}"+"#{prodid}")
  @amount = @config_data_file['amount']
  @email = @config_data_file['email']
  fill_in @amount, :with => "#{enterAmount}"
  fill_in @email, :with => "#{recipientsEmail}"
end

Then /^I navigate to product detail page with common product id "([^"]*)"$/ do |prodid,table|
  @pdp_sub_url= @config_data_file['pdp_sub_url']
  table.hashes.each do |attributes|
    prodid = attributes["prodid"]
  end
  visit("#{@url}"+"#{@pdp_sub_url}"+"#{prodid}")
end

When /^I add items on bag$/ do
  @pdp_add_to_bag_btn = @config_data_file['pdp_add_to_bag_btn']
  wait_until_entity_exists("path",@pdp_add_to_bag_btn , 60, "")
  page.find(:xpath, @pdp_add_to_bag_btn).click
  @pdp_atb_continue_checkout_btn = @config_data_file['pdp_atb_continue_checkout_btn']
  wait_until_entity_exists("path",@pdp_atb_continue_checkout_btn , 70, "")
  page.find(:xpath, @pdp_atb_continue_checkout_btn).click
end

Then /^I am on the your shopping bag page$/ do
  browser = Capybara.current_session
  curr_url = browser.current_url
  @shopping_bag_page_url = @config_data_file['shopping_bag_page_url']
  @shopping_bag_page_continue_checkout_btn = @config_data_file['shopping_bag_page_continue_checkout_btn']
  wait_until_entity_exists("path",@shopping_bag_page_continue_checkout_btn, 30, "")
  if (curr_url.index(@shopping_bag_page_url))
    puts "Shopping bag page is displayed :" + curr_url
  else
    puts "Shopping bag page is NOT displayed :" + curr_url
  end
end

When /^I continue checkout on your shopping bag page$/ do
  @shopping_bag_page_continue_checkout_btn = @config_data_file['shopping_bag_page_continue_checkout_btn']
  wait_until_entity_exists("path",@shopping_bag_page_continue_checkout_btn , 30, "")
  page.find(:xpath, @shopping_bag_page_continue_checkout_btn).click
end

Then /^I navigate to product (?:detail|details|PDP) page$/ do
  @pdp_update_btn = @config_data_file['pdp_update_btn']
  wait_until_entity_exists("path",@pdp_update_btn , 30, "")
end

Then /^I should see shopping bag is empty with error message "([^"]*)"$/ do |expectedErrorMessage|
  @shopping_bag_page_empty_error_msg = @config_data_file['shopping_bag_page_empty_error_msg']
  actualErrorMessage = page.find(:xpath, @shopping_bag_page_empty_error_msg).text()
  puts actualErrorMessage
  if(actualErrorMessage==expectedErrorMessage)
    puts "Empty shopping bag is displayed after placing the order"
  else
    puts "Empty shopping bag is NOT displayed after placing the order"
  end
end

Then /^I should see the attributes selected by the user are populated on PDP page$/ do
  pending # express the regexp above with the code you wish you had
end 