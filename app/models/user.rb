class User < ActiveRecord::Base
  has_many :surveys
  has_many :choice_users
  validates :email, uniqueness: true
  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "that is not a valid email"}
end
