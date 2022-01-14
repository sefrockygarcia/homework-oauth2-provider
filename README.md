# Goal
- [ ] A company model that has CompanyAdmins (which is a join table to Users)
- [ ] The company is an owner of OAuth2 applications. When you create the company the OAuth2 application, client ID, and secret are all auto-created.
- [ ] The company admins can look at the company page to (1) copy the client ID and secret for use with a provisioning script, and (2) click a button that would refresh the secret (invalidating any live auth tokens/credentials created with the old client ID and secret.
- [ ] The company tech guy can use the client id and secret to connect to the server and obtain an auth token (OAuth2 will use the Client Credentials flow).
- [ ] The company tech can, with the auth token, make requests to an endpoint at GET /api/users to retrieve a json list of users.
- [ ] The company tech can, with the auth token, make requests to an endpoint at POST /api/users to create a new user.
- [ ] The company tech can, with the auth token, make requests to an endpoint at PUT /api/users/:id to update a specific user's name.

# Requirements
1. Ruby 3.0.3
2. Rails 6.1.4.4 
3. Yarn

# How to run the project
1. `bundle install`
2. `bundle exec rails db:setup`
3. `bundle exec rails server`