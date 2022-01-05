require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"
require "webdrivers"
require "rufo"
require "site_prism"
require "faker"
require "cpf_faker"
require "rspec"
require "roo"
require "allure-cucumber"
require_relative "helpers"
require_relative "../pages/cadastro_page.rb"
require_relative "../pages/login_page.rb"

World(Actions)
World(Helpers)

Capybara.register_driver :selenium do |driver|
  Capybara::Selenium::Driver.new(driver, :browser => :chrome)
end

Capybara.configure do
  include RSpec::Matchers
  Capybara.run_server = false
  Capybara.default_driver = :selenium_chrome_headless
  Capybara.page.driver.browser.manage.window.maximize
  Capybara.default_max_wait_time = 10
  Capybara.app_host = "https://parodify.herokuapp.com"
end

AllureCucumber.configure do |config|
  config.results_directory = "/logs"
  config.clean_results_directory = true
end
