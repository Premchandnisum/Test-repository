Given /^when I am on the site mode category splash page with id "([^"]*)" and channel "([^"]*)"$/ do |
category, channel |
  case channel
  when 'registry'
    visit ("http://www.macys.com/shop/registry/wedding/mens?id=#{category}")
  else
    visit ("http://www.macys.com/shop/mens?id=#{category}")
  end
  
end 

When /^I click on any link within the coordinates "([^"]*)" and ad region "([^"]*)" with media type$/ do |coordinates, adregion| 
  page.find(:xpath, "//div[@id='mainAdPoolFullWide']/map/area[1]").click

end 

Then /^append cm_sp to the href value on the link with the format of "([^"]*)"$/ do |url_rest| 
  wait_until_entity_exists("text", 'items', 15, "") 
  browser = Capybara.current_session
  curr_url = browser.current_url
  loc = curr_url.index("cm_sp")
  if (loc == nil)
    raise "cm_sp is missing in the url"
  else
    str_rest = curr_url[loc..-1]
    puts str_rest
    puts url_rest
    if url_rest == str_rest
      puts "Test passed"
    else
      raise 'URL mismatch for cm_sp'
    end
  end

end 

Then /^it is not an error page$/ do 
  pending # express the regexp above with the code you wish you had 
end 
