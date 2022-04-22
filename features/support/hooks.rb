Before do
  @regist = Register_page.new
  @login = Login_page.new
  page.driver.browser.manage.window.maximize
end

After do
  shot = page.save_screenshot("logs/temp_evidence.png")

  Allure.add_attachment(
    name: "Screenshot",
    type: Allure::ContentType::PNG,
    source: File.open(shot),
  )
end
