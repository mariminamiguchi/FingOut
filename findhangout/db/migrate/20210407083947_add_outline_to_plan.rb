class AddOutlineToPlan < ActiveRecord::Migration[5.2]
  def change
    add_column :plans, :outline, :string
  end
end
