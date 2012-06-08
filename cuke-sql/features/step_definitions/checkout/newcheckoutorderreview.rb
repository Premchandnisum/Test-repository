#Script Name        :  newcheckoutorderreview
#Description        :  This class contains steps of order review page functionality.
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

Then /^I should see the order review page$/ do
  @expectedOrderReviewPageTitle=@config_data_file['checkout_orderreview_page_title']
   page_navigated = page.has_content? @expectedOrderReviewPageTitle
  if (page_navigated)
    puts "Expected Page is displayed i.e. : " + @expectedOrderReviewPageTitle
    puts "\n"
  else
    notExpectedTitle=@browser.title
    puts "Expected Page is not displayed : " + notExpectedTitle
  end
end

And /^I should see contact email address$/ do
  @order_review_contact_email = @config_data_file['order_review_contact_email']
  puts "Contact email address entered on payment page: " + @contactemailaddress
  wait_until_entity_exists("path", "#{@order_review_contact_email}" , 30, "")
  @order_review_contactemail = page.find(:xpath, "#{@order_review_contact_email}").text
  puts "\n"
  puts "Contact email address on order review page: " + @order_review_contactemail
  if (@order_review_contactemail == @contactemailaddress)
    puts "Contact email address is displaying as expected on order review page"
  else
    puts "Contact email address is not displaying as expected on order review page"
  end
end

Then /^I should see contact phone number$/ do
  @order_review_phone = @config_data_file['order_review_phone']
  @contactphonenumber = @contactphonenumberareacode + @contactphonenumberexchangeNbr + @contactphonenumbersubscriberNbr
  puts "Contact phone number entered on payment page: " + @contactphonenumber
  wait_until_entity_exists("path","#{@order_review_phone}" , 30, "")
  @order_review_phone = page.find(:xpath, "#{@order_review_phone}").text
  puts "\n"
  puts "Contact phone on Order review page: " + @order_review_phone
  if (@contactphonenumber == @order_review_phone)
    puts "Contact phone number is displaying as expected on order review page"
  else
    puts "Contact phone number is not displaying as expected on order review page"
  end
end

When /^I place order on review page$/ do
  @order_review_place_order_btn=@config_data_file['order_review_place_order_btn']
  wait_until_entity_exists("path","#{@order_review_place_order_btn}" , 30, "")
  page.find(:xpath, "#{@order_review_place_order_btn}").click
  puts "Order placed successfully"
end

When /^I click the edit shipping address button$/ do
  @order_review_edit_shipping_details_btn=@config_data_file['order_review_edit_shipping_details_btn']
  wait_until_entity_exists("path","#{@order_review_edit_shipping_details_btn}" , 30, "")
  page.find(:xpath, "#{@order_review_edit_shipping_details_btn}").click
end

When /^I click the edit payment address button$/ do
  @order_review_edit_payment_details_btn=@config_data_file['order_review_edit_payment_details_btn']
  wait_until_entity_exists("path","#{@order_review_edit_payment_details_btn}" , 30, "")
  page.find(:xpath, "#{@order_review_edit_payment_details_btn}").click
end

And /^I should see the order review page URL$/ do
  browser = Capybara.current_session
  curr_url = browser.current_url
  @checkout_order_review_page_url=@config_data_file['checkout_order_review_page_url']
  if (curr_url.index(@checkout_order_review_page_url))
    puts "Review page URL is displayed as expected"
  else
    puts "Review page URL is not displayed as expected"
  end
end

Then /^the shipping address should be correct on order review page$/ do
  @order_review_edit_shipping_details_info=@config_data_file['order_review_edit_shipping_details_info']
  wait_until_entity_exists("path","#{@order_review_edit_shipping_details_info}" , 30, "")
  order_review_page_ship_address = page.find(:xpath, "#{@order_review_edit_shipping_details_info}").text
  if (order_review_page_ship_address.index(@new_shipping_firstname) == nil || order_review_page_ship_address.index(@new_shipping_lastname) == nil || order_review_page_ship_address.index(@new_shipping_address1) == nil || order_review_page_ship_address.index(@new_shipping_city) == nil || order_review_page_ship_address.index(@new_shipping_zip_code) == nil)
    raise "shipping address is not as expected in order review page"
  end
end

Then /^the billing address should be correct on order review page$/ do
  @order_review_edit_payment_details_info=@config_data_file['order_review_edit_payment_details_info']
  wait_until_entity_exists("path","#{@order_review_edit_payment_details_info}" , 30, "")
  order_review_page_billing_address = page.find(:xpath, "#{@order_review_edit_payment_details_info}").text
  if (order_review_page_billing_address.index(@billing_new_firstname) == nil || order_review_page_billing_address.index(@billing_new_lastname) == nil || order_review_page_billing_address.index(@billing_new_address1) == nil || order_review_page_billing_address.index(@billing_new_city) == nil || order_review_page_billing_address.index(@billing_new_zip_code) == nil)
    raise "billing address is not as expected in order review page"
  end
end

And /^shipping address should be updated in order review page$/ do
  @order_review_edit_shipping_details_info=@config_data_file['order_review_edit_shipping_details_info']
  wait_until_entity_exists("path","#{@order_review_edit_shipping_details_info}" , 30, "")
  order_review_page_ship_address = page.find(:xpath, "#{@order_review_edit_shipping_details_info}").text
  if (order_review_page_ship_address.index(@edit_shipping_firstname) == nil && order_review_page_ship_address.index(@edit_shipping_lastname) != nil && order_review_page_ship_address.index(@edit_shipping_address1) != nil && order_review_page_ship_address.index(@edit_shipping_city) != nil && order_review_page_ship_address.index(@edit_shipping_zip_code) != nil)
    raise "Shipping address is not updated in order review page"
  end
end

And /^I see updated payment information$/ do
  @order_review_edit_payment_details_info=@config_data_file['order_review_edit_payment_details_info']
  wait_until_entity_exists("path","#{@order_review_edit_payment_details_info}" , 30, "")
  order_review_page_billing_address = page.find(:xpath, "#{@order_review_edit_payment_details_info}").text
  if (order_review_page_billing_address.index(@billing_new_contact_emailaddress) == nil)
    raise "Payment information not updated"
  end
end

Given /^I am on order review page of new checkout$/ do
  steps %Q{
          Given I am on the Macy's home page
          Then I navigate to product detail page with common product id "<prodid>"
           |prodid|
           |1310|
          When I add items on bag
          Then I am on the your shopping bag page
          When I continue checkout on your shopping bag page
          Then I am on checkout signin page
          When I continue as a guest user
          Then I should see the Shipping page
          When I enter shipping details
          When I continue checkout on shipping page
          Then I should see the Payment page
          When I enter credit card details
            And I enter billing address
          When I continue checkout on payment page
          Then I should see the order review page
      }
end

And /^I validate the fields_and_buttons on ordereview page$/ do |pagename|

#page.find(:xpath, "#{@order_review_edit_shipping_details_btn}") != nil
#page.find(:xpath, "#{@order_review_contact_email}") != nil
#page.find(:xpath, "#{@order_review_place_order_btn}") != nil
#page.find(:xpath, "#{@order_review_edit_shipping_details_btn}") != nil
#page.find(:xpath, "#{@order_review_edit_payment_details_btn}") != nil
#page.find(:xpath, "//a/span").text.should == 'back one step'

end