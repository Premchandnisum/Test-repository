#######################################################
# Author: Nagarajan Ganesan
# Date: 10 May, 2012
# Description: Automation of checkout guest user flow
#######################################################

Given /^I am on MCOM site$/ do
#  Load Configuration File
  config_file = "config/#{ENV['ENVIRONMENT']}/navigation.yml"

#  Loaded file will be available throughout the execution of a scenario
  @navigation_file = YAML::load(File.open(config_file))

  ids_data_file = "config/data/qa/ids.yml"
  @ids_data_file = YAML::load(File.open(ids_data_file))
  
  @itemsaddedArray = Array.new
  $itemCount = 0
#  Grab Variables From File
  url = @navigation_file['url']
# clear cookies
  browser = Capybara.current_session.driver.browser
  browser.manage.delete_all_cookies
  visit("#{url}")
end

When /^I add any product of "([^"]*)" with "([^"]*)" to bag$/ do |cathierarchy, quantity|
  @cathierarchy = cathierarchy
  temp = cathierarchy.index("Gift Cards")
  puts "\n"
  puts "Category hierarchy: " + cathierarchy
  puts "\n"
  puts "Quantity: " + quantity
  puts "\n"
  if (temp != nil)
    #Navigate to ECG products
    click_link "Gift Cards"
    page.find(:xpath, '//*[@id="localNavigationContainer"]/ul/li[2]/ul/li/a').click
    
    # select a product
    page.find(:xpath, '//*[@id="thumbnails"]/div[1]/div[1]/div[1]/a/img').click
    
    # enter ECG data
    fill_in 'amount', :with => '10'
    fill_in 'email', :with => 'nagaraj@gmail.com'
    fill_in 'toMessage', :with => 'Dilip'
    fill_in 'message', :with => 'Happy Birthday'
    fill_in 'fromMessage', :with => 'Nagarajan'
    
    #Collecting item info
    $itemCount = $itemCount + 1
    
    # Product ID
    prodID = page.find(:xpath, '//*[@class="productID"]').text
    pidA=prodID.split(": ")
    prodID = pidA[1]
    
    # Product Name
    prodtitle = page.find(:xpath, '//*[@id="productTitle"]').text
    
    # Sales price
    prodtitle = "10" 
    
    @itemsaddedArray[$itemCount] = prodID + ";" + prodtitle + ";" + prodtitle
    
    #Adding to bag
    wait_until { page.find(:xpath, '//*[@id="giftCardAddToBag"]/img').visible? }
    page.find(:xpath, '//*[@id="giftCardAddToBag"]/img').click
 else
   # Adding products other than ECG
   
   # Navigating to the category
   cat_array = cathierarchy.split(";")
   cat_array.each do |category|
     click_link category
   end
   
   # Selecting the product
   page.find(:xpath, '//*[@id="thumbnails"]/div[1]/div[1]/div[1]/a/img').click
   
   # Set quantity and size
   wait_until { page.find(:xpath, '//*[@id="pdpAttributes"]/div[2]/div[1]/ul/li[3]/span').visible? }
   page.find(:xpath, '//*[@id="pdpAttributes"]/div[2]/div[1]/ul/li[3]/span').click
   select(quantity, :from => 'productQuantity')   

    #Collecting item info
    $itemCount = $itemCount + 1
    
    # Product ID
    prodID = page.find(:xpath, '//*[@class="productID"]').text
    pidA=prodID.split(": ")
    prodID = pidA[1]
    
    # Product Name
    prodtitle = page.find(:xpath, '//*[@id="productTitle"]').text
    
    # Sales price
    if (page.has_xpath? ('//*[@id="pdpDetails"]/div[@id="productDescription"]/div[@id="priceInfo"]/div[@class="standardProdPricingGroup"]/span[@class="priceSale"]'))
      prodprice = page.find(:xpath, '//*[@id="pdpDetails"]/div[@id="productDescription"]/div[@id="priceInfo"]/div[@class="standardProdPricingGroup"]/span[@class="priceSale"]').text
      priceA = prodprice.split("$")
      prodprice = priceA[1].strip
    else
      prodprice = page.find(:xpath, '//*[@id="pdpDetails"]/div[@id="productDescription"]/div[@id="priceInfo"]/div[@class="standardProdPricingGroup"]/span').text
    end
    @itemsaddedArray[$itemCount] = prodID + ";" + prodtitle + ";" + prodprice    
   
   #Adding to bag
   page.find(:xpath, '//*[@id="pdpButtons"]/img').click   
 end
 
 puts "Product ID #{prodID} added to the bag"
 puts "\n"
 
  # Verify item added to bag message
  wait_until { page.find(:xpath, '//*[@id="pdpAddToBagPanel"]/div/h1').visible? }
  texttoverify = page.find(:xpath, '//*[@id="pdpAddToBagPanel"]/div/h1').text
  if (texttoverify.index("added to") != nil)
    puts "found the message item added to bag"
    puts "\n"
  end
end

And /^I click the check out button$/ do
  wait_until { page.find(:xpath, '//*[@class="ftButtons"]/img[@id="btnCheckout"]').visible? }
  page.find(:xpath, '//*[@class="ftButtons"]/img[@id="btnCheckout"]').click
  puts "clicked checkout button"
  puts "\n"  
end

Then /^I should see the "([^"]*)" page$/ do |pagetitle|
  @pagetitle = pagetitle
  page_navigated = page.has_content? pagetitle 
  if (page_navigated)
    puts "navigated to the page: " + @pagetitle
    puts "\n"
  else
    puts "not navigated to the page: " + @pagetitle 
  end  
