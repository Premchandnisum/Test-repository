#Script Name        :  newcheckoutshipping
#Description        :  This class contains steps of shipping page functionality.
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
Then /^I am on checkout signin page$/ do
  @checkoutsignin_page_title = @config_data_file['checkout_signin_page_title']
  page_navigated = page.has_content? @checkoutsignin_page_title
  if (page_navigated)
    puts "Checkout sign in page is displayed :" + @checkoutsignin_page_title
  else
    puts "Checkout sign in page is NOT displayed"
  end
end

When /^I continue as a guest user$/ do
  @checkout_without_profile_btn = @config_data_file['checkout_without_profile_btn']
  wait_until_entity_exists("path","#{@checkout_without_profile_btn}" , 30, "")
  #page.find(:xpath, "#{@checkout_without_profile_btn}").click
  visit("#{@url}"+"/chkout/startcheckout")
end

Then /^I should see the Shipping page$/ do
  @shipping_continue_checkout_btn = @config_data_file['shipping_continue_checkout_btn']
  wait_until_entity_exists("path",@shipping_continue_checkout_btn , 30, "")
  @expectedshipping_page_title = @config_data_file['checkout_shipping_page_title']
  page_navigated = page.has_content? @expectedshipping_page_title
  if (page_navigated)
    puts "Expected Page is displayed i.e. : " + @expectedshipping_page_title
  else
    notExpectedTitle = @browser.title
    puts "Expected Page is not displayed : " + notExpectedTitle
  end
end

And /^I enter firstname "([^"]*)"$/ do |firstname|
  @firstname=firstname
  @shipping_first_name = @config_data_file['shipping_first_name']
  fill_in @shipping_first_name, :with => @firstname
end

And /^I enter lasttname "([^"]*)"$/ do |lastname|
  @lastname=lastname
  @shipping_last_name = @config_data_file['shipping_last_name']
  fill_in @shipping_last_name, :with => @lastname
end

And /^I enter addressline1 "([^"]*)"$/ do |addressline1|
  @addressline1=addressline1
  @shipping_address_1 = @config_data_file['shipping_address_1']
  fill_in @shipping_address_1, :with => @addressline1
end

And /^I enter addressline2 "([^"]*)"$/ do |addressline2|
  @addressline2=addressline2
  @shipping_address_2 = @config_data_file['shipping_address_2']
  fill_in @shipping_address_2, :with => @addressline2
end

And /^I enter city "([^"]*)"$/ do |city|
  @city=city
  @shipping_city = @config_data_file['shipping_city']
  fill_in @shipping_city, :with => @city
end

And /^I select state "([^"]*)"$/ do |state|
  @state=state
  @shipping_state = @config_data_file['shipping_state']
  @shipping_state_select = @config_data_file['shipping_state_select']
  select(@state, :from => @shipping_state_select)
  @statevalue = page.find(:xpath, "#{@shipping_state}").value
end

And /^I enter zipcode "([^"]*)"$/ do |zipcode|
  @zipcode=zipcode
  @shipping_zipcode = @config_data_file['shipping_zipcode']
  fill_in @shipping_zipcode, :with => @zipcode
end

And /^I enter phonenumberareacode "([^"]*)"$/ do |phonenumberareacode|
  @phonenumberareacode=phonenumberareacode
  @shipping_area_code = @config_data_file['shipping_area_code']
  fill_in @shipping_area_code, :with => @phonenumberareacode
end

And /^I enter phonenumberexchangeNbr "([^"]*)"$/ do |phonenumberexchangeNbr|
  @phonenumberexchangeNbr=phonenumberexchangeNbr
  @shipping_exchange_nbr = @config_data_file['shipping_exchange_nbr']
  fill_in @shipping_exchange_nbr, :with => @phonenumberexchangeNbr
end

And /^I enter phonenumbersubscriberNbr "([^"]*)"$/ do |phonenumbersubscriberNbr|
  @phonenumbersubscriberNbr=phonenumbersubscriberNbr
  @shipping_subscriber_nbr = @config_data_file['shipping_subscriber_nbr']
  fill_in @shipping_subscriber_nbr, :with => @phonenumbersubscriberNbr
