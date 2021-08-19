class AddHeaddingToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :headding, :string
  end
end