end

And /^the bag items should be as same as added$/ do
  
  #Read the items from item container
  item_container_count = page.all(:xpath, '//*[@id="itemsContainer"]').length
  i = 1
  itemmatchflag = 1
  while (i <= item_container_count)
    
    k = i * 2
    kloc = k.to_s()
    item_container_prod_name = page.find(:xpath, "//*[@id='itemsContainer']/div[#{kloc}]/div[@class='colItem']/span[@class='itemDescription']/div/a").text
    item_container_prod_id = page.find(:xpath, "//*[@id='itemsContainer']/div[#{kloc}]/div[@class='colItem']/span[@class='itemDescription']/span[@class='itemWebId']/span[@class='valWebId']").text
    
    if (page.has_xpath?("//*[@id='itemsContainer']/div[#{k}]/div[@class='colPrice']/div[@class='bagLowestPrice']"))
      item_container_price = page.find(:xpath, "//*[@id='itemsContainer']/div[#{kloc}]/div[@class='colPrice']/div[@class='bagLowestPrice']").text
    else
      item_container_price = page.find(:xpath, "//*[@id='itemsContainer']/div[#{kloc}]/div[@class='colPrice']/div[@class='bagItemPrice']").text
    end    
    #Check if prod id matches
    itemA = @itemsaddedArray[i].split(";")
    if (item_container_prod_id != itemA[0] || item_container_prod_name != itemA[1] || item_container_price.index(itemA[2]) == nil)
       itemmatchflag = 0
    end    
    i = i + 1  
  end
  
  if (itemmatchflag == 1)
    puts "all items are matching as added"
    puts "\n"
  else
    puts "items are not matching as added"
    puts "\n"
  end
end

When /^I click check out without profile button$/ do
  page.find(:xpath, '//*[@id="withoutProfileButton"]/input').click
  puts "Clicked check out with out profile button"
  puts "\n"
end

And /^I click the continue check out button$/ do
  if (page.has_xpath?('//*[@id="continueCheckout"]'))
   page.find(:xpath, '//*[@id="continueCheckout"]').click
  else
   page.find(:xpath, '//*[@id="bag_buttons"]/img[@class="buttonSubmitBorders"]').click
  end 
  puts "clicked continue checkout button"
  puts "\n"
end

