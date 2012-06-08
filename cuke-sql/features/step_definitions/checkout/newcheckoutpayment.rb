#Script Name        :  newcheckoutpayment      
#Description        :  This class contains steps of payment page functionality.   
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

Then /^I should see the Payment page$/ do
  @expectedPaymentPageTitle = @config_data_file['checkout_payment_page_title']
  page_navigated = page.has_content? @expectedPaymentPageTitle
  if (page_navigated)
    puts "Expected Page is displayed i.e. : " + @expectedPaymentPageTitle
    puts "\n"
  else
    notExpectedTitle=@browser.title
    puts "Expected Page is not displayed : " + notExpectedTitle
  end
end

And /^I select card type "([^"]*)"$/ do |cardtype|
  @cardtype=cardtype
  @billing_credit_card_type = @config_data_file['billing_credit_card_type']
  select(@cardtype, :from => @billing_credit_card_type)
end

And /^I enter card number "([^"]*)"$/ do |cardnumber|  
  @cardnumber=cardnumber
  @billing_card_number = @config_data_file['billing_card_number']
  fill_in @billing_card_number, :with => @cardnumber
end

And /^I select expiry month "([^"]*)"$/ do |expmonth|
  @expmonth=expmonth
  @billing_expiration_month = @config_data_file['billing_expiration_month']
  select(@expmonth, :from => @billing_expiration_month)
end

And /^I select expiry year "([^"]*)"$/ do |expyear|  
  @expyear=expyear
  @billing_expiration_year = @config_data_file['billing_expiration_year']
  select(@expyear, :from => @billing_expiration_year)
end

And /^I enter security code "([^"]*)"$/ do |securitycode|  
  @billing_security_code = @config_data_file['billing_security_code']
  @securitycode=securitycode
  fill_in @billing_security_code, :with => @securitycode
end

And /^I select same as my shipping address of billing address$/ do  
   @billing_sameasshippingaddress = @config_data_file['billing_sameasshippingaddress']
   check(@billing_sameasshippingaddress)  
end
And /^I enter contact email address "([^"]*)"$/ do |contactemailaddress|
  @contactemailaddress=contactemailaddress
  @billing_contact_emailaddress = @config_data_file['billing_contact_emailaddress']
  fill_in @billing_contact_emailaddress, :with => @contactemailaddress
end

And /^I enter contactphonenumberareacode "([^"]*)"$/ do |contactphonenumberareacode|
  @contactphonenumberareacode=contactphonenumberareacode
  @billing_area_code= @config_data_file['billing_area_code']
  fill_in @billing_area_code, :with => @contactphonenumberareacode
end

And /^I enter contactphonenumberexchangeNbr "([^"]*)"$/ do |contactphonenumberexchangeNbr|
  @contactphonenumberexchangeNbr=contactphonenumberexchangeNbr
  @billing_exchange_nbr = @config_data_file['billing_exchange_nbr']
  fill_in @billing_exchange_nbr, :with => @contactphonenumberexchangeNbr
end

And /^I enter contactphonenumbersubscriberNbr "([^"]*)"$/ do |contactphonenumbersubscriberNbr|
  @contactphonenumbersubscriberNbr=contactphonenumbersubscriberNbr
  @billing_subscriber_nbr = @config_data_file['billing_subscriber_nbr']
  fill_in @billing_subscriber_nbr, :with => @contactphonenumbersubscriberNbr
end

When /^I continue checkout on payment page$/ do
  @billing_continue_checkout_btn = @config_data_file['billing_continue_checkout_btn']
  wait_until_entity_exists("path",@billing_continue_checkout_btn , 30, "")  
  page.find(:xpath, "#{@billing_continue_checkout_btn}").click
end

Then /^I should see the Payment page with error message$/ do
  page.wait_until do
  page.text.include? "errormessage"
end
end

Then /^I should see EGC overlay$/ do
  @billing_egc_overlay_cancel = @config_data_file['billing_egc_overlay_cancel']
  if (page.find(:xpath, "#{@billing_egc_overlay_cancel}").visible?) then
    puts "EGC overlay is displayed"
   
   else
    puts "EGC overlay is not displayed"
   end 
end

