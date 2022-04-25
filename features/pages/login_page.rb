class LoginPage < SitePrism::Page
  set_url '/'
  element :btn_login, 'a[href="/users/sign_in"]'
  element :log_in, 'input[value="Log in"]'
  element :email, '#user_email'
  element :password, '#user_password'
  element :credential_error, 'div[class="message-body"]'
  element :logged_area, :xpath, '//div[2]/h2'
end

#---> login actions
module Actions
  def access_page_login
    login.load
    login.btn_login.click
  end

  def fill_email_passwd(email, passwd)
    login.email.set(email)
    login.password.set(passwd)
    login.log_in.click
  end

  def condition
    @result = false
    begin
      @result = login.credential_error.visible?
    rescue StandardError => e
      puts 'element not found'
    end
  end

  def msg_return
    condition

    if @result
      login.credential_error
    else
      login.logged_area
    end
  end
end
