class Student < ActiveRecord::Base
  has_many :activities
  belongs_to :administrator

  validates :name, presence: true
  validates :email, presence: true
end