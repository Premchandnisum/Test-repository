# # Date coded: 05/04/12, and month of May 2012
# 
# # Author: Sreenivas Bud
# 
When /^I select the first item from collection$/ do
  ids_data_file = "config/data/qa/ids.yml"
  @ids_data_file = YAML::load(File.open(ids_data_file))
  bedding_collection = @ids_data_file['bedding_collection']
  product_details = @ids_data_file['product_details']
  page.find(:xpath, "//div[@id='#{bedding_collection}']/div/div[2]/div/a").click
  wait_until_entity_exists("text", "Product Details", 10, "")
end

# When /^I start choosing items$/ do
  # page.find(:xpath, "//a[@href='#bottomArea']").click
# end
# 
# # When /^I add item (\d+) to bag$/ do |number|
  # # product_list = @ids_data_file['product_list']
  # # page.find(:xpath, "//div[@id='#{product_list}']/div[#{number}]/div[4]/img").click
# # end
# 
# When /^I add item (\d+) to bag$/ do |number|
  # i_number = number.to_i
  # i_ctr = 0
  # product_list = @ids_data_file['product_list']
  # #page.find(:xpath, "//div[@id='#{product_list}']/div[#{number}]/div[4]/img").click
  # page.all(:xpath, "//div[@id='#{product_list}']/div").each do |element|
    # if !element['class'].include?('hideProduct')
      # element_id = element['id']
      # i_ctr +=1
      # if i_ctr == i_number
        # page.find(:xpath, "//div[@id='#{element_id}']").find(:xpath, ".//img[@alt='add to bag']").click
        # break
      # end
    # end 
  # end
# end
# 
# When /^I retrieve product price for item (\d+)$/ do |number|
  # product_list = @ids_data_file['product_list']
  # product_price_section = @ids_data_file['product_price_section']
  # product_price = @ids_data_file['product_price']
  # price_sale = @ids_data_file['price_sale']
  # @item_dollar_price_as_string = "0"
  # @item_dollar_price_as_float = 0.0  
#   
  # i_number = number.to_i
  # i_ctr = 0
    # page.all(:xpath, "//div[@id='#{product_list}']/div").each do |element|
    # if !element['class'].include?('hideProduct')
      # element_id = element['id']
      # i_ctr +=1
      # if i_ctr == i_number
        # @has_sale = page.has_xpath?("//div[@id='#{element_id}']/div[@class='#{product_price_section}']/div[@class='#{product_price}']/span[@class='#{price_sale}']")
        # if @has_sale == true
          # item_price = page.find(:xpath, "//div[@id='#{element_id}']/div[@class='#{product_price_section}']/div[@class='#{product_price}']/span[@class='#{price_sale}']").text       
        # else
          # item_price = page.find(:xpath, "//div[@id='#{element_id}']/div[@class='#{product_price_section}']/div[@class='#{product_price}']/span[1]").text   
          # @has_percentage_off = page.find(:xpath, "//div[@id='#{element_id}']").find(:xpath, ".//span[@class='badgeHeader']")
        # end
#         
        # @item_dollar_price_as_string = item_price[(item_price.index('$')+1)..-1]
        # @item_dollar_price_as_float = Float(@item_dollar_price_as_string)
#         
        # if @has_percentage_off != nil
            # item_percentage = page.find(:xpath, "//div[@id='#{element_id}']").find(:xpath, ".//span[@class='badgeHeader']").text
            # percent_pos = item_percentage.index('%')
            # item_off = item_percentage[(percent_pos-2)..(percent_pos-1)]
            # discount = (item_off.to_f)/100
            # @item_dollar_price_as_float = @item_dollar_price_as_float - (@item_dollar_price_as_float * discount)
            # @item_dollar_price_as_float = ("%.2f" % @item_dollar_price_as_float)
            # @item_dollar_price_as_string = @item_dollar_price_as_float.to_s
        # end
        # break
      # end
    # end 
  # end
