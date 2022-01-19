# OAuth Provider App
As an OAuth Provider, I allow the Client App to be authorized so that they can access API's like:
```
GET /api/users.json
POST /api/users.json
PUT /api/users/:id.json
DELETE /api/users/:id.json
```

## Requirements

 1. Ruby -v 3.0.3
 2. Rails -v 6.1.4.4
 3. Yarn

## Guide

 1. Run `bundle install`
 2. Run `rails db:create db:migrate`
 3. Set ENV variable `export CLIENT_URL=http://localhost:3001`
 4. Run `rails server`
 5. Demo video [here](https://drive.google.com/file/d/1iaNihKpNIVmPJkHq_t4RcTUQ354MMV8a/view?usp=sharing)