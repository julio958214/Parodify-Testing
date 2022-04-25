require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'rubocop'
require 'webdrivers'
require 'site_prism'
require 'faker'
require 'cpf_faker'
require 'rspec'
require 'roo'
require 'allure-cucumber'
require_relative 'helpers'
require_relative '../pages/cadastro_page'
require_relative '../pages/login_page'
require_relative '../support/helpers_page'

World(Pages)
World(Actions)
World(Helpers)

CONFIG = YAML.load_file("#{File.dirname(__FILE__)}/data/hom.yml")

Capybara.register_driver :selenium do |app|
  @caps = Selenium::WebDriver::Remote::Capabilities.chrome(
    'goog:chromeOptions' => {
      'args' => ['--headless', '--disable-site-isolation-trials',
                 '--disable-gpu', '--start-maximized'],
      'excludeSwitches' => ['enable-logging']
    }
  )
  Capybara::Selenium::Driver.new(app, browser: :chrome, capabilities: @caps)
end

Capybara.configure do |config|
  include RSpec::Matchers
  config.default_driver = :selenium
  config.default_max_wait_time = 20
  config.app_host = CONFIG['url_home']
end

AllureCucumber.configure do |config|
  config.results_directory = '/logs'
  config.clean_results_directory = true
end
