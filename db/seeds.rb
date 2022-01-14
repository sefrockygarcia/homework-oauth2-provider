admin = User.create!(
  admin: true,
  name: "Jon Doe",
  email: "admin@acme.com",
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