# end
# 
# # Then /^I am on the "([^"]*)" page$/ do |page|
  # # wait_until_entity_exists("text", page, 10, "")  
# # end
# 
# # Then /^I see text "([^"]*)"$/ do |text|
  # # wait_until_entity_exists("text", text, 15, "") 
# # end
# 
# When /^I start checkout$/ do
  # checkout_in_popup = @ids_data_file['checkout_in_popup']  
  # wait_until_entity_exists("img_id", checkout_in_popup, 15, "") 
  # page.find(:xpath, "//img[@id='#{checkout_in_popup}']").click
# end
# 
# When /^I continue checkout$/ do
  # continue_checkout = @ids_data_file['continue_checkout']  
  # page.find(:xpath, "//img[@id='#{continue_checkout}']").click
  # # when '/PRODUCTION' 
    # # continue_checkout = @ids_data_file['continue_checkout']  
    # # page.find(:xpath, "//img[@id='#{continue_checkout}']").click
  # # else
    # # continue_checkout = @ids_data_file['submit']  
    # # page.find(:xpath, "//input[@id='#{continue_checkout}']").click
  # # end
# end
# 
# When /^I continue checkout again$/ do
  # case @env_current
  # when '/PRODUCTION' 
    # class_continue_checkout_button = @ids_data_file['class_continue_checkout_button']  
    # page.find(:xpath, "//img[@class='#{class_continue_checkout_button}']").click
  # else
    # class_continue_checkout_button = @ids_data_file['submit'] 
    # page.find(:xpath, "//input[@id='#{class_continue_checkout_button}']").click
  # end
# end
# 
# When /^I choose checkout without profile$/ do
  # without_profile = @ids_data_file['without_profile']  
  # page.find(:xpath, "//input[@id='#{without_profile}']").click
# end
# 
# # When /^I set quantity to (\d+)$/ do |qty|
  # # product_list = @ids_data_file['product_list']
  # # qty_id = page.find(:xpath, "//div[@id='#{product_list}']/div[#{qty}]/div[4]/div[id='memberProdQty']")
  # # puts qty_id
  # # select('2', :from => qty_id)
  # # sleep 30
# # end
# 
# 
# # Then /^I verify merchandise total$/ do
  # # merch_total = @ids_data_file['merch_total']
  # # page.find(:xpath, "//td[@name='#{merch_total}']").text.should == @item_dollar_price_as_string
# # end
# 
# 
# Then /^I verify merchandise total on "([^"]*)" page$/ do |pagename|
    # if pagename == "shopping bag"
      # merch_total = @ids_data_file['merch_total_bag']
      # order_subtotal = page.find(:xpath, "//div[@id='#{merch_total}']").text
    # else
      # case @env_current
      # when '/PRODUCTION' 
        # merch_total = @ids_data_file['merch_total']
        # page.find(:xpath, "//td[@name='#{merch_total}']").text.should == @item_dollar_price_as_string
      # else
        # merch_total = @ids_data_file['sub_total_amount']
        # order_subtotal = page.find(:xpath, "//span[@id='#{merch_total}']").text
      # end 
      # if order_subtotal.include?('$')
        # order_subtotal = order_subtotal[1..-1]
      # end
      # order_subtotal.should == @item_dollar_price_as_string
    # end
# end
# 
# 
# # When /^I enter shipping details$/ do
  # # firstname = @ids_data_file['firstname1']
  # # lastname = @ids_data_file['lastname1']
  # # address1 = @ids_data_file['address1']
  # # city = @ids_data_file['city1']
  # # state = @ids_data_file['state1']
  # # zipcode = @ids_data_file['zip_code1']
  # # areacode = @ids_data_file['area_code1']
  # # exchangecode = @ids_data_file['exchange_code1']
  # # subsribercode = @ids_data_file['subscriber_code1']
