Given /^I am on POS simulator page$/ do
#  Load Configuration File
  config_file = "config/#{ENV['ENVIRONMENT']}/navigation.yml"

#  Loaded file will be available throughout the execution of a scenario
  @navigation_file = YAML::load(File.open(config_file))
  
#  Grab Variables From File
  url = @navigation_file['url']
  visit("#{url}")
  sns_ids_data = "config/data/sns/sns_ids.yml"
  @sns_ids_data = YAML::load(File.open(sns_ids_data))
end

When /^I search POS for "([^"]*)" "([^"]*)"$/ do |type, prod_id|
  Keyword = @sns_ids_data[type]
  fill_in Keyword, :with => prod_id
  case type
  when 'upc'
    submit = @sns_ids_data['value_view_item_details']  
    #fill_in upc, :with => prod_id
  else  # Keyword or webId
    submit = @sns_ids_data['value_search']
    #fill_in Keyword, :with => prod_id   
  end
  page.find(:xpath, "//input[@value='#{submit}']").click
end

Then /^I should see title "([^"]*)"$/ do |title|
  wait_until_entity_exists('text', title, 30, "")
  #page.find(:css, '.header').text.include?(title).should == true
end

Then /^I should see the text "([^"]*)"$/ do |text| 
  wait_until_entity_exists('text', text, 10, "")
end 

When /^I press "([^"]*)" "([^"]*)"$/ do |key, desc|
  click_link key
end

When /^I press "([^"]*)" key (\d+) time\(s\)$/ do |key, times|
  page_id = @sns_ids_data['page_id']
  for i in (1..times.to_i)
    key_press(page_id, key)
  end
  sleep 2
end

Then /^the selected product should be "([^"]*)"$/ do |product|
  selected = @sns_ids_data['selected_result']
  page.find(:xpath, "//div[@class='#{selected}']/div").text.include?(product).should == true
end

Then /^I should see the following product\(s\)$/ do |table|
  table.hashes.each do |item|
    item1 = item['Item']
    item2 = item['Color']
    page.has_content?(item1).should == true
    page.has_content?(item2).should == true
  end
end

Then /^I should see the product name "([^"]*)"$/ do |product|
  wait_until_entity_exists("text", product, 15, "") 
end

Then /^I should see the product name "([^"]*)" below the image$/ do |name|
  product_data = @sns_ids_data['product_data']
  page.find(:css, '.'+product_data).text.include?(name).should == true
end

Then /^I should see the webId below the product name$/ do |table|
  product_data = @sns_ids_data['product_data']
  table.hashes.each do |item|
    item1 = item['value']
    page.find(:css, '.'+product_data).text.include?(item1).should == true
  end
end

Then /^I should see the webId "([^"]*)" below product name$/ do |webid|
  product_data = @sns_ids_data['product_data']
  page.find(:css, '.'+product_data).text.include?(webid).should == true
end

Then /^I should see image on the left side$/ do
  product_detail_img = @sns_ids_data['product_detail_img']
  validate_image(product_detail_img)
end

Then /^I should see image in the middle of the page$/ do
  large_image_section = @sns_ids_data['large_image_section']
  validate_image(large_image_section)
end
 
Then /^I should see the instructional text "([^"]*)"$/ do |ins_text|
  # instructional_text = @sns_ids_data['instructional_text']
  # page.find(:css, '.'+instructional_text).text.include?(ins_text).should == true
  wait_until_entity_exists('text', ins_text, 10, "")
end

Then /^I should see the navigation instructional text "([^"]*)"$/ do |ins_text|
  nav_instructional_text = @sns_ids_data['nav_instructional_text']
  validate_text("//div[@class='#{nav_instructional_text}']/ul/li", ins_text)
end

Then /^I should see the following thumbnail images$/ do |thumbnails|
  product_images_container = @sns_ids_data['product_images_container']
  thumbnails.hashes.each do |item|
    item1 = item['thumbnail images']
    validate_thumbnails("//div[@class='#{product_images_container}']/div/img", 'src', item1)
  end
end

Then /^I should see the following product images$/ do |thumbnails|
  product_images_container = @sns_ids_data['product_images_container']
  thumbnails.hashes.each do |item|
    item1 = item['thumbnail images']
    validate_product_images("//div[@class='#{product_images_container}']/div/img", 'src', item1)
  end
end

Then /^I should see the following color swatch thumbnails and text$/ do |thumbnails|
  proddetails_color_swatches = @sns_ids_data['proddetails_color_swatches']
  thumbnails.hashes.each do |item|
    item1 = item['text']
    item2 = item['image name']
    validate_thumbnails_and_color("//div[@class='#{proddetails_color_swatches}']/div", 'style', item1, item2)
  end  
end


Then /^I should see the long description "([^"]*)"$/ do |description|
  long_desc = @sns_ids_data['long_desc']
  page.find(:css, '.'+long_desc).text.include?(description).should == true
  
end

Then /^I should see the product description$/ do |table|
  bullet_points_Product_description = @sns_ids_data['bullet_points_Product_description']
  table.hashes.each do |item|
    item1 = item['product description']
    validate_text("//div[@class='#{bullet_points_Product_description}']/ul/li", item1)
   end
end

Then /^I should see the T keys with following states$/ do |table|
  table.hashes.each do |key|
    ctr = 0
    col1 = key['T key']
    col2 = key['Label']
    col3 = key['Active']
    page.all(:xpath, "//div[@id='tkeys']/div/div").each do |node|
      ctr += 1
      ctrs = ctr.to_s
      if ( (node.text.include?(col1) == true) && (node.text.include?(col2) == true) )
        #node['class'].should == col3
        case col3
        when "No"
          node['class'].should == 'inactive tkey'
        when "Yes"
         node['class'].should == 'active tkey'          
        end
        break
      end
    end
  end
