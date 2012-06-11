# ***************************  Constants ****************************

# ***************************  Functions ****************************

def get_env()
  return "/#{ENV['ENVIRONMENT']}"
end

def sign_in(email, magicword)
  click_link('sign in')
  fill_in('email', :with => email)
  fill_in('password', :with => magicword)
  page.find(:xpath, "//input[@name='accountSignIn']").click
end

def wait_until_entity_exists(type, element, timeout, other1)
  ctr1 = 0
  found = false
  while (!found && ctr1 < timeout)
    sleep 1
    ctr1 += 1
    case type
    when 'text'
      if page.has_content?(element)
      found = true
      end
    when 'input_id'
      if page.find(:xpath, "//input[@id='#{element}']")
      found = true
      end
    when 'img_title'
      if page.find(:xpath, "//img[@title='#{element}']")
      found = true
      end
    when 'img_id'
      if page.find(:xpath, "//img[id='#{element}']")
      found = true
      end
    when 'path'
      if page.find(:xpath, element)
      found = true
      end

    end
  end
  if found == false
    raise "Count not find the item: " + element + ". Timed out"
  end
end

def wait_until_value_exists(type, element, timeout, other1)
  ctr1 = 0
  found = false
  while (!found && ctr1 < timeout)
    sleep 1
    ctr1 += 1
    case type
    when 'input_id'
      if page.find(:xpath, "//input[@id='#{element}']").value != nil
      found = true
      end
    end
  end
  if found == false
    raise "Count not find the item: " + element + ". Timed out"
  end
end

def random_number
  random_number_1 = rand(499999)
  random_number_string =  random_number_1.to_s.rjust(6,'0')
  return random_number_string
end

def is_page_secured
  browser = Capybara.current_session
  curr_url = browser.current_url
  if (curr_url.index("https") == nil)
    raise "Page is not secured page"
  end
end

def loadurlConfig()
  @urlfileLoad=false
  config_file = "config/#{ENV['ENVIRONMENT']}/navigation.yml"
  @navigation_file = YAML::load(File.open(config_file))
  @urlfileLoad=true  
end

def callurlconfig()
  if !(@urlfileLoad)
    puts "File Instance Not Exists"
    loadurlConfig()
  end
end

def selectcolor()
  @colorContainer = @config_data_file['pdp_colorContainer']
   if(page.has_xpath?(@colorContainer))
    puts "Colors exist for this product"
  end
  @color = @config_data_file['pdp_color']
  if(page.has_xpath?(@color))
    page.find(:xpath,@color).click
  end
end

def selectsize()
  @available_size = @config_data_file['pdp_size_available']
  if(page.has_xpath?(@available_size))
    size_names = Array.new
    page.all(:xpath, @available_size).each do |sizename|
      sizenames =  sizename['title']
      size_names << sizenames
    end
    puts "**************size names********************"
    puts size_names
    count = size_names.size
    random=rand(1..count)
    page.find(:xpath,@available_size+"['#{random}']/span").click
  end
end

# ***************************  Steps ****************************

When /^I debug_sleep for (\d+) seconds$/ do |seconds|
  puts 'Debug sleeping......'
  sleep seconds.to_i
end

