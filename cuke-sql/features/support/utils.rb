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
        if page.find(:xpath, "//img[@id='#{element}']")
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

def key_press(id, key)
  key = key.upcase
  case key
    when 'ENTER'
      keycode = 13
    when 'LEFT ARROW'
      keycode = 37
    when 'RIGHT ARROW'
      keycode = 39
    when 'UP ARROW'
      keycode = 38
    when 'DOWN ARROW'
      keycode = 40
    end
  browser = Capybara.current_session
  browser.execute_script('event = document.createEvent("KeyboardEvent");')
  browser.execute_script('event.initKeyEvent("keydown", true, false, document.window, false, false, false, false, ' + keycode.to_s + ', 0)')
  browser.execute_script("document.getElementById('#{id}').dispatchEvent(event)")
end

def validate_thumbnails(path, attribute, item)
  t_nail_found = false  
  page.all(:xpath, path).each do |t_nail|
    src_url = t_nail[attribute]
    if src_url.include?(item)
      t_nail_found = true
      break
    end
  end
  if t_nail_found == false
    raise "Thumbnail: #{item} not found"
  end  
end

def validate_thumbnails_and_color(path, attribute, color, thumbnail)
  t_nail_found = false  
  page.all(:xpath, path).each do |t_nail|
    div_id = t_nail['id']
    style_url = page.find(:xpath, "//div[@id='#{div_id}']/img")[attribute]
    if style_url.include?(thumbnail)
      t_nail_found = true
      page.find(:xpath, "//div[@id='#{div_id}']/div").text.should == color
      break
    end
  end
  if t_nail_found == false
    raise "Thumbnail: #{thumbnail} not found"
  end  
end

def validate_text(path, item)
  item_found = false  
  page.all(:xpath, path).each do |element|
    iter_item = element.text
    if iter_item.include?(item)
      item_found = true
      break
    end
  end
  if item_found == false
    raise "Text: #{item} not found"
  end  
end