end

When /^I continue checkout on shipping page$/ do
  @shipping_continue_checkout_btn = @config_data_file['shipping_continue_checkout_btn']
  wait_until_entity_exists("path","#{@shipping_continue_checkout_btn}" , 30, "")
  page.find(:xpath, "#{@shipping_continue_checkout_btn}").click
end

And /^I should see the gift option set to NO by default$/ do
  @gift_option_no = @config_data_file['gift_option_no']
  if(page.find(:xpath, "#{@gift_option_no}").selected?)
    puts "Gift option NO is selected by default in shipping page"
  else
    puts "Gift option NO is NOT selected by default in shipping page"
  end

end

When /^I click on shipping internationally link$/ do
  @shipping_international_shipping_link = @config_data_file['shipping_international_shipping_link']
  wait_until_entity_exists("path","#{@shipping_international_shipping_link}" , 30, "")
  page.find(:xpath, "#{@shipping_international_shipping_link}").click
end

Then /^I should see every day free shipping method is selected by default$/ do
  @shippingMethod = @config_data_file['shipping_shippingMethod']
  @everydayShippingMethod = @config_data_file['shipping_everydayShippingMethod']
  wait_until_entity_exists("path","#{@merchandise_total_in_shipping_page}" , 30, "")
  merchandiseTotalInShippingPage = page.find(:xpath, "#{@merchandise_total_in_shipping_page}").text
  shippingMethod = page.find(:xpath, "#{@shippingMethod}").text
  if (shippingMethod.index("Free"))
    if (page.find(:xpath, "#{@everydayShippingMethod}").selected?)
      puts "Everyday free shipping is selected by default and merchandise total is:" + merchandiseTotalInShippingPage
    else
      puts "Everyday free shipping is disabled"
    end
  else
    puts "Everyday free shipping is not available and merchandise total is:" + merchandiseTotalInShippingPage
  end
end

Then /^I should see standard shipping method is selected by default$/ do
  @shippingMethod = @config_data_file['shipping_shippingMethod']
  merchandiseTotalInShippingPage = page.find(:xpath, "#{@merchandise_total_in_shipping_page}").text
  shippingMethod = page.find(:xpath, "#{@shippingMethod}").text
  if (shippingMethod.index("Standard"))
    if (page.find(:xpath, "#{@shippingMethod}").selected?)
      puts "Standard shipping is selected by default and merchandise total is:" + merchandiseTotalInShippingPage
    else
      puts "Standard shipping is disabled"
    end
  else
    puts "Standard shipping is not available and merchandise total is:" + merchandiseTotalInShippingPage
  end
end

When /^I select gift option 'YES' in shipping page$/ do
  @gift_option_yes = @config_data_file['gift_option_yes']
  page.find(:xpath, "#{@gift_option_yes}").click
end

Then /^I should see all gift options$/ do
# Need to include if condition to check whether everything is displayed
  @gift_option_yes = @config_data_file['gift_option_yes']
  @gift_message_checkbox = @config_data_file['gift_message_checkbox']
  @gift_message_textfield = @config_data_file['gift_message_textfield']
  @gift_receipt = @config_data_file['gift_receipt']
  gift_from = page.find(:xpath, "#{@gift_option_yes}")
  gift_message_checkbox = page.find(:xpath, "#{@gift_message_checkbox}")
  gift_message_textfield = page.find(:xpath, "#{@gift_message_textfield}")
  gift_box = page.find(:xpath, "#{gift_box}")
  gift_receipt = page.find(:xpath, "#{@gift_receipt}")
end

Then /^I am on legacy shipping address page$/ do
  browser = Capybara.current_session
  curr_url = browser.current_url
  if (curr_url.index("checkoutswf/checkout-webflow"))
    puts "Legacy checkout is displayed"
  else
    puts "Legacy checkout is NOT displayed"
  end

