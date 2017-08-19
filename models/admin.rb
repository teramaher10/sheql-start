class Admin < ActiveRecord::Base
  has_many :students
  validates :name, presence: true
  validates :email, presence: true
  
  before_create :set_classroom_code

  private
    def set_classroom_code
      self.classroom_code = SecureRandom.hex(64)
    end
end