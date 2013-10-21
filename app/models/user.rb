class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  validates :name, :email, :phone, presence: true
  has_secure_password
end