end

Then /^I should see shipping address validation happens "([^"]*)"$/ do |errormessage|
  browser = Capybara.current_session
  curr_url = browser.current_url
  @shipping_page_url = @config_data_file['checkout_shipping_page_url']
  @payment_page_url = @config_data_file['checkout_payment_page_url']
  if (curr_url.index(@shipping_page_url))
    if(page.has_content?errormessage)
      puts "Shipping address is invalid"
    else
      puts "Failed to verify shipping address validation"
    end
  else if (curr_url.index(@payment_page_url))
      puts "Shipping address is valid"
    end
  end

end

And /^I should see the shipping page URL$/ do
  browser = Capybara.current_session
  curr_url = browser.current_url
  @shipping_page_url= @config_data_file['checkout_shipping_page_url']
  if (curr_url.index(@shipping_page_url))
    puts "Shipping page is displayed :" + curr_url
  else
    puts "Shipping page is NOT displayed :" + curr_url
  end

end

Then /^I should see gift wrap check box should be disabled$/ do
  @gift_box=@config_data_file['gift_box']
  if (!(page.find(:xpath, "#{@gift_box}").selected?))
    puts "Gift wrap is disabled"
  else
    puts "Gift wrap is NOT disabled"
  end
end

Then /^I should see gift message check box should be disabled$/ do
  @gift_message_checkbox = @config_data_file['gift_message_checkbox']
  if (!(page.find(:xpath, "#{@gift_message_checkbox}").selected?))
    puts "Gift message is disabled"
  else
    puts "Gift wrap is NOT disabled"
  end
end

