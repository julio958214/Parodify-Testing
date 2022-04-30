Before do
  page.driver.browser.manage.window.maximize
end

AfterStep do
  shot = page.save_screenshot('logs/temp_evidence.png')

  Allure.add_attachment(
    name: 'Screenshot',
    type: Allure::ContentType::PNG,
    source: File.open(shot)
  )
end
