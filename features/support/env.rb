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

Capybara.register_driver :chrome_custom do |app|
  Capybara::Selenium::Driver.new app,
    browser: :chrome,
    clear_session_storage: true,
    clear_local_storage: true,
    capabilities: [Selenium::WebDriver::Chrome::Options.new(
      args: ["--chrome", "--disable-site-isolation-trials", "--disable-gpu"],
      "excludeSwitches" => ["enable-logging"],
    )]
end

Capybara.configure do |config|
  include RSpec::Matchers
  config.run_server = false
  config.default_driver = :chrome_custom
  config.default_max_wait_time = 20
  config.app_host = "https://parodify.herokuapp.com"
end

AllureCucumber.configure do |config|
  config.results_directory = "/logs"
  config.clean_results_directory = true
end