And /^I enter invalid shipping details firstname "([^"]*)", lastname "([^"]*)",addresslineone "(.*?)", addresslinetwo "([^"]*)", city "([^"]*)", state "([^"]*)", zipcode "([^"]*)", phonenumberareacode "([^"]*)",phonenumberexchangeNbr "([^"]*)",phonenumbersubscriberNbr "([^"]*)", expectederrormessage"([^"]*)"$/ do |firstname, lastname, addresslineone, addresslinetwo, city, state, zipcode, phonenumberareacode, phonenumberexchangeNbr, phonenumbersubscriberNbr, expectederrormessage, table|

# read the shipping details data from table
  table.hashes.each do |attributes|
    firstname = attributes["firstname"]
    lastname = attributes["lastname"]
    addresslineone = attributes["addresslineone"]
    addresslinetwo = attributes["addresslinetwo"]
    city = attributes["city"]
    state = attributes["state"]
    zipcode = attributes["zipcode"]
    phonenumberareacode = attributes["phonenumberareacode"]
    phonenumberexchangeNbr = attributes["phonenumberexchangeNbr"]
    phonenumbersubscriberNbr = attributes["phonenumbersubscriberNbr"]
    expectederrormessage = attributes["expectederrormessage"]
    @shipping_first_name = @config_data_file['shipping_first_name']
    @shipping_last_name = @config_data_file['shipping_last_name']
    @shipping_address_1 = @config_data_file['shipping_address_1']
    @shipping_address_2 = @config_data_file['shipping_address_2']
    @shipping_city = @config_data_file['shipping_city']
    @shipping_state = @config_data_file['shipping_state']
    @shipping_state_select = @config_data_file['shipping_state_select']
    @shipping_zipcode = @config_data_file['shipping_zipcode']
    @shipping_area_code = @config_data_file['shipping_area_code']
    @shipping_exchange_nbr = @config_data_file['shipping_exchange_nbr']
    @shipping_subscriber_nbr = @config_data_file['shipping_subscriber_nbr']
    @shipping_continue_checkout_btn = @config_data_file['shipping_continue_checkout_btn']
    # assign the shipping details to respective fields and set the values to respective fields in shipping page
    fill_in @shipping_first_name, :with => firstname
    fill_in @shipping_last_name, :with => lastname
    fill_in @shipping_address_1, :with => addresslineone
    fill_in @shipping_address_2, :with => addresslinetwo
    fill_in @shipping_city, :with => city
    select(state, :from => @shipping_state_select)
    fill_in @shipping_zipcode, :with => zipcode
    fill_in @shipping_area_code, :with => phonenumberareacode
    fill_in @shipping_exchange_nbr, :with => phonenumberexchangeNbr
    fill_in @shipping_subscriber_nbr, :with => phonenumbersubscriberNbr
    page.find(:xpath, "#{@shipping_continue_checkout_btn}").click
    shippingErrormessage = page.has_content? expectederrormessage
    puts shippingErrormessage
    if(shippingErrormessage)
      puts "Expected shipping address error message is displayed"
    else
      puts "Expected Shipping address error message is NOT displayed"
    end
  end
end

And /^earlier entered details should be prepopulated in the fields$/ do
  puts "Previous Entered Shipping Details: " + @firstname + ", " + @lastname + ", " + @addressline1 + ", " + @addressline2 + ", " + @city + ", " + @state + ", " + @zipcode + ", " + @phonenumberareacode + ", " + @phonenumberexchangeNbr + ", " + @phonenumbersubscriberNbr
  @shipping_first_name_val = @config_data_file['shipping_first_name_val']
  @shipping_last_name_val = @config_data_file['shipping_last_name_val']
  @shipping_address_1_val = @config_data_file['shipping_address_1_val']
  @shipping_address_2_val = @config_data_file['shipping_address_2_val']
  @shipping_city_val = @config_data_file['shipping_city_val']
  @shipping_state_val = @config_data_file['shipping_state']
  @shipping_state_select_val = @config_data_file['shipping_state_select_val']
  @shipping_zipcode_val = @config_data_file['shipping_zipcode_val']
  @shipping_area_code_val = @config_data_file['shipping_area_code_val']
  @shipping_exchange_nbr_val = @config_data_file['shipping_exchange_nbr_val']
  @shipping_subscriber_nbr_val = @config_data_file['shipping_subscriber_nbr_val']
  @actualfirstname = page.find(:xpath, "#{@shipping_first_name_val}").value
  @actuallastname = page.find(:xpath, "#{@shipping_last_name_val}").value
  @actualaddressline1 = page.find(:xpath, "#{@shipping_address_1_val}").value
  @actualaddressline2 = page.find(:xpath, "#{@shipping_address_2_val}").value
  @actualcity = page.find(:xpath, "#{@shipping_city_val}").value
  @actualstate = page.find(:xpath, "#{@shipping_state_val}").value
  @actualzipcode = page.find(:xpath, "#{@shipping_zipcode_val}").value
  @actualareacode = page.find(:xpath, "#{@shipping_area_code_val}").value
  @actualexchangenbr = page.find(:xpath, "#{@shipping_exchange_nbr_val}").value
  @actualsubscribernbr = page.find(:xpath, "#{@shipping_subscriber_nbr_val}").value
  @expectedstate = page.has_select?(@shipping_state_val, :selected => @state)

  puts "Actual Shipping Details" + @actualfirstname + ", " + @actuallastname + ", " + @actualaddressline1 + ", " + @actualaddressline2 + ", " + @actualcity + ", " + @actualstate + ", " + @actualzipcode + ", " + @actualareacode + ", " + @actualexchangenbr + ", " + @actualsubscribernbr
  if ((@firstname == @actualfirstname) && (@lastname == @actuallastname) && (@addressline1 == @actualaddressline1) && (@addressline2 == @actualaddressline2) && (@city == @actualcity) && (@expectedstate) && (@zipcode == @actualzipcode) && (@phonenumberareacode == @actualareacode) && (@phonenumberexchangeNbr == @actualexchangenbr) && (@phonenumbersubscriberNbr == @actualsubscribernbr))
    puts "Previously entered details are populated correctly"
  else
    puts "Previously entered details are not populated correctly"
  end
end

Then /^I should see shipping state restriction error message in shipping page "([^"]*)"$/ do |errormessage|
  browser = Capybara.current_session
  curr_url = browser.current_url
  @shipping_page_url = @config_data_file['checkout_shipping_page_url']
  @payment_page_url = @config_data_file['checkout_payment_page_url']
  if (curr_url.index(@shipping_page_url))
    if(page.has_content? errormessage)
      puts "Shipping state restriction error message is displayed as expected"
    else
      puts "Shipping state restriction error message is not displayed as expected"
    end
  else if (curr_url.index(@payment_page_url))
      puts "Shipping state restriction is not validated"
    end
  end
