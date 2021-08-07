class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.integer :number
      t.text :text
      t.string :photo_id
      t.references :plan, foreign_key: true

      t.timestamps
    end
  end
end
