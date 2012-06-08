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
  @order_total_in_shopping_bag = @config_data_file['shopping_bag_order_total_in_shopping_bag']
  @order_total_currency_in_shopping_bag = @config_data_file['shopping_bag_order_total_currency_in_shopping_bag']
  @orderTotalInBag = page.find(:xpath, "#{@order_total_in_shopping_bag}").text
  @orderTotalCurrencyInBag = page.find(:xpath, "#{@order_total_currency_in_shopping_bag}").text
  @orderTotalInBag = @orderTotalCurrencyInBag + @orderTotalInBag
  puts "Order total in shopping bag page is:" + @orderTotalInBag
end

And /^order total in mini bag should be same as in shopping bag$/ do
  @order_total_in_mini_bag_on_shipping_page = @config_data_file['mini_bag_order_total_in_mini_bag_on_shipping_page']
  @orderTotalInShippingPage = page.find(:xpath, "#{@order_total_in_mini_bag_on_shipping_page}").text
  puts "orderTotal in checkout shipping page is:" + @orderTotalInShippingPage
  case @orderTotalInShippingPage
  when @orderTotalInShippingPage   
   @orderTotalInBag==@orderTotalInShippingPage
   puts "Order total in shopping bag page and checkout shipping page is same"
  else
   puts "Order total in shopping bag page and checkout shipping page is NOT same"
  end
end

And /^I should see flat tax displayed in order summary$/ do
  # Flat tax calculation is pending
  @merchandise_total_in_shipping_page = @config_data_file['shipping_merchandise_total_in_shipping_page']
  @flat_tax_in_shipping_page = @config_data_file['shipping_flat_tax_in_shipping_page'] 
  @tax = @config_data_file['tax']
  merchandiseTotalInShippingPage = page.find(:xpath, "#{@merchandise_total_in_shipping_page}").text
  puts "Merchandise total in checkout shipping page:" + merchandiseTotalInShippingPage
  expectedFlatTaxInShippingPage = merchandiseTotalInShippingPage * + "#{@tax}"
  puts "Expected flat tax in shipping page:" + expectedFlatTaxInShippingPage
  wait_until_entity_exists("path","#{@flat_tax_in_shipping_page}" , 30, "")  
  actualFlatTaxInShippingPage=page.find(:xpath, "#{@flat_tax_in_shipping_page}").text
  case expectedFlatTaxInShippingPage 
  when expectedFlatTaxInShippingPage
   actualFlatTaxInShippingPage.should==expectedFlatTaxInShippingPage
   puts "Flat tax is calculated as expected in checkout shipping page:" + actualFlatTaxInShippingPage
  else
   actualFlatTaxInShippingPage.should_not==expectedFlatTaxInShippingPage
   puts "Flat tax is NOT calculated in checkout shipping page:" + actualFlatTaxInShippingPage
  end
end

And /^I should see error message "([^"]*)"$/ do |errormessage|
   case errormessage
   when errormessage
     page.has_content? errormessage
     puts "Error message is displayed as expected"
   else
    puts "Error message is not displayed as expected"
   end  
end

And /^bag id should be displayed in shopping bag$/ do
  @bag_id_in_shopping_bag = @config_data_file['shopping_bag_bag_id_in_shopping_bag']
  wait_until_entity_exists("path","#{@bag_id_in_shopping_bag}" , 30, "")    
  @bagIdInBag = page.find(:xpath, @bag_id_in_shopping_bag).text
  puts "Bag ID in shopping bag page is:" + @bagIdInBag
end

And /^bag id in mini bag should be same as in shopping bag$/ do
  @bag_id_in_checkout_mini_bag = @config_data_file['mini_bag_bag_id_in_checkout_mini_bag']
  wait_until_entity_exists("path","#{@bag_id_in_checkout_mini_bag}" , 30, "")  
  @bagIdInCheckout = page.find(:xpath, @bag_id_in_checkout_mini_bag).text
  puts "Bag ID in checkout page is:" + @bagIdInCheckout
  case @bagIdInBag
  when @bagIdInBag
   @bagIdInCheckout.should==@bagIdInBag
   puts "Bag Id in shopping bag page and checkout page is same"
  else
   @bagIdInCheckout.should_not==@bagIdInBag 
   puts "Bag Id in shopping bag page and checkout page is NOT same"
  end
