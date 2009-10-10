class AddCourseDeletedAt < ActiveRecord::Migration
  def self.up
    add_column :courses, :deleted_at, :datetime
  end

  def self.down
    remove_column :courses, :deleted_at
  end
end