# #   
  # # case @env_current
  # # when '/PRODUCTION' 
      # # fill_in 'firstname', :with => firstname
      # # fill_in 'lastname', :with => lastname
      # # fill_in 'address1', :with => address1
      # # fill_in 'city', :with => city
      # # select(state, :from => 'state')
      # # fill_in 'zipcode', :with => zipcode
      # # fill_in 'areacode', :with => areacode
      # # fill_in 'exchangeNbr', :with => exchangecode
      # # fill_in 'subscriberNbr', :with => subsribercode
      # # class_continue_checkout_button = @ids_data_file['class_continue_checkout_button']  
      # # page.find(:xpath, "//img[@class='#{class_continue_checkout_button}']").click
  # # else
      # # fill_in 'sfName', :with => firstname
      # # fill_in 'slName', :with => lastname
      # # fill_in 'sAddress', :with => address1
      # # fill_in 'sCity', :with => city
      # # select(state, :from => 'sState')
      # # fill_in 'spostalCode', :with => zipcode
      # # fill_in 'shippingAreaCode', :with => areacode
      # # fill_in 'shippingExchNum', :with => exchangecode
      # # fill_in 'shippingSubNum', :with => subsribercode
      # # submit_button = @ids_data_file['submit']  
      # # page.find(:xpath, "//input[@id='#{submit_button}']").click
  # # end
# # end
# 
# # When /^I enter credit card details$/ do
  # # case @env_current
  # # when '/PRODUCTION' 
    # # cctype = @ids_data_file['cctype_p']
    # # ccnum = @ids_data_file['ccnumber_p']
    # # cccode = @ids_data_file['cccode_p']
    # # ccmon = @ids_data_file['ccmonth_p']
    # # ccyear = @ids_data_file['ccyear_p']
  # # else
    # # cctype = @ids_data_file['cctype_q1']
    # # ccnum = @ids_data_file['ccnumber_q1']
    # # cccode = @ids_data_file['cccode_q1']
    # # ccmon = @ids_data_file['ccmonth_q1']
    # # ccyear = @ids_data_file['ccyear_q1']    
  # # end
# #   
  # # dat_cctype = @ids_data_file['gentype']
  # # dat_ccnum = @ids_data_file['gennum']
  # # dat_cccode = @ids_data_file['gencode']
  # # dat_ccmon = @ids_data_file['genmonth']
  # # dat_ccyear = @ids_data_file['genyear']
# # 
  # # select(dat_cctype, :from => cctype)
  # # fill_in ccnum, :with => dat_ccnum
  # # fill_in cccode, :with => dat_cccode
  # # select(dat_ccmon, :from => ccmon)
  # # # Can't avoid hardcoding year here.
  # # select('2020', :from => ccyear)
# # end
# 
# # When /^I enter billing address$/ do
  # # firstname = @ids_data_file['firstname1']
  # # lastname = @ids_data_file['lastname1']
  # # address1 = @ids_data_file['address1']
  # # city = @ids_data_file['city1']
  # # state = @ids_data_file['state1']
  # # zipcode = @ids_data_file['zip_code1']
  # # areacode = @ids_data_file['area_code1']
  # # exchangecode = @ids_data_file['exchange_code1']
  # # subsribercode = @ids_data_file['subscriber_code1']
# # 
  # # use_my_shipping_address = @ids_data_file['use_my_shipping_address']
  # # contact_email1 = @ids_data_file['contact_email1']
  # # verify_email1 = @ids_data_file['verify_email1']
  # # pay_area_code = @ids_data_file['pay_area_code']
  # # pay_exchange_code = @ids_data_file['pay_exchange_code']
  # # pay_subscriber_code = @ids_data_file['pay_subscriber_code']
  # # test_email1 = @ids_data_file['test_email1']
