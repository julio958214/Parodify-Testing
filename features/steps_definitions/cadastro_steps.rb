Dado('que o usuario acesse o site') do
  regist.access_site
end

Quando('ele preencher dados dinamicos') do
  regist.inform_dynamic_data
end

Quando('ele informar dados fixos') do
  regist.look_for_data
  regist.insert_data
end

Entao('ele acessa a home do site') do
  regist.btn_register.click
  expect(regist.msg_recommended).to have_text('Recomendadas')
end
