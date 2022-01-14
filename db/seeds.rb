admin = User.create!(
  admin: true,
  name: "Jon Doe",
  email: "admin@example.com",
  password: "secretpwd"
)

company = admin.companies.create!(
  name: "ACME"
)

3.times do
  name = Faker::Name.unique.name
  email = name.downcase.split(' ').join('.') + '@acme.com'

  company.users.create!(
    name: name,
    email: email,
    password: 'secretpwd'
  )
end

app = company.create_oauth_application!(
  name: company.name,
  redirect_uri: 'https://example.com/callback',
)

puts 'Application: '
puts "name: #{app.name}"
puts "redirect_uri: #{app.redirect_uri}"
puts "uid: #{app.uid}"
puts "secret: #{app.secret}"