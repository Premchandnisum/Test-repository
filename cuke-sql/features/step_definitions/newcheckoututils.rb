#Script Name        :  newcheckoututils      
#Description        :  This class contains common/reusable steps for throughout the checkout pages functionality.   
#Author             :  NISUM Technologies              
# Reviewer          :  Ravi Gummala            
#Creation Date      :  05/18/2012      
#Pre-conditions     :  Base environment, access to the Software Request System.
#Post-conditions:   :  Regression of the Software Request System based on functionality.
# Data Files        :  None at this level.
#******************************************************************************************************
# Revision History
#******************************************************************************************************
#Date               :                
#Revised By         :        
#******************************************************************************************************

And /^order total should be displayed in shopping bag$/ do
  @orderTotalInBag = page.find(:xpath, @order_total_in_shopping_bag).text
  @orderTotalCurrencyInBag = page.find(:xpath, @order_total_currency_in_shopping_bag).text
  @orderTotalInBag = @orderTotalCurrencyInBag + @orderTotalInBag
  puts "Order total in shopping bag page is:" + @orderTotalInBag
  puts "\n"
end

And /^order total in mini bag should be same as in shopping bag$/ do
  @orderTotalInShippingPage = page.find(:xpath, @order_total_in_mini_bag_on_shipping_page).text
  puts "orderTotal in checkout shipping page is:" + @orderTotalInShippingPage
  puts "\n"
  if (@orderTotalInBag==@orderTotalInShippingPage)
   puts "Order total in shopping bag page and checkout shipping page is same"
  else
   puts "Order total in shopping bag page and checkout shipping page is NOT same"
  end
end

And /^I should see flat tax displayed in order summary$/ do
  # Flat tax calculation is pending
  merchandiseTotalInShippingPage = page.find(:xpath, @merchandise_total_in_shipping_page).text
  puts "Merchandise total in checkout shipping page:" + merchandiseTotalInShippingPage
  expectedFlatTaxInShippingPage = merchandiseTotalInShippingPage * 0.06
  puts "Expected flat tax in shipping page:" + expectedFlatTaxInShippingPage
  actualFlatTaxInShippingPage = page.find(:xpath, @flat_tax_in_shipping_page).text
  if (actualFlatTaxInShippingPage == expectedFlatTaxInShippingPage)
   puts "Flat tax is calculated as expected in checkout shipping page:" + actualFlatTaxInShippingPage
  else
   puts "Flat tax is NOT calculated in checkout shipping page:" + actualFlatTaxInShippingPage
  end
end

And /^I should see error message "([^"]*)"$/ do |errormessage|
   if(page.has_content? errormessage)
    puts "Error message is displayed as expected"
   else
    puts "Error message is not displayed as expected"
   end  
end

And /^bag id should be displayed in shopping bag$/ do
  @bagIdInBag = page.find(:xpath, @bag_id_in_shopping_bag).text
  puts "Bag ID in shopping bag page is:" + @bagIdInBag
  puts "\n"
end

And /^bag id in mini bag should be same as in shopping bag$/ do
  @bagIdInCheckout = page.find(:xpath, @bag_id_in_checkout_mini_bag).text
  puts "Bag ID in checkout page is:" + @bagIdInCheckout
  puts "\n"
  if (@bagIdInBag == @bagIdInCheckout)
   puts "Bag Id in shopping bag page and checkout page is same"
  else
   puts "Bag Id in shopping bag page and checkout page is NOT same"
  end
end

Then /^I should see the bag id on shipping page$/ do
  bag_id_in_checkout_mini_bag = @config_data_file['bag_id_in_checkout_mini_bag']
  wait_until { page.find(:xpath,  bag_id_in_checkout_mini_bag).visible? }
  @bagIdInCheckoutbeforePlacingAnOrder = page.find(:xpath, bag_id_in_checkout_mini_bag).text
  puts "\n"
end

