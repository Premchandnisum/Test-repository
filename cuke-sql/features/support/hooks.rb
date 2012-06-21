def set_selenium_window_size(width, height)
  window = Capybara.current_session.driver.browser.manage.window
  window.resize_to(width, height)
end

Before do
  Capybara.register_driver :selenium do |app|
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
        Capybara::Selenium::Driver.new(app, :browser => :chrome)
      else
        Capybara::Selenium::Driver.new(app, :browser => :ff)
      end
    end
    if ENV['BROWSER']=='mobile'
      set_selenium_window_size(320, 480) if Capybara.current_driver == :selenium
    end

end

Before do |scenario, tags|
  @shopping_bag = Bag.new
  @log = Logger.new("cucumber.log")
  @log.debug("Start:  #{scenario.name}")
end

After do |scenario|
  @log.debug("Finish:  #{scenario.name}")
  @log.debug("Status:  #{scenario.status}")
 if scenario.failed?.should == true
    @log.debug("#{scenario.exception}")
  end
  screen_shot_and_save_page if scenario.failed?
  Capybara.reset_sessions!
end     
