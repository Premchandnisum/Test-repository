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
      if page.find(:xpath, "//img[@id='#{element}']")
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

# ***************************  Functions ****************************

When /^I debug_sleep for (\d+) seconds$/ do |seconds|
  puts 'Debug sleeping......'
  sleep seconds.to_i
end
