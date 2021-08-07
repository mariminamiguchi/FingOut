class AddNameToPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :plans, :name, :string
  end
end