And /^the page should be secured$/ do
  browser = Capybara.current_session
  curr_url = browser.current_url
  if (curr_url.index("https") != nil)
    puts "it is secured page - #{@pagetitle}"
  else
    puts "it is not secured page - #{@pagetitle}"
  end
  puts "\n"
end

And /^I should see the bag id and order summary details$/ do
  if page.has_xpath?('//*[@class="orderSummary_bagid"]')
    bagId = page.find(:xpath, '//*[@class="orderSummary_bagid"]').text
    puts "Found bag id and order summary in the page - #{@pagetitle}, #{bagId}"
  else
    puts "Did not found the bag id in the page - #{@pagetitle}"      
  end  
  puts "\n"
end

When /^I click the button continue check out button with out giving shipping info$/ do
  if (page.has_xpath?('//*[@id="continueCheckout"]'))
   page.find(:xpath, '//*[@id="continueCheckout"]').click
  else
   page.find(:xpath, '//*[@id="bag_buttons"]/img[@class="buttonSubmitBorders"]').click
  end 
  puts "clicked checkout button with out entering the shipping info"
  puts "\n"
end

Then /^I should see the shipping page field validation error$/ do
  #Verify the error message on shiping page
  if (@cathierarchy.index("Gift Cards") != nil && @pagetitle.index("shipping address") != nil)
  else  
  if (page.has_xpath?("//*[@class='errorTextWithoutIcon']"))
    errorMessage = page.find(:xpath, '//*[@class="generalError"]/span').text
    puts "Found the error message #{errorMessage} as there is no shipping info entered"
  else
    puts "No error message found when checking out with out entering shipping adrress"
  end
  puts "\n"
  end
end

When /^I enter the valid shipping details$/ do
  @shipfirstname = "Dilip"
  @shiplastname = "Maadhavan"
  @shipaddress1 = "Market Street"
  @shipcity = "San Francisco"
  @shipzipcode = "94105"
  
  fill_in 'firstname', :with => @shipfirstname
  fill_in 'lastname', :with => @shiplastname
  fill_in 'address1', :with => @shipaddress1
  fill_in 'city', :with => @shipcity
  select('California', :from => 'state')
  fill_in 'zipcode', :with => @shipzipcode
  fill_in 'areacode', :with => "123"
  fill_in 'exchangeNbr', :with => "456"
  fill_in 'subscriberNbr', :with => "7890"
  puts "Entered the valid shipping address"
  puts "\n"
end

And /^I click back one step button$/ do
  page.find(:xpath, '//*[@alt="BACK ONE STEP"]').click
  puts "Clicked back one step button"
  puts "\n"
end

When /^I click the save and continue with out entering payment info$/ do
  page.find(:xpath, '//*[@alt="SAVE & CONTINUE"]').click
  puts "clicked save and continue button with out entering payment info"
  puts "\n"
end

Then /^I should see the payment page field validation errors$/ do
  #Verify the error message on shiping page
  if (page.has_xpath?('//*[@class="errorTextWithoutIcon"]'))
    errorMessage = page.find(:xpath, '//*[@class="errorTextWithoutIcon"]').text
    puts "Found the error message #{errorMessage} as there is no payment info entered"
  else
    puts "No error message found when checking out with out entering payment info"
  end  
  puts "\n"
end

When /^I select the card type as "([^"]*)"$/ do |cctype|
  select(cctype, :from => 'creditCardType')
end

And /^I enter the card number as "([^"]*)"$/ do |ccnumber|
    fill_in 'cardNumber', :with => ccnumber
end

And /^I select exp month as "([^"]*)"$/ do |expmonth|
  select(expmonth, :from => 'expiration')
end

And /^I select the exp year as "([^"]*)"$/ do |expyear|
  page.select expyear, :from => 'newCreditCard.creditCardExpiryYear'
  puts "Entered CC details"
  puts "\n"
end

And /^I enter the secret code as "([^"]*)"$/ do |seccode|
  fill_in 'abc', :with => seccode  
end

