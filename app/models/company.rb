class Company < ApplicationRecord
  has_many :company_admins, dependent: :delete_all

  has_many :access_grants,
           class_name: "Doorkeeper::AccessGrant",
           foreign_key: :resource_owner_id,
           dependent: :delete_all # or :destroy if you need callbacks

  has_many :access_tokens,
           class_name: "Doorkeeper::AccessToken",
           foreign_key: :resource_owner_id,
           dependent: :delete_all # or :destroy if you need callbacks

  has_one :oauth_application,
           class_name: "Doorkeeper::Application",
           foreign_key: :resource_owner_id,
           dependent: :delete # or :destroy if you need callbacks

  has_many :users, -> { where admin: false },
            dependent: :delete_all
end
