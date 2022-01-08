class Login_page < SitePrism::Page
  set_url "/"
  element :btn_login, "a[href='/users/sign_in']"
  element :log_in, "input[value='Log in']"
  element :email, "#user_email"
  element :password, "#user_password"
  element :credential_error, "div[class='message-body']"
  element :logged_area, :xpath, "//div[2]/h2"
end
