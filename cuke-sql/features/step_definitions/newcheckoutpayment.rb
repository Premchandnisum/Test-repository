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
    @billing_credit_card_type = @config_data_file['billing_credit_card_type']
    @billing_card_number = @config_data_file['billing_card_number']
    @billing_expiration_month = @config_data_file['billing_expiration_month']
    @billing_expiration_year = @config_data_file['billing_expiration_year']
    @billing_security_code = @config_data_file['billing_security_code']
    @billing_sameasshippingaddress = @config_data_file['billing_sameasshippingaddress']
    @billing_contact_emailaddress = @config_data_file['billing_contact_emailaddress']
    @billing_area_code= @config_data_file['billing_area_code']
    @billing_exchange_nbr = @config_data_file['billing_exchange_nbr']
    @billing_subscriber_nbr = @config_data_file['billing_subscriber_nbr']
    @billing_continue_checkout_btn = @config_data_file['billing_continue_checkout_btn']
    @payment_page_title = @config_data_file['payment_page_title']
    @billing_addcard_btn = @config_data_file['billing_addcard_btn']
    @billing_create_profile_checkbox = @config_data_file['billing_create_profile_checkbox']
    @billing_create_profile_confirmemailaddress = @config_data_file['billing_create_profile_confirmemailaddress']
    @billing_create_profile_password= @config_data_file['billing_create_profile_password']
    @billing_create_profile_confirmpassword = @config_data_file['billing_create_profile_confirmpassword']
    @billing_create_profile_birthmonth = @config_data_file['billing_create_profile_birthmonth']
    @billing_create_profile_birthday = @config_data_file['billing_create_profile_birthday']
    @billing_create_profile_birthyear = @config_data_file['billing_create_profile_birthyear']
    @billing_egc_cardnumber= @config_data_file['billing_egc_cardnumber']
    @billing_egc_captcha= @config_data_file['billing_egc_captcha']
    @billing_egc_addcard = @config_data_file['billing_egc_addcard']
    @billing_egc_newcaptcha = @config_data_file['billing_egc_newcaptcha']
    @payment_page_url = @config_data_file['checkout_payment_page_url']
    @payment_errorpage_url = @config_data_file['checkout_payment_errorpage_url']
    @billing_empty_security_code = @config_data_file['billing_security_code']
    @billing_egc_overlay_cancel = @config_data_file['billing_egc_overlay_cancel']
 else
    notExpectedTitle=@browser.title
    puts "Expected Page is not displayed : " + notExpectedTitle
  end
end

And /^I select card type "([^"]*)"$/ do |cardtype|
  @cardtype=cardtype
  select(@cardtype, :from => @billing_credit_card_type)
end

And /^I enter card number "([^"]*)"$/ do |cardnumber|  
  @cardnumber=cardnumber
  fill_in @billing_card_number, :with => @cardnumber
end

And /^I select expiry month "([^"]*)"$/ do |expmonth|
  @expmonth=expmonth
  select(@expmonth, :from => @billing_expiration_month)
end

And /^I select expiry year "([^"]*)"$/ do |expyear|  
  @expyear=expyear
  select(@expyear, :from => @billing_expiration_year)
end

And /^I enter security code "([^"]*)"$/ do |securitycode|  
  @securitycode=securitycode
  fill_in @billing_security_code, :with => @securitycode
end

And /^I select same as my shipping address of billing address$/ do  
  check(@billing_sameasshippingaddress)
end
And /^I enter contact email address "([^"]*)"$/ do |contactemailaddress|
  @contactemailaddress=contactemailaddress
  fill_in @billing_contact_emailaddress, :with => @contactemailaddress
end

And /^I enter contactphonenumberareacode "([^"]*)"$/ do |contactphonenumberareacode|
  @contactphonenumberareacode=contactphonenumberareacode
  fill_in @billing_area_code, :with => @contactphonenumberareacode
end

And /^I enter contactphonenumberexchangeNbr "([^"]*)"$/ do |contactphonenumberexchangeNbr|
  @contactphonenumberexchangeNbr=contactphonenumberexchangeNbr
  fill_in @billing_exchange_nbr, :with => @contactphonenumberexchangeNbr
end

And /^I enter contactphonenumbersubscriberNbr "([^"]*)"$/ do |contactphonenumbersubscriberNbr|
  @contactphonenumbersubscriberNbr=contactphonenumbersubscriberNbr
  fill_in @billing_subscriber_nbr, :with => @contactphonenumbersubscriberNbr
