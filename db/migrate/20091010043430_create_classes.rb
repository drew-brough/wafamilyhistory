class CreateClasses < ActiveRecord::Migration
  def self.up
    create_table :classes do |t|
      t.string :name
      t.string :instructor
      t.time :starttime
      t.string :note

      t.timestamps
    end
  end

  def self.down
    drop_table :classes
  end
end
