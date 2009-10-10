class Course < ActiveRecord::Base
  has_many :enrollments
  has_many :registrations, :through => :enrollments

  named_scope :live, :conditions => {:deleted_at => nil}
  named_scope :deleted, :conditions => "deleted_at IS NOT NULL"
end