Then /^I should see the updated bag id on shipping page$/ do
  bag_id_in_checkout_mini_bag = @config_data_file['bag_id_in_checkout_mini_bag']
  wait_until { page.find(:xpath,  bag_id_in_checkout_mini_bag).visible? }
  @bagIdInCheckoutAfterPlacingAnOrder = page.find(:xpath, bag_id_in_checkout_mini_bag).text
  if (@bagIdInCheckoutbeforePlacingAnOrder == @bagIdInCheckoutAfterPlacingAnOrder)
    puts "Bag ID before and after placing order is same : " + @bagIdInCheckoutbeforePlacingAnOrder
  else
    puts "Bag ID before placing an order is : " + @bagIdInCheckoutbeforePlacingAnOrder +  "  Bag ID after placing an order is : " + @bagIdInCheckoutAfterPlacingAnOrder
  end
  puts "\n"
end

Then /^I should see the shipping surcharge amount$/ do
  shipping_surcharge_amount = page.find(:xpath, @shipping_surcharge_amount).text
  puts "Shipping surcharge amount is:" + shipping_surcharge_amount
  puts "\n"
end

Then /^I should see the personalized fee amount$/ do
  personalized_fee_amount = page.find(:xpath, @mini_bag_personalized_fee_amount).text
  puts "Personalized fee amount is:" + personalized_fee_amount
  puts "\n"
end

Then /^I should see the sales tax amount$/ do
  sales_tax_amount = page.find(:xpath, @sales_tax_amount).text
  puts "Sales tax amount is:" + sales_tax_amount
  puts "\n"
end

And /^my items are in the mini bag$/ do
  pending # express the regexp above with the code you wish you had
end

And /^bag count should be displayed in the shopping bag$/ do  
  @itemCountInShoppingBag = page.find(:xpath, @mini_bag_sales_tax_amount).text
  puts "Item count in shopping bag is:" + @itemCountInShoppingBag
end

And /^bag count in mini bag should be same as in the shopping bag$/ do
  if (@itemCountInShoppingBag==@itemCountInMiniBag)
    puts "Item count in shopping bag page and mini bag is same:" + @itemCountInMiniBag
   else
    puts "Item count in shopping bag page and mini bag is NOT same:" + @itemCountInMiniBag
   end
end

And /^bag count should be displayed in mini bag$/ do
   @itemCountInMiniBag = page.find(:xpath, @item_count_in_mini_bag).text
   puts "Item count in mini bag is:" + @itemCountInMiniBag
end

When /^I click bag icon in home page$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see error message <"(.*?)">$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end


When /^I click shopping bag icon in mini bag$/ do  
  wait_until { page.find(:xpath, @mini_bag_shopping_bag_icon).visible? }
  page.find(:xpath, mini_bag_shopping_bag_icon).click
end

And /^the page should be secure$/ do
  browser = Capybara.current_session
  curr_url = browser.current_url
  if (curr_url.index("https") != nil)
    puts "It is secured page"
  else
    puts "It is not secured page"
  end
  puts "\n"
end


And /^the url should contain "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