def fetchcheckoutwebelements
  #  Load Configuration File
  config_data_file = "config/data/qa/newcheckoutconfig.yml"
  @config_data_file = YAML::load(File.open(config_data_file))
  #@navigation_file = YAML::load(File.open(@navigation_file))

  #  Loaded file will be available throughout the execution of a scenario
  @pdp_add_to_bag_btn = @config_data_file['pdp_add_to_bag_btn']
  @pdp_atb_continue_checkout_btn = @config_data_file['pdp_atb_continue_checkout_btn']
  @shopping_bag_page_url = @config_data_file['shopping_bag_page_url']
  @shopping_bag_page_continue_checkout_btn = @config_data_file['shopping_bag_page_continue_checkout_btn']
  @shopping_bag_page_continue_checkout_btn = @config_data_file['shopping_bag_page_continue_checkout_btn']
  @shopping_bag_page_empty_error_msg = @config_data_file['shopping_bag_page_empty_error_msg']
  @pdp_update_btn = @config_data_file['pdp_update_btn']
  @order_total = @config_data_file['order_total']
  @order_number = @config_data_file['order_number']
  @order_total_in_shopping_bag = @config_data_file['shopping_bag_order_total_in_shopping_bag']
  @order_total_currency_in_shopping_bag = @config_data_file['shopping_bag_order_total_currency_in_shopping_bag']
  @order_total_in_mini_bag_on_shipping_page = @config_data_file['mini_bag_order_total_in_mini_bag_on_shipping_page']
  @merchandise_total_in_shipping_page = @config_data_file['shipping_merchandise_total_in_shipping_page']
  @flat_tax_in_shipping_page = @config_data_file['shipping_flat_tax_in_shipping_page']
  @bag_id_in_shopping_bag = @config_data_file['shopping_bag_bag_id_in_shopping_bag']
  @bag_id_in_checkout_mini_bag = @config_data_file['mini_bag_bag_id_in_checkout_mini_bag']
  @item_count_in_shopping_bag = @config_data_file['shopping_bag_item_count_in_shopping_bag']
  @item_count_in_mini_bag = @config_data_file['mini_bag_item_count']
  @mini_bag_shopping_bag_icon = @config_data_file['mini_bag_shopping_bag_icon']
  @international_home_page = @config_data_file['international_home_page']
  @promo_code = @config_data_file['mini_bag_promo_code']
  @apply_promo_code = @config_data_file['mini_bag_apply_promo_code']
  @remove_promo_code = @config_data_file['mini_bag_remove_promo_code']
  @macys_logo = @config_data_file['macys_logo']
  @footer_shopwithconfidence_eassyretuns = @config_data_file['footer_shopwithconfidence_eassyretuns']
  @footer_shopwithconfidence_secureshopping = @config_data_file['footer_shopwithconfidence_secureshopping']
  @footer_shopwithconfidence_privacypolicy = @config_data_file['footer_shopwithconfidence_privacypolicy']
  @footer_shopwithconfidence_shippingpolicy = @config_data_file['footer_shopwithconfidence_shippingpolicy']
  @header_chat = @config_data_file['header_chat']
  @header_clicktocall = @config_data_file['header_clicktocall']
  @shipping_surcharge_amount = @config_data_file['mini_bga_shipping_surcharge_amount']
  @mini_bag_personalized_fee_amount = @config_data_file['mini_bag_personalized_fee_amount']
  @mini_bag_sales_tax_amount = @config_data_file['mini_bag_sales_tax_amount']
  @mini_bag_promotion_description = @config_data_file['mini_bag_promotion_description']
  @mini_bag_promotion_price = @config_data_file['mini_bag_promotion_price']
  @amount = @config_data_file['amount']
  @email = @config_data_file['email']

  @checkoutsignin_page_title = @config_data_file['checkout_signin_page_title']
  @expectedshipping_page_title = @config_data_file['checkout_shipping_page_title']
  @checkout_without_profile_btn = @config_data_file['checkout_without_profile_btn']

  @merchandise_total_in_shipping_page = @config_data_file['shipping_merchandise_total_in_shipping_page']
  @shippingMethod = @config_data_file['shipping_shippingMethod']
  @everydayShippingMethod = @config_data_file['shipping_everydayShippingMethod']
  @gift_option_yes = @config_data_file['gift_option_yes']
  @gift_message_checkbox = @config_data_file['gift_message_checkbox']
  @gift_message_textfield = @config_data_file['gift_message_textfield']
  @gift_receipt = @config_data_file['gift_receipt']
  @shipping_first_name = @config_data_file['shipping_first_name']
  @shipping_last_name = @config_data_file['shipping_last_name']
  @shipping_address_1 = @config_data_file['shipping_address_1']
  @shipping_address_2 = @config_data_file['shipping_address_2']
  @shipping_city = @config_data_file['shipping_city']
  @shipping_state = @config_data_file['shipping_state']
  @shipping_state_select = @config_data_file['shipping_state_select']
  @shipping_zipcode = @config_data_file['shipping_zipcode']
  @shipping_area_code = @config_data_file['shipping_area_code']
  @shipping_exchange_nbr = @config_data_file['shipping_exchange_nbr']
  @shipping_subscriber_nbr = @config_data_file['shipping_subscriber_nbr']
  @shipping_continue_checkout_btn = @config_data_file['shipping_continue_checkout_btn']
  @shipping_international_shipping_link = @config_data_file['shipping_international_shipping_link']
  @gift_option_no = @config_data_file['gift_option_no']
  @shipping_page_url = @config_data_file['checkout_shipping_page_url']
  @shippingFirstNameValidationMessage=@config_data_file['shippingFirstNameValidationMessage']
  @payment_page_url = @config_data_file['checkout_payment_page_url']
  @shipping_disabled_premium_shipping_method = @config_data_file['shipping_disabled_premium_shipping_method']
  @shipping_disabled_express_shipping_method = @config_data_file['shipping_disabled_express_shipping_method']

  @new_shipping_firstname = @config_data_file['new_shipping_firstname']
  @new_shipping_lastname = @config_data_file['new_shipping_lastname']
  @new_shipping_address1 = @config_data_file['new_shipping_address1']
  @new_shipping_city = @config_data_file['new_shipping_city']
  @new_shipping_state = @config_data_file['new_shipping_state']
  @new_shipping_zip_code = @config_data_file['new_shipping_zip_code']
  @new_shipping_area_code = @config_data_file['new_shipping_area_code']
  @new_shipping_exchange_code = @config_data_file['new_shipping_exchange_code']
  @new_shipping_subscriber_code = @config_data_file['new_shipping_subscriber_code']
  @order_review_edit_shipping_details_btn=@config_data_file['order_review_edit_shipping_details_btn']
  @order_review_edit_payment_details_btn=@config_data_file['order_review_edit_payment_details_btn']
  @order_review_edit_shipping_details_info=@config_data_file['order_review_edit_shipping_details_info']
  @order_review_edit_payment_details_info=@config_data_file['order_review_edit_payment_details_info']
  @order_review_place_order_btn=@config_data_file['order_review_place_order_btn']
  @expectedPaymentPageTitle = @config_data_file['checkout_payment_page_title']
  @expectedOrderReviewPageTitle=@config_data_file['checkout_orderreview_page_title']
  @edit_shipping_firstname = @config_data_file['enter_shipping_firstname']
  @edit_shipping_lastname = @config_data_file['edit_shipping_lastname']
  @edit_shipping_address1 = @config_data_file['edit_shipping_address1']
  @edit_shipping_city = @config_data_file['edit_shipping_city']
  @edit_shipping_state = @config_data_file['edit_shipping_state']
  @edit_shipping_zip_code = @config_data_file['edit_shipping_zip_code']
  @edit_shipping_area_code = @config_data_file['edit_shipping_area_code']
  @edit_shipping_exchange_code = @config_data_file['edit_shipping_exchange_code']
  @edit_shipping_subscriber_code = @config_data_file['edit_shipping_subscriber_code']

  @back_one_step_btn= @config_data_file['back_one_step_btn']

  @shopping_bag_id = @config_data_file['shopping_bag_id']
  @shopping_bag_promo_code_input = @config_data_file['shopping_bag_promo_code_input']
  @mini_bag_container = @config_data_file['mini_bag_container']
  @shopping_bag_merchandise_total_bag = @config_data_file['shopping_bag_merchandise_total_bag']
  @bag_id_in_checkout_mini_bag = @config_data_file['bag_id_in_checkout_mini_bag']

  @billing_credit_card_type = @config_data_file['billing_credit_card_type']
  @billing_card_number = @config_data_file['billing_card_number']
  @billing_expiration_month = @config_data_file['billing_expiration_month']
  @billing_expiration_year = @config_data_file['billing_expiration_year']
  @billing_security_code = @config_data_file['billing_security_code']
  @billing_sameasshippingaddress = @config_data_file['billing_sameasshippingaddress']
  @billing_first_name = @config_data_file['billing_first_name']
  @billing_last_name = @config_data_file['billing_last_name']
  @billing_address_1 = @config_data_file['billing_address_1']
  @billing_city = @config_data_file['billing_city']
  @billing_state = @config_data_file['billing_state']
  @billing_zipcode = @config_data_file['billing_zipcode']
  @billing_contact_emailaddress = @config_data_file['billing_contact_emailaddress']
  @billing_area_code= @config_data_file['billing_area_code']
  @billing_exchange_nbr = @config_data_file['billing_exchange_nbr']
  @billing_subscriber_nbr = @config_data_file['billing_subscriber_nbr']
  @billing_continue_checkout_btn = @config_data_file['billing_continue_checkout_btn']
  @payment_page_title = @config_data_file['payment_page_title']
  @billing_addcard_btn = @config_data_file['billing_addcard_btn']
  @billing_create_profile_checkbox = @config_data_file['billing_create_profile_checkbox']
  @billing_create_profile_emailaddress = @config_data_file['billing_create_profile_emailaddress']
  @billing_create_profile_confirmemailaddress = @config_data_file['billing_create_profile_confirmemailaddress']
  @billing_create_profile_password= @config_data_file['billing_create_profile_password']
  @billing_create_profile_confirmpassword = @config_data_file['billing_create_profile_confirmpassword']
  @billing_create_profile_birthmonth = @config_data_file['billing_create_profile_birthmonth']
  @billing_create_profile_birthday = @config_data_file['billing_create_profile_birthday']
  @billing_create_profile_birthyear = @config_data_file['billing_create_profile_birthyear']
  @billing_egc_cardnumber= @config_data_file['billing_egc_cardnumber']
  @billing_egc_captcha= @config_data_file['billing_egc_captcha']
  @billing_egc_addcard = @config_data_file['billing_egc_addcard']
  @billing_egc_newcaptcha = @config_data_file['billing_egc_newcaptcha']
  @billing_egc_captcha_image = @config_data_file['billing_egc_captcha_image']
  @payment_page_url = @config_data_file['checkout_payment_page_url']
  @payment_errorpage_url = @config_data_file['checkout_payment_errorpage_url']
  @billing_empty_security_code = @config_data_file['billing_security_code']
  @billing_egc_overlay_cancel = @config_data_file['billing_egc_overlay_cancel']
  @billing_egc_cancel = @config_data_file['billing_egc_cancel']
  @billing_new_firstname = @config_data_file['billing_new_firstname']
  @billing_new_lastname = @config_data_file['billing_new_lastname']
  @billing_new_address1 = @config_data_file['billing_new_address1']
  @billing_new_city = @config_data_file['billing_new_city']
  @billing_new_state = @config_data_file['billing_new_state']
  @billing_new_zip_code = @config_data_file['billing_new_zip_code']
  @billing_new_area_code = @config_data_file['billing_new_area_code']
  @billing_new_exchange_code = @config_data_file['billing_new_exchange_code']
  @billing_new_subscriber_code = @config_data_file['billing_new_subscriber_code']
  @billing_new_contact_emailaddress = @config_data_file['billing_new_contact_emailaddress']
  @billing_new_card_type = @config_data_file['billing_new_card_type']
  @billing_new_card_number = @config_data_file['billing_new_card_number']
  @billing_new_card_securitycode = @config_data_file['billing_new_card_securitycode']
  @billing_new_card_month = @config_data_file['billing_new_card_month']
  @billing_new_card_year = @config_data_file['billing_new_card_year']
  @order_review_contact_email = @config_data_file['order_review_contact_email']
  @order_review_phone = @config_data_file['order_review_phone']
  @order_confirmation_profile_email = @config_data_file['order_confirmation_profile_email']
  @order_confirmation_profile_shipping_address = @config_data_file['order_confirmation_profile_shipping_address']
