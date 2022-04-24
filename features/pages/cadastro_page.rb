class Register_page < SitePrism::Page
  set_url "/"
  element :btn_login, "a[href='/users/sign_in']"
  element :btn_singin_register, "a[href='/users/sign_up']"
  element :title_page_register, "h4[class='title is-4 mb-5']"
  element :email, "#user_email"
  element :passwd, "#user_password"
  element :confirm_passwd, "#user_password_confirmation"
  element :btn_register, "input[type='submit']"
end

module Actions
  def access_site
    regist.load
    expect(page).to have_current_path("https://parodify.herokuapp.com", url: true)
    page.has_title? "Parodify | By Papito"
    regist.btn_login.click
    regist.btn_singin_register.click
  end

  def inform_dynamic_data
    regist.title_page_register
    new_email = Faker::Internet.email(domain: "gmail")
    new_password = Faker::Internet.password(min_length: 8)

    regist.email.set new_email
    regist.passwd.set new_password
    regist.confirm_passwd.set new_password
  end

  def inform_fixed_data
    table_usr = Roo::Spreadsheet.open("test_mass/table_usr.xlsx")

    @user = table_usr.sheet("massa_teste").cell("A", 3).to_s
    @passwd = table_usr.sheet("massa_teste").cell("B", 3).to_s
    @pss_confirm = table_usr.sheet("massa_teste").cell("C", 3).to_s

    regist.email.set @user
    regist.passwd.set @passwd
    regist.confirm_passwd.set @pss_confirm
  end
end
