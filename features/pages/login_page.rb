#---> login actions
class LoginPage < SitePrism::Page
  set_url '/'
  element :btn_login, 'a[href="/users/sign_in"]'
  element :log_in, 'input[value="Log in"]'
  element :credential_error, 'div[class="message-body"]'
  element :logged_area, :xpath, '//div[2]/h2'

  def access_page_login
    load
    btn_login.click
  end

  def fill_email_passwd(email, passwd)
    find('#user_email').set(email)
    find('#user_password').set(passwd)
    log_in.click
  end

  def condition
    @result = false
    begin
      @result = credential_error.visible?
    rescue StandardError
      puts 'element not found'
    end
  end

  def success_message
    condition

    if @result
      credential_error.text
    else
      logged_area.text
    end
  end
end
