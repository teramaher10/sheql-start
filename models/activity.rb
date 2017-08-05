class Activity < ActiveRecord::Base
  belongs_to :student

  validates :supervisor, presence: true
  validates :location, presence: true
  validates :email, presence: true
  validates :description, presence: true
  validates :hours, presence: true
end