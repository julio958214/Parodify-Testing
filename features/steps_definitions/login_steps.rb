Dado('que o usuario acesse a pagina de login') do
  access_page_login
end

Quando('ele submeter seu login com:') do |table|
  info = table.rows_hash
  fill_email_passwd(info[:email], info[:passwd])
  delorean
end

Então('ele visualiza a mensagem: {string}') do |string|
  expect(msg_return.text).to eq string
end