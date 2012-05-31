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

Given /^I am on the Macy's home page$/ do

#  Load Configuration File
  navigation_file = "config/#{ENV['ENVIRONMENT']}/environmentconfig.yml"
  config_data_file = "config/data/qa/newcheckoutconfig.yml"
  @config_data_file = YAML::load(File.open(config_data_file))

  #  Loaded file will be available throughout the execution of a scenario
  @navigation_file = YAML::load(File.open(navigation_file))
  @pdp_add_to_bag_btn = @config_data_file['pdp_add_to_bag_btn']
  @pdp_atb_continue_checkout_btn = @config_data_file['pdp_atb_continue_checkout_btn']
  @shopping_bag_page_url = @config_data_file['shopping_bag_page_url']
  @shopping_bag_page_continue_checkout_btn = @config_data_file['shopping_bag_page_continue_checkout_btn']
  @shopping_bag_page_continue_checkout_btn = @config_data_file['shopping_bag_page_continue_checkout_btn']
  @shopping_bag_page_empty_error_msg = @config_data_file['shopping_bag_page_empty_error_msg']
  @pdp_update_btn = @config_data_file['pdp_update_btn']
  @order_total_in_shopping_bag = @config_data_file['shopping_bag_order_total_in_shopping_bag']
  @order_total_currency_in_shopping_bag = @config_data_file['shopping_bag_order_total_currency_in_shopping_bag']
  @order_total_in_mini_bag_on_shipping_page = @config_data_file['mini_bag_order_total_in_mini_bag_on_shipping_page']
  @merchandise_total_in_shipping_page = @config_data_file['shipping_merchandise_total_in_shipping_page']
  @flat_tax_in_shipping_page = @config_data_file['shipping_flat_tax_in_shipping_page']
  @bag_id_in_shopping_bag = @config_data_file['shopping_bag_bag_id_in_shopping_bag']
  @bag_id_in_checkout_mini_bag = @config_data_file['mini_bag_bag_id_in_checkout_mini_bag']
  @item_count_in_shopping_bag = @config_data_file['shopping_bag_item_count_in_shopping_bag']
  @item_count_in_mini_bag = @config_data_file['mini_bag_item_count']
  @mini_bag_shopping_bag_icon = @config_data_file['mini_bag_shopping_bag_icon']
  @international_home_page = @config_data_file['international_home_page']
  @promo_code = @config_data_file['mini_bag_promo_code']
  @apply_promo_code = @config_data_file['mini_bag_apply_promo_code']
  @remove_promo_code = @config_data_file['mini_bag_remove_promo_code']
  @macys_logo = @config_data_file['macys_logo']
  @footer_shopwithconfidence_eassyretuns = @config_data_file['footer_shopwithconfidence_eassyretuns']
  @footer_shopwithconfidence_secureshopping = @config_data_file['footer_shopwithconfidence_secureshopping']
  @footer_shopwithconfidence_privacypolicy = @config_data_file['footer_shopwithconfidence_privacypolicy']
  @footer_shopwithconfidence_shippingpolicy = @config_data_file['footer_shopwithconfidence_shippingpolicy']
  @header_chat = @config_data_file['header_chat']
  @header_clicktocall = @config_data_file['header_clicktocall']
  @shipping_surcharge_amount = @config_data_file['mini_bga_shipping_surcharge_amount']
  @mini_bag_personalized_fee_amount = @config_data_file['mini_bag_personalized_fee_amount']
  @mini_bag_sales_tax_amount = @config_data_file['mini_bag_sales_tax_amount']
  @mini_bag_promotion_description = @config_data_file['mini_bag_promotion_description']
  @mini_bag_promotion_price = @config_data_file['mini_bag_promotion_price']
  
  @browser = Capybara.current_session.driver.browser
  @browser.manage.delete_all_cookies
  #  Grab Variables From File
  @url = @navigation_file['url']
  visit("#{@url}")
end


Then /^I navigate to product detail page with product id "([^"]*)"$/ do |prodid|
  visit("#{@url}"+"/shop/product/lenox-dinnerware-federal-platinum-collection?ID="+"#{prodid}")
end

Then /^I navigate to VGC "(.*?)","(.*?)","(.*?)"$/ do |prodid,enterAmount,recipientsEmail|
  visit("#{@url}"+"/shop/product/new-birthday-e-gift-card?ID="+"#{prodid}")
  @amount = @config_data_file['amount']
  @email = @config_data_file['email']
  fill_in @amount, :with => "#{enterAmount}"
  fill_in @email, :with => "#{recipientsEmail}"
end

Then /^I navigate to product detail page with product id withbackground "([^"]*)"$/ do |prodid,table|
  table.hashes.each do |attributes|
   prodid = attributes["prodid"]
  end
  visit("#{@url}"+"/shop/product/lenox-dinnerware-federal-platinum-collection?ID="+"#{prodid}")
end

When /^I add items on bag$/ do
  wait_until { page.find(:xpath, @pdp_add_to_bag_btn).visible? }
  page.find(:xpath, @pdp_add_to_bag_btn).click
  wait_until { page.find(:xpath, @pdp_atb_continue_checkout_btn).visible? }
  page.find(:xpath, @pdp_atb_continue_checkout_btn).click
end

Then /^I am on the your shopping bag page$/ do
  browser = Capybara.current_session
  curr_url = browser.current_url
  wait_until { page.find(:xpath, @shopping_bag_page_continue_checkout_btn).visible? }
  if (curr_url.index(@shopping_bag_page_url))
    puts "Shopping bag page is displayed :" + curr_url
  else
    puts "Shopping bag page is NOT displayed :" + curr_url
  end
  puts "\n"
end

When /^I continue checkout on your shopping bag page$/ do
  wait_until { page.find(:xpath, @shopping_bag_page_continue_checkout_btn).visible? }
  page.find(:xpath, @shopping_bag_page_continue_checkout_btn).click
end

Then /^I navigate to product (?:detail|details|PDP) page$/ do
  wait_until { page.find(:xpath, "#{@pdp_update_btn}").visible? }
end

Then /^I should see shopping bag is empty with error message "([^"]*)"$/ do |expectedErrorMessage|
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