end

Then /^I should see the bag id on shipping page$/ do
  @bag_id_in_checkout_mini_bag = @config_data_file['mini_bag_bag_id_in_checkout_mini_bag']
  wait_until_entity_exists("path","#{@bag_id_in_checkout_mini_bag}" , 30, "")
  @bagIdInCheckoutbeforePlacingAnOrder = page.find(:xpath, @bag_id_in_checkout_mini_bag).text
end

Then /^I should see the updated bag id on shipping page$/ do
  @bag_id_in_checkout_mini_bag = @config_data_file['mini_bag_bag_id_in_checkout_mini_bag']
  wait_until_entity_exists("path","#{@bag_id_in_checkout_mini_bag}" , 30, "")
  @bagIdInCheckoutAfterPlacingAnOrder = page.find(:xpath, @bag_id_in_checkout_mini_bag).text
  case @bagIdInCheckoutAfterPlacingAnOrder
  when @bagIdInCheckoutAfterPlacingAnOrder
    @bagIdInCheckoutbeforePlacingAnOrder.should == @bagIdInCheckoutAfterPlacingAnOrder
    puts "Bag ID before and after placing order is same : " + @bagIdInCheckoutbeforePlacingAnOrder
  else
    @bagIdInCheckoutbeforePlacingAnOrder.should_not == @bagIdInCheckoutAfterPlacingAnOrder
    puts "Bag ID before placing an order is : " + @bagIdInCheckoutbeforePlacingAnOrder +  "  Bag ID after placing an order is : " + @bagIdInCheckoutAfterPlacingAnOrder
  end
end

Then /^I should see the shipping surcharge amount$/ do
  @shipping_surcharge_amount = @config_data_file['mini_bga_shipping_surcharge_amount']
  wait_until_entity_exists("path","#{@shipping_surcharge_amount}" , 30, "")
  shipping_surcharge_amount = page.find(:xpath, @shipping_surcharge_amount).text
  puts "Shipping surcharge amount is:" + shipping_surcharge_amount
end

Then /^I should see the personalized fee amount$/ do
  @mini_bag_personalized_fee_amount = @config_data_file['mini_bag_personalized_fee_amount']
  wait_until_entity_exists("path","#{@mini_bag_personalized_fee_amount}" , 30, "")
  personalized_fee_amount = page.find(:xpath, @mini_bag_personalized_fee_amount).text
  puts "Personalized fee amount is:" + personalized_fee_amount
end

Then /^I should see the sales tax amount$/ do
  @sales_tax_amount=@config_data_file['sales_tax_amount']
  wait_until_entity_exists("path","#{@sales_tax_amount}" , 30, "")
  sales_tax_amount = page.find(:xpath, @sales_tax_amount).text
  puts "Sales tax amount is:" + sales_tax_amount
end

And /^my items are in the mini bag$/ do
  pending # express the regexp above with the code you wish you had
end

And /^bag count should be displayed in the shopping bag$/ do  
  @mini_bag_sales_tax_amount = @config_data_file['mini_bag_sales_tax_amount']
  wait_until_entity_exists("path","#{@mini_bag_sales_tax_amount}" , 30, "")
  @itemCountInShoppingBag = page.find(:xpath, @mini_bag_sales_tax_amount).text
  puts "Item count in shopping bag is:" + @itemCountInShoppingBag
end

And /^bag count in mini bag should be same as in the shopping bag$/ do
  wait_until_entity_exists("path","#{@itemCountInMiniBag}" , 30, "")
  case @itemCountInShoppingBag
  when @itemCountInShoppingBag
    @itemCountInShoppingBag.should==@itemCountInMiniBag
    puts "Item count in shopping bag page and mini bag is same:" + @itemCountInMiniBag
   else
    @itemCountInShoppingBag.should_not==@itemCountInMiniBag
    puts "Item count in shopping bag page and mini bag is NOT same:" + @itemCountInMiniBag
   end
