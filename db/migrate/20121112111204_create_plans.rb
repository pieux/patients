class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.text :content

      t.timestamps
    end
  end
end
