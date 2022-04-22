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

Capybara.register_driver :chorme do |app|
  caps = Selenium::WebDriver::Remote::Capabilities.chrome(
    "goog:chromeOptions" => {
      "args" => ["--headless", "--disable-site-isolation-trials", "--disable-gpu"],
      "excludeSwitches" => ["enable-logging"],
    },
  )
  Capybara::Selenium::Driver.new(app, :browser => :chrome, :capabilities => caps)
end

Capybara.configure do |config|
  include RSpec::Matchers
  config.run_server = false
  config.default_driver = :chorme
  config.default_max_wait_time = 20
  config.app_host = "https://parodify.herokuapp.com"
end

AllureCucumber.configure do |config|
  config.results_directory = "/logs"
  config.clean_results_directory = true
end
