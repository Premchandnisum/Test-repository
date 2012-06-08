Given /^I am on POS simulator page$/ do
#  Load Configuration File
  config_file = "config/#{ENV['ENVIRONMENT']}/navigation.yml"

#  Loaded file will be available throughout the execution of a scenario
  @navigation_file = YAML::load(File.open(config_file))
  
#  Grab Variables From File
  url = @navigation_file['url_sns1']
  puts url
  visit("#{url}")
  #sleep 10 
end

When /^I search for webId "([^"]*)"$/ do |prod_id|
  fill_in 'Keyword', :with => prod_id
  page.find(:xpath, "//input[@type='submit']").click
end


Then /^I should see title "([^"]*)"$/ do |title|
  wait_until_entity_exists('text', title, 5, "")
end

When /^I press "([^"]*)"$/ do |key|
    browser = Capybara.current_session
    #browser.keydown(id, "\\13")
    #browser.key_down_native(13)
        #browser.native.send_key(:enter)
  page.find(:xpath, "//div[@class='chooseSize topMargin5px']").click

end


Then /^I should see the following product$/ do |table|
  table.hashes.each do |item|
    puts item['Item']
    item1 = item['Item']
    puts item['Color']
    item2 = item['Color']
     puts "______________"
    puts page.has_content?(item1)
    puts page.has_content?(item2)
    page.has_content?(item1).should == true
    page.has_content?(item2).should == true
 
  end
end