end

And /^bag count should be displayed in mini bag$/ do
  @item_count_in_mini_bag = @config_data_file['mini_bag_item_count']
  wait_until_entity_exists("path","#{@item_count_in_mini_bag}" , 30, "")
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
  @mini_bag_shopping_bag_icon = @config_data_file['mini_bag_shopping_bag_icon']
  wait_until_entity_exists("path","#{@mini_bag_shopping_bag_icon}" , 30, "")
  page.find(:xpath, @mini_bag_shopping_bag_icon).click
end

And /^the page should be secure$/ do
  browser = Capybara.current_session
  curr_url = browser.current_url
  case curr_url
  when curr_url
    curr_url.index("https") != nil
    puts "It is secured page"
  else
    puts "It is not secured page"
  end
end


And /^the url should contain "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end


Then /^my items are in the shopping bag$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I am on international home page$/ do
   browser = Capybara.current_session
   curr_url = browser.current_url
   @international_home_page = @config_data_file['international_home_page']
   case @international_home_page
   when @international_home_page
    curr_url.index(@international_home_page)
    puts "International home page is displayed"
   else
    puts "International home page is NOT displayed"
   end
  
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

And /^I enter a promo code "([^"]*)"$/ do |promocode|
  @promo_code = @config_data_file['mini_bag_promo_code']
  wait_until_entity_exists("path","#{@promo_code}" , 30, "")
  @promocode=promocode
  fill_in @promo_code, :with => @promocode
end

When /^I apply promo code$/ do
  @order_total_in_mini_bag_on_shipping_page = @config_data_file['mini_bag_order_total_in_mini_bag_on_shipping_page']
  wait_until_entity_exists("path","#{@order_total_in_mini_bag_on_shipping_page}" , 30, "")
  @ordertotalbeforeapplying = page.find(:xpath, @order_total_in_mini_bag_on_shipping_page).text
  @apply_promo_code = @config_data_file['mini_bag_apply_promo_code']
  wait_until_entity_exists("path","#{@apply_promo_code}" , 30, "")
  page.find(:xpath, "#{@apply_promo_code}").click
end

Then /^I should see the order summary details are updated$/ do
  @order_total_in_mini_bag_on_shipping_page = @config_data_file['mini_bag_order_total_in_mini_bag_on_shipping_page']
  wait_until_entity_exists("path","#{@order_total_in_mini_bag_on_shipping_page}" , 30, "")
  @ordertotalafter = page.find(:xpath, @order_total_in_mini_bag_on_shipping_page).text
  if (@ordertotalbeforeapplying > @ordertotalafter)
    puts "Order Summary details are getting updated after applying promo code"
  elsif (@ordertotalbeforeremoving < @ordertotalafter)
    puts "Order Summary details are getting updated after removing promo code"
   else
     puts "Order Summary details are not getting updated"
  end
end
  

Then /^I should see the applied promo code details$/ do
  @mini_bag_promotion_description = @config_data_file['mini_bag_promotion_description']
  @mini_bag_promotion_price = @config_data_file['mini_bag_promotion_price']
  wait_until_entity_exists("path","#{@mini_bag_promotion_description}" , 30, "")
   if (page.find(:xpath, @mini_bag_promotion_description).visible? & page.find(:xpath, @mini_bag_promotion_price).visible?)
    puts "Applied promo code details are displayed as expected"
  else
    puts "Applied promo code details are not displayed as expected"
  end
end

When /^I remove promo code$/ do
  @remove_promo_code = @config_data_file['mini_bag_remove_promo_code']
  @order_total_in_mini_bag_on_shipping_page = @config_data_file['mini_bag_order_total_in_mini_bag_on_shipping_page']
  wait_until_entity_exists("path","#{@order_total_in_mini_bag_on_shipping_page}" , 30, "")
  @ordertotalbeforeremoving = page.find(:xpath, @order_total_in_mini_bag_on_shipping_page).text
  wait_until_entity_exists("path",@remove_promo_code , 30, "")
  page.find(:xpath, "#{@remove_promo_code}").click
