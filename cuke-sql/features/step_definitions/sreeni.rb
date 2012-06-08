# Date coded: 05/04/12, and month of May 2012

# Author: Sreenivas Bud



When /^sreeniI add item (\d+) to bag$/ do |number|
  i_number = number.to_i
  i_ctr = 0
  product_list = @ids_data_file['product_list']
  #page.find(:xpath, "//div[@id='#{product_list}']/div[#{number}]/div[4]/img").click
  page.all(:xpath, "//div[@id='#{product_list}']/div").each do |element|
    if !element['class'].include?('hideProduct')
      element_id = element['id']
      i_ctr +=1
      if i_ctr == i_number
        page.find(:xpath, "//div[@id='#{element_id}']").find(:xpath, ".//img[@alt='add to bag']").click
        break
      end
    end 
  end
end
