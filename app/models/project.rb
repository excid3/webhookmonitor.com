class Project < ApplicationRecord
  belongs_to :user
  has_many :events

  has_secure_token
end