Then /^I am on payment page with error message$/ do
   @payment_page_url = @config_data_file['checkout_payment_page_url']
   page_navigated = page.has_content? @payment_page_url 
   puts "On Payment Page"  
end

And /^credit card number should be masked except for last (\d+) digits$/ do |arg1|
   pageMaskedCard = page.has_content? "************1111"
   puts pageMaskedCard
   puts "masked ******************************"
end

Then /^expiration date fields and security code field should be disabled$/ do
   if (page.find(:xpath, "#{@billing_expiration_month}").visible?)
   puts "fail"
   else
   puts "pass"
  end
  if (page.find(:xpath, "#{@billing_expiration_year}").visible?)
    puts "fail"
  else 
    puts "pass"
   end
end

When /^I click on add card button on payment page$/ do
  @billing_addcard_btn = @config_data_file['billing_addcard_btn']
  wait_until_entity_exists("path","#{@billing_addcard_btn}" , 30, "")  
  page.find(:xpath, "#{@billing_addcard_btn}").click
end

Then /^I am on order review page$/ do
   @orderreview_page_title = @config_data_file['checkout_orderreview_page_title']
   page_navigated = page.has_content? @orderreview_page_title 
end

And /^I select create profile checkbox$/ do
  @billing_create_profile_checkbox = @config_data_file['billing_create_profile_checkbox']
  check(@billing_create_profile_checkbox)
end

And /^I enter profile email address "([^"]*)"$/ do |createprofileemailaddress|
  @createprofileemailaddress=createprofileemailaddress
  @billing_create_profile_emailaddress = @config_data_file['billing_create_profile_emailaddress']
  fill_in @billing_create_profile_emailaddress, :with => @createprofileemailaddress
end

And /^I enter profile confirm email address "([^"]*)"$/ do |createprofileconfirmemail|
  @createprofileconfirmemail=createprofileconfirmemail
  @billing_create_profile_confirmemailaddress = @config_data_file['billing_create_profile_confirmemailaddress']
  fill_in @billing_create_profile_confirmemailaddress, :with => @createprofileconfirmemail
end

And /^I enter profile password "([^"]*)"$/ do |createprofilepwd|
  @createprofilepwd=createprofilepwd
  @billing_create_profile_password= @config_data_file['billing_create_profile_password']
  fill_in @billing_create_profile_password, :with => @createprofilepwd
end

And /^I enter profile confirm password "([^"]*)"$/ do |createprofileconfirmpwd|
  @createprofileconfirmpwd=createprofileconfirmpwd
  @billing_create_profile_confirmpassword = @config_data_file['billing_create_profile_confirmpassword']
  fill_in @billing_create_profile_confirmpassword, :with => @createprofileconfirmpwd
end

And /^I select profile birthday month "([^"]*)"$/ do |birthmonth|
  @birthmonth=birthmonth
  @billing_create_profile_birthmonth = @config_data_file['billing_create_profile_birthmonth']
  select(@birthmonth, :from => @billing_create_profile_birthmonth)
end

And /^I select profile birthday date "([^"]*)"$/ do |birthdate|
  @birthdate=birthdate
  @billing_create_profile_birthday = @config_data_file['billing_create_profile_birthday']
  select(@birthdate, :from => @billing_create_profile_birthday)
end

And /^I select profile birthday year "([^"]*)"$/ do |birthyear|
  @birthyear=birthyear
  @billing_create_profile_birthyear = @config_data_file['billing_create_profile_birthyear']
  select(@birthyear, :from => @billing_create_profile_birthyear)
end

And /^I enter gift card number "([^"]*)"$/ do |egccardnumber|
  @egccardnumber=egccardnumber
  @billing_egc_cardnumber= @config_data_file['billing_egc_cardnumber']
  fill_in @billing_egc_cardnumber, :with => @egccardnumber
end

And /^I enter captcha security verification code "([^"]*)"$/ do |captcha|
  @captcha=captcha
  @billing_egc_captcha= @config_data_file['billing_egc_captcha']
  fill_in @billing_egc_captcha, :with => @captcha
end

When /^I click on add card$/ do
  @billing_egc_addcard = @config_data_file['billing_egc_addcard']
  wait_until_entity_exists("path","#{@billing_egc_addcard}" , 30, "")
  page.find(:xpath, "#{@billing_egc_addcard}").click
