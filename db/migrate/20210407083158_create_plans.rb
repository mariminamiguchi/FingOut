class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.string :topphoto_id

      t.timestamps
    end
  end
end