end

Then /^I should see the promo code is removed$/ do
  @remove_promo_code = @config_data_file['mini_bag_remove_promo_code']
  wait_until_entity_exists("path","#{@remove_promo_code}" , 30, "")
  @apply_promo_code = @config_data_file['mini_bag_apply_promo_code']
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
  # wait_until { page.find(:xpath, "").visible? }
  # page.find(:xpath, "").click
end

When /^I click on Product Name for a product in mini bag$/ do
  # To click the first product name .. X path needs to be updated ..
  #wait_until_entity_exists("path","" , 30, "")
  #page.find(:xpath, "").click
end


# Header and Footer links functionality 
When /^I click Macy's logo$/ do
  @macys_logo = @config_data_file['macys_logo']
  Wait_until_entity_exists("path","#{@header_eassyretunlink}" , 30, "")
  page.find(:xpath, "#{@macys_logo}").click
end

And /^I should see easyReturnLink in footer$/ do
  @footer_shopwithconfidence_eassyretuns = @config_data_file['footer_shopwithconfidence_eassyretuns']
  easyRetunsLink=page.find(:xpath, "#{@footer_shopwithconfidence_eassyretuns}")
  wait_until_entity_exists("path","#{@footer_shopwithconfidence_eassyretuns}" , 30, "")
  if (easyRetunsLink.visible?) then
    puts "easyRetunsLink is display"
  else
    puts "easyRetunsLink is not display"
  end
end

And /^I should see secureShoppingLink in footer$/ do
  @footer_shopwithconfidence_secureshopping = @config_data_file['footer_shopwithconfidence_secureshopping']
  secureShoppingLink=page.find(:xpath, "#{@footer_shopwithconfidence_secureshopping}")
  wait_until_entity_exists("path","#{@footer_shopwithconfidence_secureshopping}" , 30, "")
  if (secureShoppingLink.visible?) then
    puts "secureShoppingLink is display"
  else
    puts "secureShoppingLink is not display"
  end
end

And /^I should see privacyPolicyDetailsLink in footer$/ do
  @footer_shopwithconfidence_privacypolicy = @config_data_file['footer_shopwithconfidence_privacypolicy']
  privacyPolicyDetailsLink=page.find(:xpath, "#{@footer_shopwithconfidence_privacypolicy}")
  wait_until_entity_exists("path","#{@footer_shopwithconfidence_privacypolicy}" , 30, "")
  if (privacyPolicyDetailsLink.visible?) then
    puts "privacyPolicyDetailsLink is display"
  else
    puts "privacyPolicyDetailsLink is not display"
  end
end

And /^I should see ShippingPolicyDetailsLink in footer$/ do
  @footer_shopwithconfidence_shippingpolicy = @config_data_file['footer_shopwithconfidence_shippingpolicy']
  shippingPolicyDetailsLink= page.find(:xpath, "#{@footer_shopwithconfidence_shippingpolicy}")
  wait_until_entity_exists("path","#{@footer_shopwithconfidence_shippingpolicy}" , 30, "")
  if (shippingPolicyDetailsLink.visible? ) then
     puts "shippingPolicyDetailsLink is display"
   else
     puts "shippingPolicyDetailsLink is not display"
   end
end

When /^I click on secureShoppingLink$/ do
  @footer_shopwithconfidence_secureshopping = @config_data_file['footer_shopwithconfidence_secureshopping']
  wait_until_entity_exists("path","#{@footer_shopwithconfidence_secureshopping}" , 30, "")
  page.find(:xpath, "#{@footer_shopwithconfidence_secureshopping}").click
end

Then /^I should see Security Policy pop up$/ do
  
end

