class CreateHashtagRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :hashtag_relations do |t|
      t.references :plan, index: true, foreign_key: true
      t.references :hashtag, index: true, foreign_key: true

      t.timestamps
    end
  end
end
