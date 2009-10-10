class Registration < ActiveRecord::Base
  has_many :enrollments
  has_many :courses, :through => :enrollments
  accepts_nested_attributes_for :enrollments, :allow_destroy => true
end