# # 
  # # case @env_current
  # # when '/PRODUCTION' 
    # # fill_in 'firstName', :with => firstname
    # # fill_in 'lastName', :with => lastname
    # # fill_in 'addressLine1', :with => address1
    # # fill_in 'city', :with => city
    # # select(state, :from => 'state')
    # # fill_in 'zipCode', :with => zipcode
    # # fill_in 'phoneAreaCode', :with => areacode
    # # fill_in 'phoneExchangeNBR', :with => exchangecode
    # # fill_in 'phoneSubscriberNBR', :with => subsribercode
  # # else 
    # # # fill_in 'sfName', :with => firstname
    # # # fill_in 'slName', :with => lastname
    # # # fill_in 'sAddress', :with => address1
    # # # fill_in 'sCity', :with => city
    # # # select(state, :from => 'sState')
    # # # fill_in 'spostalCode', :with => zipcode
    # # # fill_in 'shippingAreaCode', :with => areacode
    # # # fill_in 'shippingExchNum', :with => exchangecode
    # # # fill_in 'shippingSubNum', :with => subsribercode
# #     
    # # page.check(use_my_shipping_address)
    # # wait_until_entity_exists("text", 'enter', 30, "")  
   # # end   
# #     
  # # fill_in contact_email1, :with => test_email1
  # # fill_in verify_email1, :with => test_email1
  # # # fill_in pay_area_code, :with => areacode
  # # # fill_in pay_exchange_code, :with => exchangecode
  # # # fill_in pay_subscriber_code, :with => subsribercode 
# # end
# 
# When /^I sign in as "([^"]*)" with "([^"]*)"$/ do |email, word|
  # sign_in(email, word)
# end
# 
# Then /^I verify the sign_in failure using "([^"]*)"$/ do |error_message|
  # wait_until_entity_exists("text", error_message, 10, "")  
# end
# 
# 
# # Then /^I see "([^"]*)" in red color$/ do |field|
  # # page.find(:xpath, "//label[@for='#{field}']")['class'].should_not == nil
# # end
# 
# Given /^I am on product detail page for product "([^"]*)"$/ do |pid|
  # ids_data_file = "config/data/qa/ids.yml"
  # @ids_data_file = YAML::load(File.open(ids_data_file))
  # config_file = "config/#{ENV['ENVIRONMENT']}/navigation.yml"
  # @navigation_file = YAML::load(File.open(config_file))  
  # url_current = @navigation_file['url'] + '/shop/product?ID=' + pid
  # visit("#{url_current}")
  # @env_current = get_env()
# end
# 
# 
# Then /^I see minibag displayed$/ do
  # minibag_container = @ids_data_file['minibag_container']
  # page.find(:xpath, "//div[@id='#{minibag_container}']") != nil
# end
# 
# When /^I create profile during guest checkout$/ do
  # pending # express the regexp above with the code you wish you had
# end
# 
# Then /^I see bag_id displayed$/ do
  # bag_id = @ids_data_file['bag_id']
  # wait_until_entity_exists("text", 'Bag ID', 15, "") 
  # page.find(:xpath, "//span[@id='#{bag_id}']").text.length.should > 10
# end
# 
# Then /^I see promo_code displayed$/ do
  # promo_code_input = @ids_data_file['promo_code_input']
  # wait_until_entity_exists("text", 'Promo', 15, "") 
  # page.find(:xpath, "//li[@id='#{promo_code_input}']") != nil
# end
# 
# Then /^I see the page is secure$/ do
  # is_page_secured()
# end
# 
# 
# Then /^I validate the fields_and_buttons on "([^"]*)" page$/ do |pagename|
  # case pagename
  # when 'review'
    # change_shipping = @ids_data_file['change_shipping']
    # change_payment = @ids_data_file['change_payment']
    # promo_code_value = @ids_data_file['promo_code_value']
    # apply_promo_code = @ids_data_file['apply_promo_code']
    # place_order = @ids_data_file['place_order']
    # page.find(:xpath, "//a[@id='#{change_shipping}']") != nil
    # page.find(:xpath, "//a[@id='#{change_payment}']") != nil
    # page.find(:xpath, "//input[@id='#{promo_code_value}']") != nil
    # page.find(:xpath, "//button[@id='#{apply_promo_code}']") != nil
    # page.find(:xpath, "//button[@id='#{place_order}']") != nil
    # page.find(:xpath, "//a/span").text.should == 'back one step'
  # end