When /^I click on privacyPolicyDetailsLink$/ do
  @footer_shopwithconfidence_privacypolicy = @config_data_file['footer_shopwithconfidence_privacypolicy']
  wait_until_entity_exists("path","#{@footer_shopwithconfidence_privacypolicy}" , 30, "")
  page.find(:xpath, "#{@footer_shopwithconfidence_privacypolicy}").click
end

Then /^I should see Privacy pop up$/ do
  
end

When /^I click on ShippingPolicyDetailsLink$/ do
  @footer_shopwithconfidence_shippingpolicy = @config_data_file['footer_shopwithconfidence_shippingpolicy']
  wait_until_entity_exists("path","#{@footer_shopwithconfidence_shippingpolicy}" , 30, "")
  page.find(:xpath, "#{@footer_shopwithconfidence_shippingpolicy}").click
end

Then /^I should see Shipping Policy pop up$/ do
  
end

When /^I click on easyReturnLink$/ do
  @footer_shopwithconfidence_eassyretuns = @config_data_file['footer_shopwithconfidence_eassyretuns']
  wait_until_entity_exists("path","#{@footer_shopwithconfidence_eassyretuns}" , 30, "")
  page.find(:xpath, "#{@footer_shopwithconfidence_eassyretuns}").click
end

Then /^I should see Return Policy pop up$/ do
  page_navigated = page.has_content? "Return Policy"
  if (page_navigated)
   puts "Expected Page is displayed i.e. :"
  else
   puts "Expected Page is Not displayed i.e. :"
   notExpectedTitle=@browser.title
   puts "Expected Page is not displayed : " + notExpectedTitle
  end
end

Then /^I should see livechat in header$/ do
  @header_chat = @config_data_file['header_chat']
  wait_until_entity_exists("path","#{@header_chat}" , 30, "")
   livechat= page.find(:xpath, "#{@header_chat}")
   wait_until_entity_exists("path",@header_chat , 30, "")
   if (livechat.visible? ) then
     puts "livechat is displayed"
   else
     puts "livechat is not displayed"
   end
end

Then /^I should see clicktocall in header$/ do
  @header_clicktocall = @config_data_file['header_clicktocall']
  wait_until_entity_exists("path","#{@header_clicktocall}" , 30, "")
  clicktocall= page.find(:xpath, "#{@header_clicktocall}")
   wait_until_entity_exists("path",@header_clicktocall , 30, "")
   if (clicktocall.visible? ) then
     puts "clicktocall is displayed"
   else
     puts "clicktocall is not displayed"
   end
end

When /^I click on livechat$/ do
  @header_chat = @config_data_file['header_chat']
  wait_until_entity_exists("path","#{@header_chat}" , 30, "")
  page.find(:xpath, "#{@header_chat}").click
end

Then /^I should see livechat pop up$/ do
  
end

When /^I click on clicktocall$/ do
  @header_clicktocall = @config_data_file['header_clicktocall']
  wait_until_entity_exists("path","#{@header_clicktocall}" , 30, "")
  page.find(:xpath, "#{@header_clicktocall}").click
end

Then /^I should see clicktocall pop up$/ do

end

When /^I close the pop up$/ do

end

Then /^pop up should be closed$/ do
  
end

And /^I should see the order summary details$/ do
  @mini_bag_sales_tax_amount = @config_data_file['sales_tax_amount']
  @mini_bag_sub_total=@config_data_file['mini_bag_sub_total']
  @mini_bag_shipping_cost=@config_data_file['mini_bag_shipping_cost']
  @mini_bag_you_saved=@config_data_file['mini_bag_you_saved']
  @mini_bag_order_total=@config_data_file['mini_bag_order_total']
  wait_until_entity_exists("path", "#{@mini_bag_sub_total}" , 30, "")
  @mini_bag_sub_total_chkout = page.find(:xpath, "#{@mini_bag_sub_total}").text
  puts "Sub total is : " + @mini_bag_sub_total_chkout
  @mini_bag_shipping_cost_chkout = page.find(:xpath, "#{@mini_bag_shipping_cost}").text
  puts "Shipping charge is : " + @mini_bag_shipping_cost_chkout
  @mini_bag_sales_tax_amount_chkout = page.find(:xpath, "#{@mini_bag_sales_tax_amount}").text
  puts "Sales tax amount is : " + @mini_bag_sales_tax_amount_chkout
  @mini_bag_you_saved_chkout = page.find(:xpath, "#{@mini_bag_you_saved}").text
  puts "You saved amount is : " + @mini_bag_you_saved_chkout
  @mini_bag_order_total_chkout = page.find(:xpath, "#{@mini_bag_order_total}").text
  puts "Order total is : " + @mini_bag_order_total_chkout
