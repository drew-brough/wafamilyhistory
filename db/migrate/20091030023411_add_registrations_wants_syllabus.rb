class AddRegistrationsWantsSyllabus < ActiveRecord::Migration
  def self.up
    add_column :registrations, :wants_syllabus, :boolean
  end

  def self.down
    remove_column :registrations, :wants_syllabus
  end
end
