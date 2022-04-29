Dado('que o usuario acesse a pagina de login') do
  login.access_page_login
end

Quando('ele submeter seu login com:') do |table|
  info = table.rows_hash
  login.fill_email_passwd(info[:email], info[:passwd])
  delorean
end

Entao('ele visualiza a mensagem: {string}') do |string|
  expect(login.success_message).to eq string
end