end

Then /^I should see limited quantity availability error message in shipping page "([^"]*)"$/ do |errormessage|
  browser = Capybara.current_session
  curr_url = browser.current_url
  @shipping_page_url = @config_data_file['checkout_shipping_page_url']
  @payment_page_url = @config_data_file['checkout_payment_page_url']
  if (curr_url.index(@shipping_page_url))
    if(page.has_content? errormessage)
      puts "Limited quantity availability error message is displayed as expected"
    else
      puts "Limited quantity availability error message is not displayed as expected"
    end
  else if (curr_url.index(@payment_page_url))
      puts "Limited quantity availability is not validated"
    end
  end
end

And /^I should see disabled premium and express shipping methods$/ do
  @shipping_disabled_premium_shipping_method = @config_data_file['shipping_disabled_premium_shipping_method']
  @shipping_disabled_express_shipping_method = @config_data_file['shipping_disabled_express_shipping_method']
  if ((page.has_xpath? @shipping_disabled_premium_shipping_method) & (page.has_xpath? @shipping_disabled_express_shipping_method))
    puts "Premium and Express shipping methods are disabled."
  else
    puts "Premium and Express shipping methods are not disabled."
  end
end

And /^I should see the ship method based on the order total$/ do
  @shippingMethod = @config_data_file['shipping_shippingMethod']
  @shipping_merchandise_total_in_shipping_page = page.find(:xpath, "#{@merchandise_total_in_shipping_page}").text
  puts "Merchandise total in shipping page is: " + @shipping_merchandise_total_in_shipping_page
  @ordertotalsplit = @shipping_merchandise_total_in_shipping_page.split("$")
  @ordertotal = @ordertotalsplit[1]
  @shippingMethod = page.find(:xpath, "#{@shippingMethod}").text
  if (@ordertotal.to_i > 99.00)
    if (@shippingMethod == "Everyday Free Shipping")
      puts "Everyday free shipping method is displayed as expected"
    else
      puts "Everyday free shipping method is not displayed as expected"
    end
  elsif (@ordertotal.to_i < 99.00)
    if (@shippingMethod == "Standard Delivery")
      puts "Standard Delivery shipping method is displayed as expected"
    else
      puts "Standard Delivery shipping method is not displayed as expected"
    end
  else
    puts "Default shipping method is not displayed"
  end
end