end

Then /^I should see the EGC overlay with error message$/ do
 
end

Then /^I should see empty captcha text field$/ do
 if(@billing_empty_egc_captcha == "")
    puts "Captcha text field is cleared"
  else
    puts "Captcha text field is not cleared"
  end
end

When /^I click on new image$/ do
  @billing_egc_newcaptcha = @config_data_file['billing_egc_newcaptcha']
  wait_until_entity_exists("path","#{@billing_egc_newcaptcha}" , 30, "")
  page.find(:xpath, "#{@billing_egc_newcaptcha}").click
end

Then /^I should see new captch security verification code$/ do
  pending # express the regexp above with the code you wish you had
end

And /^I should see the payment page URL$/ do
  browser = Capybara.current_session
  curr_url = browser.current_url
  @payment_page_url = @config_data_file['checkout_payment_page_url']
  if (curr_url.index(@payment_page_url))
    puts "Payment page URL is displayed as expected"
  else
    puts "Payment page URL is not displayed as expected"
  end
end

Then /^I should be again redirected to Payment page$/ do
  browser = Capybara.current_session
  curr_url = browser.current_url
  @payment_errorpage_url = @config_data_file['checkout_payment_errorpage_url']
  if (curr_url.index(@payment_errorpage_url))
   puts "Redirected to payment page after error is displayed"
  else
   puts "Not redirected to payment page after error is displayed"
  end
end

And /^I should see empty security code field$/ do
  @billing_empty_security_code = @config_data_file['billing_security_code']
  @billing_empty_security_code_value = page.find(:xpath, "#{@billing_empty_security_code}").value  
  if(@billing_empty_security_code_value == "")
     puts "Security field is cleared"
   else
     puts "Security field is not cleared"
   end
end

And /^I should see card number text field in EGC overlay$/ do
  @billing_egc_cardnumber= @config_data_file['billing_egc_cardnumber']
   if (page.find(:xpath, @billing_egc_cardnumber).visible?) then
    puts "Card number text field on EGC overlay is displayed"
   else
    puts "Card number text field on EGC overlay is not displayed"
   end 
end

And /^I should see captcha image in EGC overlay$/ do
  @billing_egc_captcha_image = @config_data_file['billing_egc_captcha_image']
   if (page.find(:xpath, @billing_egc_captcha_image).visible?) then
    puts "Captcha image on EGC overlay is displayed"
   else
    puts "Captcha image on EGC overlay is not displayed"
   end 
end

And /^I should see new image button in EGC overlay$/ do
  @billing_egc_newcaptcha = @config_data_file['billing_egc_newcaptcha']
   if (page.find(:xpath, @billing_egc_newcaptcha).visible?) then
    puts "New image button on EGC overlay is displayed"
   else
    puts "New image button on EGC overlay is not displayed"
   end 
end

And /^I should see text field to enter captcha in EGC overlay$/ do
   @billing_egc_captcha= @config_data_file['billing_egc_captcha']
   if (page.find(:xpath, @billing_egc_captcha).visible?) then
    puts "Enter captcha text field on EGC overlay is displayed"
   else
    puts "Enter captcha text field on EGC overlay is not displayed"
   end 
end

And /^I should see submit button in EGC overlay$/ do
  @billing_egc_addcard = @config_data_file['billing_egc_addcard']
   if (page.find(:xpath, @billing_egc_addcard).visible?) then
    puts "Submit button on EGC overlay is displayed"
   else
    puts "Submit button on EGC overlay is not displayed"
   end 
end

And /^I should see cancel button in EGC overlay$/ do
   @billing_egc_cancel = @config_data_file['billing_egc_cancel']
   if (page.find(:xpath, @billing_egc_cancel).visible?) then
    puts "Cancel button on EGC overlay is displayed"
   else
    puts "Cancel button on EGC overlay is not displayed"
   end 
end

When /^I enter new payment information$/ do

end

