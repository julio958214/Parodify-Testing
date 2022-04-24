Dado('que o usuario acesse o site') do
  access_site
end

Quando('ele preencher dados dinamicos') do
  inform_dynamic_data
end

Quando('ele informar dados fixos') do
  look_for_data
  insert_data
end

Então('ele é cadastrado no site com sucesso') do
  regist.btn_register.click
  expect(page).to have_xpath('//div[2]/h2[@class="is-size-5"]', text: 'Recomendadas')
end