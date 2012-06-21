When /^I add a product to my shopping bag$/ do
  steps %Q{
    When I select a category
      And I select a facet
      And I select a product
      And I add the product to my bag
  }

end