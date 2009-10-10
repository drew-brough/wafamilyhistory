class CreateRegistrations < ActiveRecord::Migration
  def self.up
    create_table :registrations do |t|
      t.string :given_name
      t.string :surname
      t.string :email
      t.string :lunch

      t.timestamps
    end
  end

  def self.down
    drop_table :registrations
  end
end
