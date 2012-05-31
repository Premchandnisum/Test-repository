def set_selenium_window_size(width, height)
  window = Capybara.current_session.driver.browser.manage.window
  window.resize_to(width, height)
end

Before do
  Capybara.register_driver :selenium do |app|
  #http://www1.pos.macys.com/posTest.html
    case ENV['BROWSER']
    when 'ie', 'IE'
      Capybara::Selenium::Driver.new(app, :browser => :ie)
    when 'ff'
      Capybara::Selenium::Driver.new(app, :browser => :ff)
    when 'chrome'
      Capybara::Selenium::Driver.new(app, :browser => :chrome)
    when 'safari'
      Capybara::Selenium::Driver.new(app, :browser => :safari)
    when 'mobile'
      Capybara::Selenium::Driver.new(app, :browser => :ff)
    else
    Capybara::Selenium::Driver.new(app, :browser => :ff)
    end
  end
  if ENV['BROWSER']=='mobile'
    set_selenium_window_size(320, 480) if Capybara.current_driver == :selenium
  end

end
