#Script Name        :  newcheckoutorderconfirmation
#Description        :  This class contains steps of order confirmation page functionality.
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
Then /^I should see the order confirmation page$/ do
  @checkout_orderconfirmation_page_title = @config_data_file['checkout_orderconfirmation_page_title']
  page_navigated = page.has_content? @checkout_orderconfirmation_page_title
  if (page_navigated)
    puts "Expected Page is displayed i.e. : " + @checkout_orderconfirmation_page_title
  else
    notExpectedTitle=@browser.title
    puts "Expected Page is not displayed : " + notExpectedTitle
  end
end

When /^I navigate to shopping bag page$/ do
  @shopping_bag_page_url=@config_data_file['shopping_bag_page_url']
  visit(@url + "/" + @shopping_bag_page_url)
end

Then /^I should see profile email address$/ do
  @order_confirmation_profile_email = @config_data_file['order_confirmation_profile_email']
  puts "Profile email address entered on payment page: " + @billing_create_profile_emailaddress
  wait_until_entity_exists("path","#{@order_confirmation_profile_email}" , 30, "")
  @orderconfrimationprofileemail = page.find(:xpath, "#{@order_confirmation_profile_email}").text  
  puts "Profile email address on order confirmation page: " + @orderconfrimationprofileemail
  if (@billing_create_profile_emailaddress == @orderconfrimationprofileemail)
    puts "Profile email address is displaying as expected on order confirmation page"
  else
    puts "Profile email address is not displaying as expected on order confirmation page"
  end
end

Then /^I should see shipping address details$/ do
  @order_confirmation_profile_shipping_address = @config_data_file['order_confirmation_profile_shipping_address']
  @previousenteredshippingaddress = @firstname + " " + @lastname + "\n" + @addressline1 + "\n" + @addressline2 + "\n" + @city + ", " + @statevalue + " " + @zipcode
  puts "Shipping address entered on shipping page: " + @previousenteredshippingaddress
  wait_until_entity_exists("path","#{@order_confirmation_profile_shipping_address}" , 30, "")
  @orderconfrimationprofileshippingaddress = page.find(:xpath, "#{@order_confirmation_profile_shipping_address}").text
  puts "Shipping address on Order confirmation page: " + @orderconfrimationprofileshippingaddress
  if (@previousenteredshippingaddress == @orderconfrimationprofileshippingaddress)
    puts "Shipping address is displaying as expected on order confirmation page"
  else
    puts "Shipping address is not displaying as expected on order confirmation page"
  end
end

Then /^I should see the order confirmation page URL$/ do
  browser = Capybara.current_session
  curr_url = browser.current_url
  @checkout_order_confirm_page_url = @config_data_file['checkout_order_confirm_page_url']
  if (curr_url.index(@checkout_order_confirm_page_url))
    puts "Confirmation page URL is displayed as expected"
  else
    puts "Confirmation page URL is not displayed as expected"
  end
end

And /^I should see the order number$/ do
  @order_number = @config_data_file['order_number']
  wait_until_entity_exists("path","#{@order_number}" , 30, "")
  order_number = page.find(:xpath,"#{@order_number}").text
  if(order_number!="")
    puts "Order number is displayed on order confirmation page"
  else
    puts "Order number is NOT displayed in order confirmation page"
  end
  puts "Order Number is :" + "#{order_number}"
end

And /^I should see the order total$/ do
  @order_total = @config_data_file['order_total']
  wait_until_entity_exists("path","#{@order_total}" , 30, "")
   order_total = page.find(:xpath,"#{@order_total}").text
  if(order_total!="")
    puts "Order total is displayed on order confirmation page"
  else
    puts "Order total is NOT displayed in order confirmation page"
  end
  puts "Order Total is :"+ "#{order_total}"
end