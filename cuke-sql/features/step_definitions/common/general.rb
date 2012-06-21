Given /^I am on the Macy's home page$/ do
# Load Configuration File
  config_file = "config/#{ENV['ENVIRONMENT']}/navigation.yml"
  @env_current = get_env()

# Loaded file will be available throughout the execution of a scenario
  @navigation_file = YAML::load(File.open(config_file))
#  fetchcheckoutwebelements
  
# Grab Variables From File
  @url = @navigation_file['url']
  visit("#{@url}")
  puts current_url
  @log.debug("Opened #{@url}")
end

Given /^I have (\d+) item\(s\) in my shopping bag$/ do |quantity|
  find(:id, "itemInfo").text.should == "Your bag (0)"
end


# Given /^I am on the Macy's home page$/ do
# #  Load Configuration File
  # callurlconfig()
  # @env_current = get_env()
# #  Grab Variables From File0100000000
  # @url = @navigation_file['url']
  # visit("#{@url}")
  # @browser = Capybara.current_session.driver.browser
  # @browser.manage.delete_all_cookies
# end

When /^I search for "(.*?)"$/ do |term|

  begin
    fill_in 'Keyword', :with => "#{term}"
  rescue
    fill_in 'keyword', :with => "#{term}"
  end
  begin
    click_button 'KEYWORD_GO_BUTTON'
  rescue
    click_button 'subnavSearchSubmit'
  end
  
  @log.debug("Searching for #{term}")
end

When /^I select a category$/ do
  categories = page.all(:css, '.globalNavigationBar>li>a')
  selection = categories.sample
  @log.debug("Category Visited: #{selection[:href]}")
  selection.click
end

When /^I select a facet$/ do
  facet = page.all(:xpath, './/*[@id="localNavigationContainer"]/ul/li[*]/ul/li[*]/a')
  selection = facet.sample
  @log.debug("Selected Facet: #{selection[:href]}")
  selection.click
  
end

When /^I select a product$/ do
  product = page.all(:css, '.productThumb.productThumbBorder>a>img')
  product.sample.click
end

When /^I add the product to my bag$/ do
  wait_until { page.find(:css, '.productID').visible? }
  @webid = find(:css, '.productID').text
  @webid.delete! "Web ID: "
  @log.debug("#{@webid}")
  if page.has_css?("#sizesListDiv#{@webid}")
    page.all(:class, "horizontal_size").sample.click
  end
  addtobag = "addToBagButton#{@webid}"
  page.all(:id, "#{addtobag}").sample.click
end


When /^I sort by price the product list, "([^"]*)"$/ do |price_option|
case
when "High To Low"
  begin
    select("Priced high to low", :from => 'sortOption')
  rescue
    select("Price: High to Low", :from => 'sortOption')
  end
end

end

Then /^I should see the item in my cart$/ do
  page.all(:css,".valWebId").include?("#{@webid}")
end

When /^I select the facet "(.*?)"$/ do |arg1|
  click_link("#{arg1}") # express the regexp above with the code you wish you had
end

Then /^I should the search results page with the search title for "([^"]*)"$/ do  |search_term|

  begin
    result_title = find(:css, '.searchtitle').text
    array = result_title.partition("#{search_term}")
    array[1].should == search_term
  rescue
    page.should_not have_content(" Oops! We're experiencing a technical problem. ")
    url_search = search_term.gsub(/ /, '-')
    if ((current_url.include? url_search) == true)
      @log.debug("Landed On A Splash Page")
    end       
  end
end

Given /^I have categories available to select$/ do
  available_categories = page.all(:css, '.globalNavigationBar>li>a>img')
  available_categories.should_not be_nil
end

When /^I select every category$/ do
  menu = page.all(:css, '.globalNavigationBar>li>a')
  nav_menu = Array.new
  menu.each do |navigation|
    nav_menu << navigation[:href]
  end
  nav_menu.each do |navigation|
    page.should_not have_content("Oops! We're experiencing a technical problem. ")
    visit("#{navigation}")
    page.find(:css, '.globalNavigationBar>li>a>img')
    current_url.should == navigation  
  end
  @Every_Category = "Page Exists"
end

Then /^every category should have a landing page$/ do
  @Every_Category.should == "Page Exists"
end

Then /^I should see a list of products$/ do
  page.find(:css, '.hd.errorMsgPanelHd', :visible => false)
  begin
    page.should have_css("#thumbnails")
  rescue
    page.should have_css(".imageLink.productThumbnailLink.absolutecrossfade")
  rescue
    if (  page.find(:css, '.hd.errorMsgPanelHd', :visible => false) )
      steps %Q{
      When I select a category
        And I select a facet
      }
    else
      (current_url.include? "campaign")
      steps %Q{
        When I select a category
          And I select a facet
        }
    end
  end
end