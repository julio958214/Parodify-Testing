#---> Methods to instantiate classes
module Pages
  def login
    @login ||= LoginPage.new
  end

  def regist
    @regist ||= RegisterPage.new
  end
end
