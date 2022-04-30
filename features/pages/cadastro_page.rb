#---> registration actions
class RegisterPage < SitePrism::Page
  set_url '/'
  element :btn_login, 'a[href="/users/sign_in"]'
  element :btn_singin_register, 'a[href="/users/sign_up"]'
  element :title_page_register, 'h4[class="title is-4 mb-5"]'
  element :email, '#user_email'
  element :passwd, '#user_password'
  element :confirm_passwd, '#user_password_confirmation'
  element :btn_register, 'input[type="submit"]'

  def access_site
    load
    page.has_title? 'Parodify | By Papito'
    btn_login.click
    btn_singin_register.click
  end

  def inform_dynamic_data
    title_page_register
    new_email = Faker::Internet.email(domain: 'gmail')
    new_password = Faker::Internet.password(min_length: 8)

    email.set new_email
    passwd.set new_password
    confirm_passwd.set new_password
  end

  def look_for_data
    table_usr = Roo::Spreadsheet.open(
      'test_mass/table_usr.xlsx'
    )
    @user = table_usr.sheet('massa_teste').cell('A', 3).to_s
    @passwd = table_usr.sheet('massa_teste').cell('B', 3).to_s
    @pss_confirm = table_usr.sheet('massa_teste').cell('C', 3).to_s
  end

  def insert_data
    email.set @user
    passwd.set @passwd
    confirm_passwd.set @pss_confirm
  end

  def msg_recommended
    find(:xpath, '//div[2]/h2[@class="is-size-5"]')
  end
end
