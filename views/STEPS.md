steps:


remove students id column from admin tbale

add admin column to students table

database migration to create admin code column(strings)name:classroom_code on Admins table

every time admin is created create new code for them 

class Topic < ActiveRecord::Base
  before_create :set_classroom_code

  private
    def set_classroom_code
      self.classroom_code = SecureRandom.hex(64)
    end
end