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
  @expectedOrderReviewPageTitle = @config_data_file['checkout_orderreview_page_title']
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
  puts "Contact email address entered on payment page: " + @contactemailaddress
  @order_review_contactemail = page.find(:xpath, @order_review_contact_email).text
  puts "\n"
  puts "Contact email address on order review page: " + @order_review_contactemail
  if (@order_review_contactemail == @contactemailaddress)
    puts "Contact email address is displaying as expected on order review page"
  else
    puts "Contact email address is not displaying as expected on order review page"
  end
end

Then /^I should see contact phone number$/ do
  @contactphonenumber = @phonenumberareacode + @phonenumberexchangeNbr + @phonenumbersubscriberNbr
  puts "Contact phone number entered on payment page: " + @contactphonenumber
  @order_review_phone = page.find(:xpath, @order_review_phone).text
  puts "\n"
  puts "Contact phone on Order review page: " + @order_review_phone
  if (@contactphonenumber == @order_review_phone)
    puts "Contact phone number is displaying as expected on order review page"
  else
    puts "Contact phone number is not displaying as expected on order review page"
  end
end

When /^I place order on review page$/ do
  wait_until { page.find(:xpath, "#{@order_review_place_order_btn}").visible? }
  page.find(:xpath, "#{@order_review_place_order_btn}").click
  puts "Order placed successfully"
end

When /^I click the edit shipping address button$/ do
  wait_until { page.find(:xpath, "#{@order_review_edit_shipping_details_btn}").visible? }
  page.find(:xpath, "//a[@id='#{@order_review_edit_shipping_details_btn}").click
end

And /^I should see the order review page URL$/ do
  browser = Capybara.current_session
  curr_url = browser.current_url
  if (curr_url.index(@order_review_page_url))
    puts "Review page URL is displayed as expected"
  else
    puts "Review page URL is not displayed as expected"
  end
  puts "\n"
end