class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :registerable, :recoverable
  devise :database_authenticatable, :rememberable, :validatable

  has_many :company_admins,
            foreign_key: :admin_id
  has_many :companies, 
            through: :company_admins

  belongs_to :company, optional: true

  # Override devise method to only sign in admin user
  def self.find_for_authentication(warden_conditions)
    where(:email => warden_conditions[:email], :admin => true).first
  end
end
