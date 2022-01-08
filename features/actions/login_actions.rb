module Actions
  def access_page_login
    @login.load
    @login.btn_login.click
  end

  def fill_email_passwd(email, passwd)
    @login.email.set(email)
    @login.password.set(passwd)
    @login.log_in.click
  end

  def msg_return
    result = false

    begin
      result = @login.credential_error.visible?
    rescue => exception
      puts "element not found"
    end

    if result
      @login.credential_error
    else
      @login.logged_area
    end
  end
end
