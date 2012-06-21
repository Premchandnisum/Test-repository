Given /^I have (\d+) items in my shopping bag$/ do |item_count|
  find(:id, "checkoutLink").text.should == "Your bag (#{item_count})"
end

When /^I add a "(.*?)" product to my shopping bag$/ do |brand|
    steps %Q{
    When I search for "#{brand}"
      And I select a product
      And I add the product to my bag
  }  

end

When /^I click checkout$/ do
  wait_until { page.find(:xpath, '//*[@class="ftButtons"]/img[@id="btnCheckout"]').visible? }
  page.find(:xpath, '//*[@class="ftButtons"]/img[@id="btnCheckout"]').click
  @log.debug("Clicked on Checkout Button")
end

Then /^I "(.*?)" see "(.*?)" for Estimated Shipping$/ do |arg1, arg2|
  case arg1
  when "should"
    page.find(:id, 'bagEstimatedShippingTotal').text.should == arg2
    @log.debug("Free Shipping Available")
  else
    page.find(:id, 'bagEstimatedShippingTotal').text.should_not == arg2
    @log.debug("Free Shipping Not Eligible")
  end
end

When /^I add qualified products for free shipping$/ do
  steps %Q{
    When I select a category
      And I select a facet
      And I select a product
      And I add the product to my bag
  }
    
end

Given /^I am on the given page$/ do
  visit('http://www1.macys.com/shop/product/american-rag-dress-sleeveless-floral-print-a-line?ID=680451&CategoryID=57569')
end

Given /^I select a size$/ do
  size = page.all(:css, ".horizontal.size")
  unless size.sample.nil?  
    size_choice = size.sample
    @log.debug("Size is #{size_choice.text}")
    size_choice.click
    @log.debug("Clicked on size")   
  end
end

When /^I decide to "(.*?)"$/ do |arg1|
  page.find(:id, 'continueShoppingButton').click
end

When /^I click on Estimated Shipping link$/ do 
  page.find(:css, '#panelPopIn_c', :visible => false) 
  page.find(:id, 'estimatedShipping').click
end

Then /^I should see the Estimated Shipping pop up$/ do |arg1|
  page.find(:css, '#panelPopIn_c', :visible => true) 
end