end

def key_press(id, key)
  key = key.upcase
  case key
    when 'ENTER'
      keycode = 13
    when 'LEFT ARROW'
      keycode = 37
    when 'RIGHT ARROW'
      keycode = 39
    when 'UP ARROW'
      keycode = 38
    when 'DOWN ARROW'
      keycode = 40
    end
  browser = Capybara.current_session
  browser.execute_script('event = document.createEvent("KeyboardEvent");')
  browser.execute_script('event.initKeyEvent("keydown", true, false, document.window, false, false, false, false, ' + keycode.to_s + ', 0)')
  browser.execute_script("document.getElementById('#{id}').dispatchEvent(event)")
end

def validate_thumbnails(path, attribute, item)
  t_nail_found = false  
  page.all(:xpath, path).each do |t_nail|
    src_url = t_nail[attribute]
    if src_url.include?(item)
      t_nail_found = true
      break
    end
  end
  if t_nail_found == false
    raise "Thumbnail: #{item} not found"
  end  
end

def validate_product_images(path, attribute, item)
  t_nail_found = false  
  page.all(:xpath, path).each do |t_nail|
    src_url = t_nail[attribute]
    if src_url.include?('?') & src_url.include?('.') & src_url.include?('image')
      t_nail_found = true
      break
    end
  end
  if t_nail_found == false
    raise "Thumbnail: #{item} not found"
  end  
