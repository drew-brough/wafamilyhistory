class CreateCoursesRegistrations < ActiveRecord::Migration
  def self.up
    create_table :courses_registrations do |t|
      t.integer :course_id
      t.integer :registration_id

      t.timestamps
    end
  end

  def self.down
    drop_table :courses_registrations
  end
end