# end
# 
# 
# Then /^I see breadcrumbs on "([^"]*)" page$/ do |page_id, table|  
  # table.hashes.each do |element|
    # @element1 = element['first']
    # @element2 = element['second']
  # end
# 
  # case page_id
  # when "PDP"
      # bread_crumbs = @ids_data_file['class_bread_crumbs']
      # you_are_in = @ids_data_file['text_you_are_in']
      # wait_until_entity_exists("text", you_are_in , 15, "") 
      # table.hashes.each do |element|
        # page.find(:xpath, "//div[@class='#{bread_crumbs}']/a[1]").text.should == @element1
        # page.find(:xpath, "//div[@class='#{bread_crumbs}']/a[2]").text.should == @element2
      # end
  # else
      # element2 = @element2.to_i
      # bread_crumbs = @ids_data_file['bread_crumbs']
      # wait_until_entity_exists("text", page_id , 15, "")   
      # page.find(:xpath, "//div[@id='#{bread_crumbs}']/ul/li[#{element2}]")['class'].should == @element1
  # end
# end
# 
# 
# Then /^I validate pagetitle on "([^"]*)" page for "([^"]*)"$/ do |pagename, feature|
    # page.find(:xpath, "//title").text.include?(pagename).should == true
    # # page.find(:xpath, "//title").text.include?(feature).should == true
#     
# end  
# 
# Then /^I checkout without profile$/ do
      # steps %Q{
                # When I start checkout
                # Then I am on the "your shopping bag" page
                # When I continue checkout
                # Then I am on the "profile" page
                # When I choose checkout without profile
                # Then I am on the "shipping address" page
      # }
# end
# 
# 
# Then /^I validate billing address same as shipping address$/ do
  # firstname = @ids_data_file['firstname1']
  # lastname = @ids_data_file['lastname1']
  # address1 = @ids_data_file['address1']
  # city = @ids_data_file['city1']
  # state = @ids_data_file['state2']
  # zipcode = @ids_data_file['zip_code1']
  # areacode = @ids_data_file['area_code1']
  # exchangecode = @ids_data_file['exchange_code1']
  # subsribercode = @ids_data_file['subscriber_code1']
# 
  # case @env_current
  # when '/PRODUCTION' 
    # page.find(:xpath, "//input[@id='firstName']").value.should == firstname
    # page.find(:xpath, "//input[@id='lastName']").value.should == lastname
    # page.find(:xpath, "//input[@id='addressLine1']").value.should == address1
    # page.find(:xpath, "//input[@id='city']").value.should == city
    # page.find(:xpath, "//select[@id='state']").value.should == state
    # page.find(:xpath, "//input[@id='zipCode']").value.to_i.should == zipcode
    # page.find(:xpath, "//input[@id='phoneAreaCode']").value.to_i.should == areacode
    # page.find(:xpath, "//input[@id='phoneExchangeNBR']").value.to_i.should == exchangecode
    # page.find(:xpath, "//input[@id='phoneSubscriberNBR']").value.to_i.should == subsribercode
  # else
    # raise "Pending details"
  # end
#     
# end
# 
# When /^I go back one step$/ do
  # page.find(:xpath, "//img[@alt='BACK ONE STEP']").click
# end
# 
# # Given /^I am on order review page$/ do
      # # steps %Q{
          # # Given I am on the Macy's home page
            # # And I select "for the home" from the navigation menu
          # # When I select the category "Bed & Bath"
          # # Then I should see "Bed & Bath" as the current category
          # # When I select the category "Bedding Collections"
          # # When I select the first item from collection
            # # And I start choosing items
            # # And I retrieve product price for item 1
            # # And I add item 1 to bag
          # # Then I see text "1 item added to your bag" 
          # # When I checkout without profile
          # # Then I am on the "shipping address" page
            # # And I verify merchandise total
          # # When I enter shipping details
          # # Then I am on the "Choose Shipping Options" page
            # # And I verify merchandise total
          # # When I continue checkout again
          # # Then I am on the "enter payment information" page
            # # And I verify merchandise total
          # # When I enter credit card details
            # # And I enter billing address
            # # And I continue checkout again
          # # Then I am on the "review" page
      # # }