And /^I check the billing address as same my shipping address$/ do
  check('useShipping')
  puts "Selected billing address as shipping address"
  puts "\n"
end

Then /^I should see my shipping address as my billing address$/ do
  #Verify that shipping billing address as same as shipping address 
  if (page.find(:xpath, '//*[@id="firstName"]').value == "Dilip" && page.find(:xpath, '//*[@id="lastName"]').value == "Maadhavan" && page.find(:xpath, '//*[@id="addressLine1"]').value == "Market Street" && page.find(:xpath, '//*[@id="city"]').value == "San Francisco" && page.find(:xpath, '//*[@id="zipCode"]').value == "94105")
    puts "Billing address matches as shipping address"
    puts "\n"
  end              
end

And /^I enter the contact information$/ do
  fill_in 'contactEmail', :with => 'nagaraj@macys.com'
  fill_in 'verifyEmail', :with => 'nagaraj@macys.com'
  puts "Entered the contact information"
  puts "\n"
end

When /^I click the save and continue button$/ do
  page.find(:xpath, '//*[@alt="SAVE & CONTINUE"]').click
  puts "clicked save and continue button"
  puts "\n"
end

And /^the shipping address should be correct in order review page$/ do 
  order_review_page_ship_address = page.find(:xpath, '//*[@class="checkoutContainer shipAddr"]').text
  if (order_review_page_ship_address.index(@shipfirstname) != nil && order_review_page_ship_address.index(@shiplastname) != nil && order_review_page_ship_address.index(@shipaddress1) != nil && order_review_page_ship_address.index(@shipcity) != nil && order_review_page_ship_address.index(@shipzipcode) != nil)
    puts "shipping address is as expected in order review page"
  else
    puts "shipping address is not as expected in order review page"
  end
  puts "\n"
end

And /^the billing address page should be correct in the order review page$/ do
  order_review_page_billing_address = page.find(:xpath, '//*[@class="OrderReview_billingAddress"]/div').text
  if (order_review_page_billing_address.index(@shipfirstname) != nil && order_review_page_billing_address.index(@shiplastname) != nil && order_review_page_billing_address.index(@shipaddress1) != nil && order_review_page_billing_address.index(@shipcity) != nil && order_review_page_billing_address.index(@shipzipcode) != nil)
    puts "billing address is as expected in order review page"
  else
    puts "billing address is not as expected in order review page"
  end
  puts "\n"
end

And /^I click the edit shipping address link$/ do
  page.find(:xpath, '//*[@class="checkoutContainer shipAddr"]/a').click
  puts "clicked edit shipping address link"
  puts "\n"  
end

And /^I enter another shipping address$/ do
  @shipfirstname = "Prannesh"
  @shiplastname = "Arya"
  @shipaddress1 = "New Market Street"
  @shipcity = "New San Francisco"
  @shipzipcode = "94106"
  
  fill_in 'firstname', :with => @shipfirstname
  fill_in 'lastname', :with => @shiplastname
  fill_in 'address1', :with => @shipaddress1
  fill_in 'city', :with => @shipcity
  fill_in 'zipcode', :with => @shipzipcode
  
  puts "Entered another shipping address"
  puts "\n"
end

And /^I click the edit payment info link$/ do
  page.find(:xpath, '//*[@class="checkoutContainer BillInfo"]/a').click
  puts "clicked the payment edit link"
  puts "\n"
end

And /^I enter another contact information$/ do
  fill_in 'contactEmail', :with => 'nagaraj_new@macys.com'
  fill_in 'verifyEmail', :with => 'nagaraj_new@macys.com'
  puts "entered the contact info in the payment page"
  puts ""
end

And /^I should see the updated contact information$/ do
  order_review_page_billing_address = page.find(:xpath, '//*[@class="OrderReview_billingAddress"]/div').text
  if (order_review_page_billing_address.index("nagaraj_new@macys.com") != nil)
    puts "contact information updated after editing payment info"
  else
    puts "contact information not updated after editing payment info"
  end
end