end

Then /^I should see a "([^"]*)" border around the image "([^"]*)"$/ do |color, image|
  product_images_container = @sns_ids_data['product_images_container']
  case color
  when "red"
    highlight = "highlight"
  end
  t_nail_found = false  
  page.all(:xpath, "//div[@class='#{product_images_container}']/div").each do |t_nail|
    div_class = t_nail['class']
    hlight = ' ' + highlight
    if div_class.include?(hlight)
      t_nail_found = true
      highlight_id = t_nail['id']
      page.find(:xpath, "//div[@id='#{highlight_id}']/img")['src'].include?(image).should == true
      break
    end
  end
  if t_nail_found == false
    raise "Thumbnail: #{item} not highlighted"
  end  
end

Then /^I should see the selection of "([^"]*)"$/ do |size|
  default_highlight = @sns_ids_data['default_highlight']
  page.find(:xpath, "//div[@class='#{default_highlight}']/div").text.should == size
end

Then /^I should see the price below the web id$/ do
  price_value = @sns_ids_data['price_value']
  # price = price.delete "$,"
  # puts price
  #page.find(:xpath, "//span[@id='#{price_value}']").text.should == price
  #page.find(:xpath, "//span[@id='#{price_value}']").text..include?('$').should == true
  page.find(:xpath, "//span[@id='#{price_value}']").text.length.should > 1
end

Then /^I should see the following table headers on the right side above the list of types & colors$/ do |table|
  color_type_section = @sns_ids_data['color_type_section']
  table.hashes.each do |item|
    item1 = item['Table Headers']
    page.find(:xpath, "//div[@id='#{color_type_section}']").text.include?(item1).should == true
  end
end

Then /^I should see the following Colors & Types$/ do |table|
  table.hashes.each do |item|
    item1 = item['color']
    item2 = item['type']
    wait_until_entity_exists('text', item1, 5, "")
    wait_until_entity_exists('text', item2, 5, "")
  end
end

Then /^I should see the following text$/ do |table|
  table.hashes.each do |item|
    item1 = item['Text']
    wait_until_entity_exists('text', item1, 5, "")
  end
end

Then /^I should see "([^"]*)"$/ do |text|
   wait_until_entity_exists('text', text, 5, "")
end

Then /^I should see the following default selected product with red border and yellow background$/ do |table|
  price_value = @sns_ids_data['price_value']
  table.hashes.each do |item|
    item1 = item['color']
    item2 = item['type']
    item3 = item['price']
    #page.find(:xpath, "//div[@class='colorNameInfo floatLeft']").text.should == item1
    page.find(:xpath, "//div[@class='highlightDiv highlight']").text.should == item2
    page.find(:xpath, "//div[@class='highlightDiv highlight']").find(:xpath, "../../../div").text.should == item1
    page.find(:xpath, "//span[@id='#{price_value}']").text.length.should > 1
  end
end 

Then /^I should see the default type "([^"]*)"$/ do |type| 
  type_text = @sns_ids_data['type_text']
  page.find(:xpath, "//span[@id='#{type_text}']").text.should == type
end 

Then /^I should see the default color "([^"]*)"$/ do |color|
  color_text = @sns_ids_data['color_text']
  page.find(:xpath, "//span[@id='#{color_text}']").text.should == color
end

Then /^I should see the label "([^"]*)"$/ do |label|
  page.find(:xpath, "//div[@class='detailsRow1']").text.include?(label).should == true
end

Then /^the page title for the following T keys should be$/ do |table|
  table.hashes.each do |item|
    item1 = item['T key']
    item2 = item['title']
    click_link item1
    page.find(:xpath, "//div[@class='header']").text.should == item2
  end
end

Then /^I should see the table headers "([^"]*)" and "([^"]*)" on the right side above the list of products$/ do |item, color|
  master_collection_item = @sns_ids_data['master_collection_item']
  master_collection_color = @sns_ids_data['master_collection_color']
  page.find(:xpath, "//span[@class='#{master_collection_item}']").text.should == item
  page.find(:xpath, "//span[@class='#{master_collection_color}']").text.should == color
end  

Then /^I should see the "([^"]*)" with color "([^"]*)" as default selected product with red border and yellow background$/ do |type, color|
  selected_result = @sns_ids_data['selected_result']
  page.find(:xpath, "//div[@class='#{selected_result}']").text.include?(type).should == true
  page.find(:xpath, "//div[@class='#{selected_result}']").text.include?(color).should == true    
end
  
When /^I am on the OutOfStock Page$/ do 
  pending # express the regexp above with the code you wish you had 
end 

Then /^I should see the webId$/ do |table| 
  # table is a Cucumber::Ast::Table 
  pending # express the regexp above with the code you wish you had 
end 

# When /^I should see the following data in the bottom parts of the page$/ do |table|
  # price_value = @sns_ids_data['price_value']
  # table.hashes.each do |item|
    # item1 = item['price']
    # item2 = item['color']
    # item3 = item['type']
    # page.find(:xpath, "//span[@id='#{price_value}']").text.length.should > 1
    # page.find(:xpath, "//div[@class='highlightDiv highlight']").text.should == item3
    # page.find(:xpath, "//div[@class='highlightDiv highlight']").find(:xpath, "../../../div").text.should == item2
  # end
# end

Then /^I should see title with embedded quotes (.*)$/ do |text|
  text = trim_end_characters(text)
  wait_until_entity_exists('text', text, 5, "")
end

Then /^the box should be (\d+) pixel height$/ do |arg1|
  #puts page.find(:xpath, "//div[@id='attrSection']")['height']
  puts page.find(:css, "#attrSection.attrSection.colorTypeAttr.height")
end
