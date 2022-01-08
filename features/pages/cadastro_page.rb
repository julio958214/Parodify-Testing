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
