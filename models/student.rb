class Student < ActiveRecord::Base
  has_many :activities

  validates :name, presence: true
  validates :email, presence: true
end