end

Then /^I see breadcrumbs on "([^"]*)" page$/ do |page_id, table|  
  table.hashes.each do |element|
    @element1 = element['first']
    @element2 = element['second']
  end
  case page_id
  when "PDP"
      bread_crumbs = @ids_data_file['class_bread_crumbs']
      you_are_in = @ids_data_file['text_you_are_in']
      wait_until_entity_exists("text", you_are_in , 15, "") 
      table.hashes.each do |element|
        page.find(:xpath, "//div[@class='#{bread_crumbs}']/a[1]").text.should == @element1
        page.find(:xpath, "//div[@class='#{bread_crumbs}']/a[2]").text.should == @element2
      end
  else
      element2 = @element2.to_i
      bread_crumbs = @ids_data_file['bread_crumbs']
      wait_until_entity_exists("text", page_id , 15, "")   
      page.find(:xpath, "//div[@id='#{bread_crumbs}']/ul/li[#{element2}]")['class'].should == @element1
  end
end

And /^I see bag_id displayed$/ do
  @shopping_bag_id = @config_data_file['shopping_bag_id']
  wait_until_entity_exists("text", 'Bag ID', 15, "") 
  page.find(:xpath, "#{@shopping_bag_id}").text.length.should > 10
end

Then /^I see promo_code displayed$/ do  
  @shopping_bag_promo_code_input = @config_data_file['shopping_bag_promo_code_input']
  wait_until_entity_exists("text", 'Promo', 15, "") 
  page.find(:xpath, "#{@shopping_bag_promo_code_input}") != nil
end

Then /^I see the page is secure$/ do
  is_page_secured()
end

And /^I see minibag displayed$/ do  
  @mini_bag_container = @config_data_file['mini_bag_container']
  page.find(:xpath, "#{@mini_bag_container}") != nil
end


Then /^I see "([^"]*)" in red color$/ do |field|
  page.find(:xpath, "//label[@for='#{field}']")['class'].should_not == nil
end

Then /^I verify merchandise total$/ do  
  @shopping_bag_merchandise_total_bag = @config_data_file['shopping_bag_merchandise_total_bag']
  page.find(:xpath, "#{@shopping_bag_merchandise_total_bag}").text.should == @item_dollar_price_as_string
end

Then /^I verify merchandise total on "([^"]*)" page$/ do |pagename|
@shopping_bag_merchandise_total_bag = @config_data_file['shopping_bag_merchandise_total_bag']
  case "shopping bag"
  when "shopping bag" 
      order_subtotal = page.find(:xpath, "#{@shopping_bag_merchandise_total_bag}").text
  end
end

Then /^I am on the "([^"]*)" page$/ do |page|
  wait_until_entity_exists("text", page, 10, "")  
end

Then /^I see text "([^"]*)"$/ do |text|
  wait_until_entity_exists("text", text, 15, "") 
end

When /^I go back one step$/ do
  @back_one_step_btn= @config_data_file['back_one_step_btn']
  page.find(:xpath, "#{@back_one_step_btn}").click
end

When /^I sign in as "([^"]*)" with "([^"]*)"$/ do |email, word|
  sign_in(email, word)
end

Then /^I verify the sign_in failure using "([^"]*)"$/ do |error_message|
  wait_until_entity_exists("text", error_message, 10, "")  
end

Then /^I validate pagetitle on "([^"]*)" page for "([^"]*)"$/ do |pagename, feature|
  page.find(:xpath, "//title").text.include?(pagename).should == true     
end