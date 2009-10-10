class CoursesRegistration < ActiveRecord::Base
  belongs_to :course
  belongs_to :registration
end
