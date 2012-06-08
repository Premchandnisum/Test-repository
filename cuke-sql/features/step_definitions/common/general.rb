Given /^I have (\d+) item\(s\) in my shopping bag$/ do |quantity|
  visit('/')
  
  # if I have 0 items, then add items to cart
  
  find(:id, "itemInfo").text.should == "Your bag (0)"
  
  # Select a Category
  page.all(:xpath, './/*[@id="globalNav"]/ul/li[*]/a/img').sample.click
  
  # Select a facet
  #  .//*[@id='localNavigationContainer']/ul/li[1]/ul/li[2]/a
  #  .//*[@id='localNavigationContainer']/ul/li[2]/ul/li[1]/a
  #  .//*[@id='localNavigationContainer']/ul/li[1]/ul/li/a
  page.all(:xpath, './/*[@id="localNavigationContainer"]/ul/li[*]/ul/li[*]/a').sample.click
  page.should have_xpath('.//*[@id="macysGlobalLayout"]')
  within(:id, "macysGlobalLayout") do
    puts page.all(:xpath, './/*[@id="fullColorOverlay*"]').length
  end
end


Given /^I am on the Macy's home page$/ do
#  Load Configuration File
  if !(@fileLoaded)
    puts "File Instance Not Exists"
    loadConfig()
  else    
    puts "File Instance Exists"
  end
  @env_current = get_env()
  #  Load Configuration File

#  Grab Variables From File
  @url = @navigation_file['url']
  visit("#{@url}")
  @browser = Capybara.current_session.driver.browser
  @browser.manage.delete_all_cookies
end

def loadConfig()
  @fileLoaded=false
  config_file = "config/#{ENV['ENVIRONMENT']}/navigation.yml"
  config_data_file = "features/step_definitions/checkout/Config/checkoutobjects.yml"
  @config_data_file=YAML::load(File.open(config_data_file))
  @navigation_file = YAML::load(File.open(config_file))
  @fileLoaded=true  
end