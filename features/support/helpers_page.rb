module Pages
  def login
    @login_page ||= Login_page.new
  end

  def regist
    @register_page ||= Register_page.new
  end
end
