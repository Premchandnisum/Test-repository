require 'selenium-webdriver'
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'yaml'

Capybara.run_server = false
Capybara.default_driver = :selenium
#Capybara.app_host = 'http://www.google.com'

#global variable
$itemCount = 0