And /^earlier entered details should be prepopulated in the fields$/ do
  puts "\n"
  puts "Previous Entered Shipping Details: " + @firstname + ", " + @lastname + ", " + @addressline1 + ", " + @addressline2 + ", " + @city + ", " + @state + ", " + @zipcode + ", " + @phonenumberareacode + ", " + @phonenumberexchangeNbr + ", " + @phonenumbersubscriberNbr   
  shipping_first_name = @config_data_file['shipping_first_name']
  shipping_last_name = @config_data_file['shipping_last_name']
  shipping_address_1 = @config_data_file['shipping_address_1']
  shipping_address_2 = @config_data_file['shipping_address_2']
  shipping_city = @config_data_file['shipping_city']
  shipping_state = @config_data_file['shipping_state']
  shipping_zipcode = @config_data_file['shipping_zipcode']
  shipping_area_code = @config_data_file['shipping_area_code']
  shipping_exchange_nbr = @config_data_file['shipping_exchange_nbr']
  shipping_subscriber_nbr = @config_data_file['shipping_subscriber_nbr']
  
  @actualfirstname = page.find(:xpath, "//input[@id='#{shipping_first_name}']").value
  @actuallastname = page.find(:xpath, "//input[@id='#{shipping_last_name}']").value
  @actualaddressline1 = page.find(:xpath, "//input[@id='#{shipping_address_1}']").value
  @actualaddressline2 = page.find(:xpath, "//input[@id='#{shipping_address_2}']").value
  @actualcity = page.find(:xpath, "//input[@id='#{shipping_city}']").value
  @actualstate = page.find(:xpath, "//select[@id='#{shipping_state}']").value
  @actualzipcode = page.find(:xpath, "//input[@id='#{shipping_zipcode}']").value
  @actualareacode = page.find(:xpath, "//input[@id='#{shipping_area_code}']").value
  @actualexchangenbr = page.find(:xpath, "//input[@id='#{shipping_exchange_nbr}']").value
  @actualsubscribernbr = page.find(:xpath, "//input[@id='#{shipping_subscriber_nbr}']").value
 
  @expectedstate = page.has_select?(shipping_state, :selected => @state)
 
  puts "\n"
  puts "Actual Shipping Details" + @actualfirstname + ", " + @actuallastname + ", " + @actualaddressline1 + ", " + @actualaddressline2 + ", " + @actualcity + ", " + @actualstate + ", " + @actualzipcode + ", " + @actualareacode + ", " + @actualexchangenbr + ", " + @actualsubscribernbr 
  puts "\n"
  
  if ((@firstname == @actualfirstname) & (@lastname == @actuallastname) & (@addressline1 == @actualaddressline1) & (@addressline2 == @actualaddressline2) & (@city == @actualcity) & (@expectedstate) & (@zipcode == @actualzipcode) & (@phonenumberareacode == @actualareacode) & (@phonenumberexchangeNbr == @actualexchangenbr) & (@phonenumbersubscriberNbr == @actualsubscribernbr))
    puts "Previously entered details are populated correctly"
  else
    puts "Previously entered details are not populated correctly"
  end
end

Then /^my items are in the shopping bag$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I am on international home page$/ do
   browser = Capybara.current_session
   curr_url = browser.current_url
   if (curr_url.index(@international_home_page))
    puts "International home page is displayed"
   else
    puts "International home page is NOT displayed"
   end
    puts "\n"
end

Then /^I navigate to GVR page$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I add registry items to bag$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see GWP price as FREE in mini bag$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see PWP price as price after discount in mini bag$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I enter a promo code$/ do |promocode|
  @promocode=promocode
  fill_in @promo_code, :with => @promocode
end

When /^I apply promo code$/ do
  wait_until { page.find(:xpath, "#{@apply_promo_code}").visible? }
  page.find(:xpath, "#{@apply_promo_code}").click
end

Then /^I should see the order summary details are updated$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see the applied promo code details$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I remove promo code$/ do
  wait_until { page.find(:xpath, "#{@remove_promo_code}").visible? }
  page.find(:xpath, "#{@remove_promo_code}").click
end

Then /^I should see the promo code is removed$/ do
  if (page.find(:xpath, "#{@remove_promo_code}").visible?)
    puts "Promo code is NOT removed"
  elsif (page.find(:xpath, "#{@apply_promo_code}").visible?)
    puts "Promo code is removed"
  else
    puts "Failed to verify remove promo code"
  end
end

When /^I click on Product Image for a product in mini bag$/ do
  # To click the first product image .. X path needs to be updated .. 
   wait_until { page.find(:xpath, "").visible? }
   page.find(:xpath, "").click
end

