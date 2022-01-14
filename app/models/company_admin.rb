class CompanyAdmin < ApplicationRecord
  belongs_to :admin, class_name: User.name
  belongs_to :company
end