end

def validate_thumbnails_and_color(path, attribute, color, thumbnail)
  t_nail_found = false  
 page.all(:xpath, path).each do |t_nail|
    div_id = t_nail['id']
    style_url = page.find(:xpath, "//div[@id='#{div_id}']/img")[attribute]
    if style_url.include?(thumbnail)
      t_nail_found = true
      page.find(:xpath, "//div[@id='#{div_id}']/div").text.should == color
      break
    end
  end
  if t_nail_found == false
    raise "Thumbnail: #{thumbnail} not found"
  end  
end

def validate_text(path, item)
  item_found = false  
  page.all(:xpath, path).each do |element|
    iter_item = element.text
    if iter_item.include?(item)
      item_found = true
      break
    end
  end
  if item_found == false
    raise "Text: #{item} not found"
  end  
end

def trim_end_characters(phrase)
  return phrase[1,phrase.length-2] 
end

def validate_image(div_id)
  src_string = page.find(:xpath, ".//div[@class='#{div_id}']/img")['src']
  src_string.include?('image').should == true
  src_string.include?('.').should == true
  src_string.include?('?').should == true
end 

# ***************************  Steps ****************************

When /^I debug_sleep for (\d+) seconds$/ do |seconds|
  puts 'Debug sleeping......'
  sleep seconds.to_i
end
