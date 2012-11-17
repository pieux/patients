class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :medical_record_number
      t.date :birthdate
      t.string :gender
      t.string :status
      t.integer :view_count
      t.integer :user_id

      t.timestamps
    end
  end
end