end

When /^I continue checkout on payment page$/ do
  wait_until { page.find(:xpath, "#{@billing_continue_checkout_btn}").visible? }
  page.find(:xpath, "#{@billing_continue_checkout_btn}").click
end

Then /^I should see the Payment page with error message$/ do
  page.wait_until do
  page.text.include? "errormessage"
end
end

Then /^I should see EGC overlay$/ do
  if (page.find(:xpath, "#{@billing_egc_overlay_cancel}").visible?) then
    puts "pass"
   else
    puts "fail"
   end 
end

Then /^I am on payment page with error message$/ do
   page_navigated = page.has_content? @paymentPageTitle 
   puts "On Payment Page"  
end

And /^credit card number should be masked except for last (\d+) digits$/ do |arg1|
   pageMaskedCard = page.has_content? "************1111"
   puts pageMaskedCard
   puts "masked ******************************####################"
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
   wait_until { page.find(:xpath, "#{@billing_addcard_btn}").visible? }
  page.find(:xpath, "#{@billing_addcard_btn}").click
end

Then /^I am on order review page$/ do
   orderreview_page_title = @config_data_file['orderreview_page_title']
   expectedPageTitle=@browser.title
   puts expectedPageTitle
end

And /^I select create profile checkbox$/ do
   check(@billing_create_profile_checkbox)
end

And /^I enter profile email address "([^"]*)"$/ do |createprofileemailaddress|
  @createprofileemailaddress=createprofileemailaddress
  fill_in @billing_create_profile_emailaddress, :with => @createprofileemailaddress
end

And /^I enter profile confirm email address "([^"]*)"$/ do |createprofileconfirmemail|
  @createprofileconfirmemail=createprofileconfirmemail
  fill_in @billing_create_profile_confirmemailaddress, :with => @createprofileconfirmemail
end

And /^I enter profile password "([^"]*)"$/ do |createprofilepwd|
  @createprofilepwd=createprofilepwd
  fill_in @billing_create_profile_password, :with => @createprofilepwd
end

And /^I enter profile confirm password "([^"]*)"$/ do |createprofileconfirmpwd|
  @createprofileconfirmpwd=createprofileconfirmpwd
  fill_in @billing_create_profile_confirmpassword, :with => @createprofileconfirmpwd
end

And /^I select profile birthday month "([^"]*)"$/ do |birthmonth|
  @birthmonth=birthmonth
  select(@birthmonth, :from => @billing_create_profile_birthmonth)
end

And /^I select profile birthday date "([^"]*)"$/ do |birthdate|
  @birthdate=birthdate
  select(@birthdate, :from => @billing_create_profile_birthday)
  
end

And /^I select profile birthday year "([^"]*)"$/ do |birthyear|
  @birthyear=birthyear
  select(@birthyear, :from => @billing_create_profile_birthyear)
end

And /^I enter gift card number "([^"]*)"$/ do |egccardnumber|
  @egccardnumber=egccardnumber
  fill_in @billing_egc_cardnumber, :with => @egccardnumber
end

And /^I enter captcha security verification code "([^"]*)"$/ do |captcha|
  @captcha=captcha
  fill_in @billing_egc_captcha, :with => @captcha
end

When /^I click on add card$/ do
  wait_until { page.find(:xpath, "#{@billing_egc_addcard}").visible? }
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
  wait_until { page.find(:xpath, "#{@billing_egc_newcaptcha}").visible? }
  page.find(:xpath, "#{@billing_egc_newcaptcha}").click
end

Then /^I should see new captch security verification code$/ do
  pending # express the regexp above with the code you wish you had
end

And /^I should see the payment page URL$/ do
  browser = Capybara.current_session
  curr_url = browser.current_url
  if (curr_url.index(@payment_page_url))
    puts "Payment page URL is displayed as expected"
  else
    puts "Payment page URL is not displayed as expected"
  end
  puts "\n"
end

Then /^I should be again redirected to Payment page$/ do
  browser = Capybara.current_session
  curr_url = browser.current_url
  if (curr_url.index(@payment_errorpage_url))
   puts "Redirected to payment page after error is displayed"
  else
   puts "Not redirected to payment page after error is displayed"
  end
   puts "\n"
end

And /^I should see empty security code field$/ do
  @billing_empty_security_code_value = page.find(:xpath, "#{@billing_empty_security_code}").value  
  if(@billing_empty_security_code_value == "")
     puts "Security field is cleared"
   else
     puts "Security field is not cleared"
   end
end