Then /^I validate billing address same as shipping address$/ do
  @billing_first_name = @config_data_file['billing_first_name']
  @billing_last_name = @config_data_file['billing_last_name']
  @billing_address_1 = @config_data_file['billing_address_1']
  @billing_city = @config_data_file['billing_city']
  @billing_state = @config_data_file['billing_state']
  @billing_zipcode = @config_data_file['billing_zipcode']
    page.find(:xpath, "#{@billing_first_name}").value.should == @new_shipping_firstname
    page.find(:xpath, "#{@billing_last_name}").value.should == @new_shipping_lastname
    page.find(:xpath, "#{@billing_address_1}").value.should == @new_shipping_address1
    page.find(:xpath, "#{@billing_city}").value.should == @new_shipping_city
    page.find(:xpath, "#{@billing_state}").value.should == @new_shipping_state
    page.find(:xpath, "#{@billing_zipcode}").value.to_i.should == @new_shipping_zip_code
end

When /^I enter credit card details$/ do         
  @billing_credit_card_type = @config_data_file['billing_credit_card_type']
  @billing_card_number = @config_data_file['billing_card_number']
  @billing_expiration_month = @config_data_file['billing_expiration_month']
  @billing_expiration_year = @config_data_file['billing_expiration_year'] 
  @billing_new_card_type = @config_data_file['billing_new_card_type']
  @billing_new_card_number = @config_data_file['billing_new_card_number']
  @billing_new_card_securitycode = @config_data_file['billing_new_card_securitycode']
  @billing_new_card_month = @config_data_file['billing_new_card_month']
  @billing_new_card_year = @config_data_file['billing_new_card_year']
    select(@billing_new_card_type, :from => @billing_credit_card_type)
    fill_in @billing_card_number, :with => @billing_new_card_number
    fill_in @billing_security_code, :with => @billing_new_card_securitycode
    select(@billing_new_card_month, :from => @billing_expiration_month)
    select(@billing_new_card_year.to_s, :from => @billing_expiration_year)
end

When /^I enter billing address$/ do
  @billing_first_name = @config_data_file['billing_first_name']
  @billing_last_name = @config_data_file['billing_last_name']
  @billing_address_1 = @config_data_file['billing_address_1']
  @billing_city = @config_data_file['billing_city']
  @billing_state = @config_data_file['billing_state']
  @billing_zipcode = @config_data_file['billing_zipcode']
  @billing_contact_emailaddress = @config_data_file['billing_contact_emailaddress']
  @billing_area_code= @config_data_file['billing_area_code']
  @billing_exchange_nbr = @config_data_file['billing_exchange_nbr']
  @billing_subscriber_nbr = @config_data_file['billing_subscriber_nbr']
  @billing_new_firstname = @config_data_file['billing_new_firstname']
  @billing_new_lastname = @config_data_file['billing_new_lastname']
  @billing_new_address1 = @config_data_file['billing_new_address1']
  @billing_new_city = @config_data_file['billing_new_city']
  @billing_new_state = @config_data_file['billing_new_state']
  @billing_new_zip_code = @config_data_file['billing_new_zip_code']
  @billing_new_area_code = @config_data_file['billing_new_area_code']
  @billing_new_exchange_code = @config_data_file['billing_new_exchange_code']
  @billing_new_subscriber_code = @config_data_file['billing_new_subscriber_code']
  @billing_new_contact_emailaddress = @config_data_file['billing_new_contact_emailaddress']
    fill_in @billing_first_name, :with => @billing_new_firstname
    fill_in @billing_last_name, :with => @billing_new_lastname
    fill_in @billing_address_1, :with => @billing_new_address1
    fill_in @billing_city, :with => @billing_new_city
    select(@billing_new_state, :from => @billing_state)
    fill_in @billing_zipcode, :with => @billing_new_zip_code
    wait_until_entity_exists("text", 'enter', 30, "")      
    @billing_contact_emailaddress = @config_data_file['billing_contact_emailaddress']
    fill_in @billing_contact_emailaddress, :with => @billing_new_contact_emailaddress
    @billing_area_code= @config_data_file['billing_area_code']
    fill_in @billing_area_code, :with => @billing_new_area_code
    @billing_exchange_nbr = @config_data_file['billing_exchange_nbr']
    fill_in @billing_exchange_nbr, :with => @billing_new_exchange_code
    @billing_subscriber_nbr = @config_data_file['billing_subscriber_nbr']
    fill_in @billing_subscriber_nbr, :with => @billing_new_subscriber_code
end