# # end
# 
# # When /^I edit shipping address$/ do
  # # page.find(:xpath, '//*[@class="checkoutContainer shipAddr"]/a').click 
# # end
# 
# When /^I enter new shipping address$/ do
  # @shipfirstname = "Prannesh"
  # @shiplastname = "Arya"
  # @shipaddress1 = "New Market Street"
  # @shipcity = "New San Francisco"
  # @shipzipcode = "94106"
  # fill_in 'firstname', :with => @shipfirstname
  # fill_in 'lastname', :with => @shiplastname
  # fill_in 'address1', :with => @shipaddress1
  # fill_in 'city', :with => @shipcity
  # fill_in 'zipcode', :with => @shipzipcode
# end
# 
# Then /^shipping address should be updated in order review page$/ do 
  # order_review_page_ship_address = page.find(:xpath, '//*[@class="checkoutContainer shipAddr"]').text
  # if (order_review_page_ship_address.index(@shipfirstname) == nil && order_review_page_ship_address.index(@shiplastname) != nil && order_review_page_ship_address.index(@shipaddress1) != nil && order_review_page_ship_address.index(@shipcity) != nil && order_review_page_ship_address.index(@shipzipcode) != nil)
    # raise "Shipping address is not updated in order review page"
  # end
# end
# 
# 
# When /^I edit payment address$/ do
  # page.find(:xpath, '//*[@class="checkoutContainer BillInfo"]/a').click
# end
# 
# When /^I enter sec code "([^"]*)"$/ do |seccode|
  # fill_in 'abc', :with => seccode  
# end
# 
# # When /^I enter new payment information$/ do
  # # fill_in 'contactEmail', :with => 'nag_new@macys.com'
  # # fill_in 'verifyEmail', :with => 'nag_new@macys.com'
# # end
# 
# # Then /^I see updated payment information$/ do
  # # order_review_page_billing_address = page.find(:xpath, '//*[@class="OrderReview_billingAddress"]/div').text
  # # if (order_review_page_billing_address.index("nag_new@macys.com") == nil)
    # # raise "Payment information not updated"
  # # end
# # end
# 
# 
# # Then /^the shipping address should be correct on order review page$/ do 
  # # @firstname = @ids_data_file['firstname1']
  # # @lastname = @ids_data_file['lastname1']
  # # @address1 = @ids_data_file['address1']
  # # @city = @ids_data_file['city1']
  # # @zipcode = @ids_data_file['zip_code1'].to_s  
  # # order_review_page_ship_address = page.find(:xpath, '//*[@class="checkoutContainer shipAddr"]').text
  # # if (order_review_page_ship_address.index(@firstname) == nil || order_review_page_ship_address.index(@lastname) == nil || order_review_page_ship_address.index(@address1) == nil || order_review_page_ship_address.index(@city) == nil || order_review_page_ship_address.index(@zipcode) == nil)
    # # raise "shipping address is not as expected in order review page"
  # # end
# # end
# 
# # Then /^the billing address should be correct on order review page$/ do
  # # order_review_page_billing_address = page.find(:xpath, '//*[@class="OrderReview_billingAddress"]/div').text
  # # if (order_review_page_billing_address.index(@firstname) == nil || order_review_page_billing_address.index(@lastname) == nil || order_review_page_billing_address.index(@address1) == nil || order_review_page_billing_address.index(@city) == nil || order_review_page_billing_address.index(@zipcode) == nil)
    # # raise "billing address is not as expected in order review page"
  # # end
# # end
# 
