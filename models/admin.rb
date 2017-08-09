class Admin < ActiveRecord::Base
  has_many :students
  
  validates :name, presence: true
  validates :email, presence: true
end