When /^I enter shipping details$/ do
  @new_shipping_firstname = @config_data_file['new_shipping_firstname']
  @new_shipping_lastname = @config_data_file['new_shipping_lastname']
  @new_shipping_address1 = @config_data_file['new_shipping_address1']
  @new_shipping_city = @config_data_file['new_shipping_city']
  @new_shipping_state = @config_data_file['new_shipping_state']
  @new_shipping_zip_code = @config_data_file['new_shipping_zip_code']
  @new_shipping_area_code = @config_data_file['new_shipping_area_code']
  @new_shipping_exchange_code = @config_data_file['new_shipping_exchange_code']
  @new_shipping_subscriber_code = @config_data_file['new_shipping_subscriber_code']
  @shipping_first_name = @config_data_file['shipping_first_name']
  @shipping_last_name = @config_data_file['shipping_last_name']
  @shipping_address_1 = @config_data_file['shipping_address_1']
  @shipping_address_2 = @config_data_file['shipping_address_2']
  @shipping_city = @config_data_file['shipping_city']
  @shipping_state = @config_data_file['shipping_state']
  @shipping_state_select = @config_data_file['shipping_state_select']
  @shipping_zipcode = @config_data_file['shipping_zipcode']
  @shipping_area_code = @config_data_file['shipping_area_code']
  @shipping_exchange_nbr = @config_data_file['shipping_exchange_nbr']
  @shipping_subscriber_nbr = @config_data_file['shipping_subscriber_nbr']
  
  fill_in @shipping_first_name, :with => @new_shipping_firstname
  fill_in @shipping_last_name, :with => @new_shipping_lastname
  fill_in @shipping_address_1, :with => @new_shipping_address1
  fill_in @shipping_city, :with => @new_shipping_city
  select(@new_shipping_state, :from => @shipping_state_select)
  fill_in @shipping_zipcode, :with => @new_shipping_zip_code
  fill_in @shipping_area_code, :with => @new_shipping_area_code
  fill_in @shipping_exchange_nbr, :with => @new_shipping_exchange_code
  fill_in @shipping_subscriber_nbr, :with => @new_shipping_subscriber_code
end

When /^I edit shipping address$/ do
  @edit_shipping_firstname = @config_data_file['enter_shipping_firstname']
  @edit_shipping_lastname = @config_data_file['edit_shipping_lastname']
  @edit_shipping_address1 = @config_data_file['edit_shipping_address1']
  @edit_shipping_city = @config_data_file['edit_shipping_city']
  @edit_shipping_state = @config_data_file['edit_shipping_state']
  @edit_shipping_zip_code = @config_data_file['edit_shipping_zip_code']
  @edit_shipping_area_code = @config_data_file['edit_shipping_area_code']
  @edit_shipping_exchange_code = @config_data_file['edit_shipping_exchange_code']
  @edit_shipping_subscriber_code = @config_data_file['edit_shipping_subscriber_code']
  fill_in @shipping_first_name, :with => @edit_shipping_firstname
  fill_in @shipping_last_name, :with => @edit_shipping_lastname
  fill_in @shipping_address_1, :with => @edit_shipping_address1
  fill_in @shipping_city, :with => @edit_shipping_city
  select(@edit_shipping_state, :from => @shipping_state_select)
  fill_in @shipping_zipcode, :with => @edit_shipping_zip_code
  fill_in @shipping_area_code, :with => @edit_shipping_area_code
  fill_in @shipping_exchange_nbr, :with => @edit_shipping_exchange_code
  fill_in @shipping_subscriber_nbr, :with => @edit_shipping_subscriber_code
end

Then /^I should see the product unavailability error message "([^"]*)"$/ do |expectedErrorMessage|
  actualErrorMessage = page.find(:xpath, "#{@shipping_error_message}").text()
  if(actualErrorMessage==expectedErrorMessage)
    puts "Product unavailability error message is displayed"
  else
    puts "Product unavailability error message is NOT displayed"
  end
end

And /^I should see the remove button beside the item$/ do
  @mini_bag_remove_button=@config_data_file['mini_bag_remove_button']
  wait_until_entity_exists("path","#{@mini_bag_remove_button}" , 30, "")
  puts "Remove button is displayed beside the item in mini bag"

end

When /^I click on remove button beside the item$/ do
  @mini_bag_remove_button=@config_data_file['mini_bag_remove_button']
  wait_until_entity_exists("path","#{@mini_bag_remove_button}" , 30, "")
  page.find(:xpath, "#{@mini_bag_remove_button}").click
end

And /^I should see the shopping bag empty message "([^"]*)"$/ do |expectedErrorMessage|
  @shopping_bag_page_empty_error_msg=@config_data_file['shopping_bag_page_empty_error_msg']
  actualErrorMessage = page.find(:xpath, "#{@shopping_bag_page_empty_error_msg}").text()
  if(actualErrorMessage==expectedErrorMessage)
    puts "Empty shopping bag is displayed"
  else
    puts "Empty shopping bag is NOT displayed"
  end
end