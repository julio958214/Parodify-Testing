Dado("que o usuario acesse o site") do
  access_site
end

Quando("ele preencher dados dinamicos") do
  inform_dynamic_data
end

Quando("ele informar dados fixos") do
  inform_fixed_data
end

Então("ele é cadastrado no site com sucesso") do
  expect(page).to have_xpath("//div[2]/h2[@class='is-size-5']", :text => "Recomendadas")
end