When /^I click on Product Name for a product in mini bag$/ do
  # To click the first product name .. X path needs to be updated ..
  wait_until { page.find(:xpath, "").visible? }
  page.find(:xpath, "").click
end


# Header and Footer links functionality 
When /^I click Macy's logo$/ do
  wait_until { page.find(:xpath, "#{@header_eassyretunlink}").visible? }
  page.find(:xpath, "#{@macys_logo}").click
end

And /^I should see easyReturnLink in footer$/ do
  easyRetunsLink=page.find(:xpath, "#{@footer_shopwithconfidence_eassyretuns}")
  wait_until { easyRetunsLink.visible? }
  if (easyRetunsLink.visible?) then
    puts "pass"
  else
    puts "fail"
  end
end

And /^I should see secureShoppingLink in footer$/ do
  secureShoppingLink=page.find(:xpath, "#{@footer_shopwithconfidence_secureshopping}")
  wait_until { secureShoppingLink.visible? }
  if (secureShoppingLink.visible?) then
    puts "pass"
  else
    puts "fail"
  end
end

And /^I should see privacyPolicyDetailsLink in footer$/ do
  privacyPolicyDetailsLink=page.find(:xpath, "#{@footer_shopwithconfidence_privacypolicy}")
  wait_until { privacyPolicyDetailsLink.visible? }
  if (privacyPolicyDetailsLink.visible?) then
    puts "pass"
  else
    puts "fail"
  end
end

And /^I should see ShippingPolicyDetailsLink in footer$/ do
  shippingPolicyDetailsLink= page.find(:xpath, "#{@footer_shopwithconfidence_shippingpolicy}")
  wait_until { shippingPolicyDetailsLink.visible? }
  if (shippingPolicyDetailsLink.visible? ) then
     puts "pass"
   else
     puts "fail"
   end
end

When /^I click on secureShoppingLink$/ do
  page.find(:xpath, "#{@footer_shopwithconfidence_secureshopping}").click
end

Then /^I should see Security Policy pop up$/ do
  
end

When /^I click on privacyPolicyDetailsLink$/ do
  page.find(:xpath, "#{@footer_shopwithconfidence_privacypolicy}").click
end

Then /^I should see Privacy pop up$/ do
  
end

When /^I click on ShippingPolicyDetailsLink$/ do
  page.find(:xpath, "//#{@footer_shopwithconfidence_shippingpolicy}").click
end

Then /^I should see Shipping Policy pop up$/ do
  
end

When /^I click on easyReturnLink$/ do
  page.find(:xpath, "//'#{@footer_shopwithconfidence_eassyretuns}").click
end

Then /^I should see Return Policy pop up$/ do
  page_navigated = page.has_content? "Return Policy"
  if (page_navigated)
   puts "Expected Page is displayed i.e. :"
   puts "\n"
  else
   puts "Expected Page is Not displayed i.e. :"
   notExpectedTitle=@browser.title
   puts "Expected Page is not displayed : " + notExpectedTitle
  end
end

Then /^I should see livechat in header$/ do
   livechat= page.find(:xpath, "#{@header_chat}")
   wait_until { livechat.visible? }
   if (livechat.visible? ) then
     puts "pass"
   else
     puts "fail"
   end
end

Then /^I should see clicktocall in header$/ do
   clicktocall= page.find(:xpath, "#{@header_clicktocall}")
   wait_until { clicktocall.visible? }
   if (clicktocall.visible? ) then
     puts "pass"
   else
     puts "fail"
   end
end

When /^I click on livechat$/ do
  page.find(:xpath, "#{@header_chat}").click
end

Then /^I should see livechat pop up$/ do
  
end

When /^I click on clicktocall$/ do
  page.find(:xpath, "#{@header_clicktocall}").click
end

Then /^I should see clicktocall pop up$/ do

end

When /^I close the pop up$/ do
 # @browser.close
end

Then /^pop up should be closed$/ do
  
end