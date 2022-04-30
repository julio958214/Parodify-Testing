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
World(Helpers)

BROWSER = ENV.fetch('BROWSER')
CONFIG = YAML.load_file("#{File.dirname(__FILE__)}/data/hom.yml")

Capybara.register_driver :selenium do |app|
  if BROWSER.eql?('chrome')
    caps_chrome = Selenium::WebDriver::Remote::Capabilities.chrome(
      'goog:chromeOptions' => { 'excludeSwitches' => ['enable-logging'] }
    )
    Capybara::Selenium::Driver.new(app, browser: :chrome, capabilities: caps_chrome)

  elsif BROWSER.eql?('chrome_headless')
    headless = Selenium::WebDriver::Remote::Capabilities.chrome(
      'goog:chromeOptions' => { 'args' => ['--headless'] }
    )
    Capybara::Selenium::Driver.new(app, browser: :chrome, capabilities: headless)

  elsif BROWSER.eql?('firefox')
    Capybara::Selenium::Driver.new(app, browser: :firefox)

  elsif BROWSER.eql?('firefox_headless')
    headless = Selenium::WebDriver::Firefox::Options.new(args: ['--headless'])
    Capybara::Selenium::Driver.new(app, browser: :firefox, capabilities: headless)

  elsif BROWSER.eql?('edge')
    edge = Selenium::WebDriver::Edge::Options.new(
      args: ['--edge'], excludeSwitches: ['enable-logging'])
    Capybara::Selenium::Driver.new(app, browser: :edge, capabilities: edge)

  elsif BROWSER.eql?('edge_headless')
    edge = Selenium::WebDriver::Edge::Options.new(
      args: ['--headless'])
    Capybara::Selenium::Driver.new(app, browser: :edge, capabilities: edge)
  end
end

Capybara.configure do |config|
  include RSpec::Matchers
  config.run_server = false
  config.default_driver = :selenium
  config.default_max_wait_time = 20
  config.app_host = CONFIG['url_home']
end

AllureCucumber.configure do |config|
  config.results_directory = '/logs'
  config.clean_results_directory = true
end
