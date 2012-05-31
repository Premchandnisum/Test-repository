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
  checkoutsignin_page_title = @config_data_file['checkout_signin_page_title']
  page_navigated = page.has_content? checkoutsignin_page_title
  if (page_navigated)
    puts "Checkout sign in page is displayed :" + checkoutsignin_page_title
  else
    puts "Checkout sign in page is NOT displayed"
  end
  puts "\n"
end

When /^I continue as a guest user$/ do
  @checkout_without_profile_btn = @config_data_file['checkout_without_profile_btn']
  wait_until { page.find(:xpath, "#{@checkout_without_profile_btn}").visible? }
  #page.find(:xpath, "#{@checkout_without_profile_btn}").click
  visit("#{@url}"+"/chkout/startcheckout")
  visit("#{@url}"+"/chkout/startcheckout")
end

Then /^I should see the Shipping page$/ do
  expectedshipping_page_title = @config_data_file['checkout_shipping_page_title']
  page_navigated = page.has_content? expectedshipping_page_title
  if (page_navigated)
    puts "Expected Page is displayed i.e. : " + expectedshipping_page_title
    puts "\n"
  else
    notExpectedTitle = @browser.title
    puts "Expected Page is not displayed : " + notExpectedTitle
  end
  @merchandise_total_in_shipping_page = @config_data_file['merchandise_total_in_shipping_page']
  @shippingMethod = @config_data_file['shipping_shippingMethod']
  @everydayShippingMethod = @config_data_file['shipping_everydayShippingMethod']
  @gift_option_yes = @config_data_file['gift_option_yes']
  @gift_message_checkbox = @config_data_file['gift_message_checkbox']
  @gift_message_textfield = @config_data_file['gift_message_textfield']
  @gift_receipt = @config_data_file['gift_receipt']
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
  @shipping_international_shipping_link = @config_data_file['shipping_international_shipping_link']
  @gift_option_no = @config_data_file['gift_option_no']
  @shipping_page_url = @config_data_file['checkout_shipping_page_url']
  @shippingFirstNameValidationMessage=@config_data_file['shippingFirstNameValidationMessage']
  @payment_page_url = @config_data_file['checkout_payment_page_url']
end

And /^I enter firstname "([^"]*)"$/ do |firstname|
  @firstname=firstname
  puts @firstname
  fill_in @shipping_first_name, :with => @firstname
end

And /^I enter lasttname "([^"]*)"$/ do |lastname|
  @lastname=lastname
  fill_in @shipping_last_name, :with => @lastname
end

And /^I enter addressline1 "([^"]*)"$/ do |addressline1|
  @addressline1=addressline1
  fill_in @shipping_address_1, :with => @addressline1
end

And /^I enter addressline2 "([^"]*)"$/ do |addressline2|
  @addressline2=addressline2
  fill_in @shipping_address_2, :with => @addressline2
end

And /^I enter city "([^"]*)"$/ do |city|
  @city=city
  fill_in @shipping_city, :with => @city
end

And /^I select state "([^"]*)"$/ do |state|
  @state=state
  select(@state, :from => @shipping_state_select)
  @statevalue = page.find(:xpath, "#{@shipping_state}").value
end

And /^I enter zipcode "([^"]*)"$/ do |zipcode|
  @zipcode=zipcode
  fill_in @shipping_zipcode, :with => @zipcode
end

And /^I enter phonenumberareacode "([^"]*)"$/ do |phonenumberareacode|
  @phonenumberareacode=phonenumberareacode
  fill_in @shipping_area_code, :with => @phonenumberareacode
end

And /^I enter phonenumberexchangeNbr "([^"]*)"$/ do |phonenumberexchangeNbr|
  @phonenumberexchangeNbr=phonenumberexchangeNbr
  fill_in @shipping_exchange_nbr, :with => @phonenumberexchangeNbr
end

And /^I enter phonenumbersubscriberNbr "([^"]*)"$/ do |phonenumbersubscriberNbr|
  @phonenumbersubscriberNbr=phonenumbersubscriberNbr
  fill_in @shipping_subscriber_nbr, :with => @phonenumbersubscriberNbr
end

When /^I continue checkout on shipping page$/ do
  wait_until { page.find(:xpath, "#{@shipping_continue_checkout_btn}").visible? }
  page.find(:xpath, "#{@shipping_continue_checkout_btn}").click
end

And /^I should see the gift option set to NO by default$/ do
  if(page.find(:xpath, "#{@gift_option_no}").selected?)
    puts "Gift option NO is selected by default in shipping page"
  else
    puts "Gift option NO is NOT selected by default in shipping page"
  end
  puts "\n"
end

When /^I click on shipping internationally link$/ do
  page.find(:xpath, @shipping_international_shipping_link).click
end

Then /^I should see every day free shipping method is selected by default$/ do
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
  page.find(:xpath, "#{@gift_option_yes}").click
end

Then /^I should see all gift options$/ do
# Need to include if condition to check whether everything is displayed
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
  puts "\n"
end

Then /^I should see shipping address validation happens "([^"]*)"$/ do |errormessage|
  browser = Capybara.current_session
  curr_url = browser.current_url
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
  puts "\n"
end

And /^I should see the shipping page URL$/ do
  browser = Capybara.current_session
  curr_url = browser.current_url
  if (curr_url.index(@shipping_page_url))
    puts "Shipping page is displayed :" + curr_url
  else
    puts "Shipping page is NOT displayed :" + curr_url
  end
  puts "\n"
end

Then /^I should see gift wrap check box should be disabled$/ do
  if (!(page.find(:xpath, "#{@gift_box}").selected?))
    puts "Gift wrap is disabled"
  else
    puts "Gift wrap is NOT disabled"
  end
end

Then /^I should see gift message check box should be disabled$/ do
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
      puts "************************************************************"
      puts "Expected shipping address error message is displayed"
      puts "pass"
    else
      puts "************************************************************"
      puts "Expected Shipping address error message is NOT displayed"
      puts "fail"
    end
  end
end
